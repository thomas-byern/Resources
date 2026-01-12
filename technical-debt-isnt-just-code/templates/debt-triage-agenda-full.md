# Debt Triage Agenda

A structured 30-minute meeting to make technical debt visible, manageable, and actionable.

---

## Meeting Details

| Field | Value |
|-------|-------|
| **Frequency** | Every 2 weeks (end of sprint recommended) |
| **Duration** | 30 minutes (strict timebox) |
| **Attendees** | Engineering team + optional product representative |
| **Facilitator** | Rotating (a different team member each session) |

---

## Before the Meeting

- [ ] Facilitator reviews the existing debt log for context
- [ ] Team members note any friction they encountered during the sprint
- [ ] Pull up the debt log/backlog for screen sharing

---

## Agenda

### [0:00 - 0:02] Opening (2 min)

**Facilitator reads aloud:**

> "We're here to make debt visible and pick one thing to address. This isn't about blame or solving everything. We acknowledge trade-offs, note what's causing friction, and commit to one improvement."

- Confirm note-taker for this session (can be facilitator or volunteer)
- Quick check: anyone have a hard stop before :30?

---

### [0:02 - 0:10] New Debt Check-in (8 min)

**Prompt:** "What shortcuts or trade-offs did we consciously take this sprint?"

Go around the room (or async thread). For each item, capture:

| Item | Category | One-line Description |
|------|----------|----------------------|
| _example: skipped integration tests for payment flow_ | Code | Deadline pressure, plan to add next sprint |
| | Code / Context / Dependency | |
| | Code / Context / Dependency | |
| | Code / Context / Dependency | |

**Category definitions:**
- **Code:** Implementation shortcuts, missing tests, weak abstractions
- **Context:** Undocumented decisions, missing rationale, tribal knowledge
- **Dependency:** Outdated libraries, version drift, unsupported tools

**Facilitator note:** No judgment here. The goal is acknowledgment, not critique. If someone took a shortcut, they probably had a good reason.

---

### [0:10 - 0:18] Friction Review (8 min)

**Prompt:** "What existing debt slowed us down or caused pain in the last two weeks?"

Look at:
- Incidents or near-misses
- Tasks that took way longer than estimated
- Areas of the codebase people actively avoided
- Questions new team members kept asking
- Recurring mysteries ("it just does that sometimes")

| Friction Item | Votes | Notes |
|---------------|-------|-------|
| | ⭐ | |
| | ⭐ | |
| | ⭐ | |

**Voting:** Each person gets 2 stars. Give them to items you personally experienced or that you believe are costing the team the most.

---

### [0:18 - 0:27] Prioritization & Commitment (9 min)

**Review the starred items from Friction Review.**

Discussion prompts:
- Which item is causing the most ongoing pain?
- Which item is cheapest to address (quick win)?
- Which item is blocking other improvements?

**Commit to ONE item:**

| Commitment | Owner | Target Sprint | Scope |
|------------|-------|---------------|-------|
| | | | Investigation / Partial fix / Full resolution |

**Important:** The owner doesn't have to fix it alone. They're responsible for ensuring progress happens, even if that means scoping the work, pairing with someone, or escalating.

If the team can't agree, facilitator makes the call. Indecision is more expensive than an imperfect choice.

---

### [0:27 - 0:30] Closing (3 min)

**Facilitator summarizes:**

1. **New debt logged this session:**
   - (list items)

2. **Friction items noted:**
   - (list top voted items)

3. **Commitment for next sprint:**
   - Item: _______________
   - Owner: _______________

4. **Escalations needed:**
   - [ ] Needs architectural review
   - [ ] Needs product input on prioritization
   - [ ] Bigger than a sprint task (needs breakdown)

**Next facilitator:** _______________

---

## Outputs Checklist

After each session, ensure you have:

- [ ] Updated debt log/backlog with new items from today
- [ ] One committed action item with an owner assigned
- [ ] Notes on friction items for future reference
- [ ] Any escalation flags communicated to relevant people

---

## Tips for Facilitators

**Keep it moving.** The timebox is the feature, not a constraint. If a discussion is running long, note the topic for follow-up and move on.

**Normalize trade-offs.** Debt isn't failure. Every team takes on debt. The failure is not tracking it.

**Celebrate paydowns.** When a previous commitment gets completed, acknowledge it briefly. Positive reinforcement keeps the practice alive.

**Rotate facilitation.** This spreads context and prevents the meeting from becoming "that person's thing."

**Skip the guilt.** If the team didn't complete last sprint's commitment, briefly discuss why and decide whether to recommit or pick something else. Don't dwell.

**Watch for patterns.** If the same areas keep appearing in Friction Review, that's a signal. Might be time for a larger investment rather than incremental fixes.

---

## Quarterly Review (Optional)

Every 3 months, consider a longer session (60-90 min) to:

- Review the full debt log and archive resolved items
- Identify patterns or systemic issues
- Discuss whether any debt items need escalation to roadmap-level priority
- Reflect on whether the triage process itself is working

---

*Template version 1.0 — Adapt freely for your team's needs.*
