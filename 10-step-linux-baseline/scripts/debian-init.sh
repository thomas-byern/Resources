#!/bin/bash
set -euo pipefail

# Variables - EDIT THESE
NEW_USER="adminuser"
SSH_PUB_KEY="ssh-ed25519 AAAA... your-key-here"

# Update system
apt update && apt upgrade -y

# Install essentials
apt install -y sudo ufw fail2ban

# Create admin user
adduser --disabled-password --gecos "" "$NEW_USER"
usermod -aG sudo "$NEW_USER"

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
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable

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
timedatectl set-ntp true

# Persistent journald
mkdir -p /var/log/journal
systemd-tmpfiles --create --prefix /var/log/journal
systemctl restart systemd-journald

echo "Bootstrap complete. Test SSH access as $NEW_USER before closing this session!"
