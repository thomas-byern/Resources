# ADR: Use polling instead of webhooks for payment status updates

**Date:** 2025-09-15 \
**Status:** Accepted \
**Context:** We need to track payment status from our payment processor. 
They offer both webhook notifications and a status polling API.

**Decision:** Use polling on a 30-second interval rather than webhooks.

**Rationale:** Our current infrastructure doesn't have a reliable way to 
handle webhook delivery failures and retries. Building that properly is 
estimated at 3 weeks. Polling is less efficient but works reliably with 
our current setup. Payment status updates are not time-critical for our 
use case (batch processing runs hourly).

**Alternatives considered:**
- Webhooks with basic retry: Rejected due to risk of missed updates
- Third-party webhook relay service: Adds external dependency, cost unclear
- Build proper webhook infrastructure: Correct long-term, but delays launch

**Consequences:** Higher API usage, slight increase in processing latency. 
Should revisit when we build event infrastructure (tentatively Q2 2026).
