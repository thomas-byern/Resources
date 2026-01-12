# ADR-0012: Migrate user auth to OAuth 2.0 with PKCE

**Status:** Accepted  \
**Date:** 2025-06-14  \
**Author(s):** @jkovalsky, @mnovak  \
**Tags:** #auth #security #api

---

## Context

Our current session-based authentication relies on server-side cookies and a custom token scheme introduced in 2019. This approach has led to:

- Frequent token-refresh bugs on mobile clients
- Inability to support third-party integrations securely
- Recurring security audit findings around token storage

The platform team has flagged this as a blocker for the upcoming partner API launch (Q3 target).

---

## Decision

We will migrate to **OAuth 2.0 with PKCE** (Proof Key for Code Exchange) for all client authentication, using our existing identity provider (Okta) as the authorization server.

Key implementation points:
- PKCE flow for all public clients (mobile, SPA)
- Short-lived access tokens (15 min), refresh tokens (7 days, rotating)
- Deprecate legacy `/auth/token` endpoint by 2025-09-01

---

## Alternatives Considered

| Option                         | Why Not Chosen                                      |
|--------------------------------|-----------------------------------------------------|
| Keep current custom tokens     | Security risks; blocks partner integrations         |
| OAuth 2.0 without PKCE         | Vulnerable to authorization code interception       |
| Switch to passwordless (WebAuthn) | Higher implementation cost; deferred to Phase 2   |

---

## Consequences

**Positive:**
- Aligns with industry security standards
- Enables secure third-party API access
- Reduces token-related support tickets

**Negative/Risks:**
- Migration requires client-side changes (mobile app release cycle)
- Legacy integrations need deprecation communication
- Short-term increase in auth-related support load during rollout

---

## References

- [OAuth 2.0 for Mobile & Native Apps (RFC 8252)](https://datatracker.ietf.org/doc/html/rfc8252)
- Internal: `docs/security/token-handling.md`
- Slack thread: #platform-auth, 2025-06-10
