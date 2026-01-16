#!/bin/bash
set -euo pipefail

# Variables - EDIT THESE
NEW_USER="adminuser"
SSH_PUB_KEY="ssh-ed25519 AAAA... your-key-here"

# Update system
dnf upgrade --refresh -y

# Install essentials
dnf install -y epel-release
dnf install -y fail2ban firewalld

# Create admin user
useradd -m -s /bin/bash "$NEW_USER"
usermod -aG wheel "$NEW_USER"

# Set up SSH key
mkdir -p /home/$NEW_USER/.ssh
echo "$SSH_PUB_KEY" > /home/$NEW_USER/.ssh/authorized_keys
chmod 700 /home/$NEW_USER/.ssh
chmod 600 /home/$NEW_USER/.ssh/authorized_keys
chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh

# SSH hardening
cat > /etc/ssh/sshd_config.d/10-hardening.conf << 'SSHEOF'
PermitRootLogin no
PasswordAuthentication no
PermitEmptyPasswords no
KbdInteractiveAuthentication no
MaxAuthTries 3
ClientAliveInterval 300
ClientAliveCountMax 3
SSHEOF

# Validate and reload SSH
sshd -t && systemctl reload sshd

# Configure firewall
systemctl enable --now firewalld
firewall-cmd --set-default-zone=public
# SSH is allowed by default in public zone

# Configure fail2ban
cat > /etc/fail2ban/jail.local << 'F2BEOF'
[DEFAULT]
bantime = 1h
findtime = 10m
maxretry = 5

[sshd]
enabled = true
port = ssh
backend = systemd
F2BEOF

systemctl enable fail2ban
systemctl start fail2ban

# Time sync
dnf install -y chrony
systemctl enable --now chronyd
timedatectl set-ntp true

# Persistent journald
mkdir -p /var/log/journal
systemd-tmpfiles --create --prefix /var/log/journal
systemctl restart systemd-journald

echo "Bootstrap complete. Test SSH access as $NEW_USER before closing this session!"
