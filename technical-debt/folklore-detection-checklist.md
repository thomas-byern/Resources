# Folklore Detection Checklist

A practical tool for identifying areas where context has degraded into tribal knowledge.

---

## What is "folklore"?

In a codebase, **folklore** is knowledge that exists only as oral tradition, unquestioned assumptions, or vague warnings. It's the stuff that "everyone knows" but nobody wrote down—and when the people who know it leave, the knowledge disappears while the constraints remain.

Folklore isn't necessarily wrong. Often it reflects real lessons learned. But undocumented folklore becomes invisible risk: you can't evaluate it, challenge it, or know when it no longer applies.

Use this checklist during retrospectives, onboarding reviews, or periodic codebase health assessments.

---

## Code & Architecture

Signs that context has been lost in the implementation itself.

- [ ] There's code that "nobody touches" without a clear, documented reason
- [ ] Comments say `DO NOT CHANGE`, `HERE BE DRAGONS`, or similar without explanation
- [ ] Configuration values are set to specific numbers that nobody can justify
- [ ] Features are "temporarily disabled" and have been for over a year
- [ ] Workarounds exist for bugs in dependencies that may have been fixed long ago
- [ ] Dead code is kept "just in case" because nobody knows if it's actually dead
- [ ] Certain patterns are followed religiously but nobody remembers why
- [ ] There are wrapper functions or abstraction layers with no clear purpose
- [ ] Copy-pasted code exists because "the original is too risky to make reusable"
- [ ] Test files are skipped or commented out with no explanation

---

## Operational

Signs that folklore is embedded in how you run the system.

- [ ] Runbooks contain steps explained as "just do it" with no rationale
- [ ] Certain error messages prompt "restart and hope" as the standard response
- [ ] Monitoring alerts fire regularly but everyone ignores them ("it always does that")
- [ ] There are manual processes that "must" happen at specific times with no documented reason
- [ ] Incident response involves rituals nobody fully understands
- [ ] Some services require a specific startup order that isn't documented
- [ ] Environment-specific configuration exists with no record of why environments differ
- [ ] Deployment has "known flaky" steps that sometimes need to be retried
- [ ] Certain operations are only done by specific people "because they know how"
- [ ] Post-incident reviews frequently cite "unexpected behavior" in old systems

---

## Team & Knowledge

Signs that context lives in people's heads rather than in artifacts.

- [ ] Knowledge is concentrated in one or two people ("ask them, they'll know")
- [ ] New hires repeatedly ask the same questions with no written answers
- [ ] Onboarding takes months before someone feels confident making changes
- [ ] Certain areas have informal "owners" because no one else will touch them
- [ ] Team members express fear about modifying specific parts of the system
- [ ] Estimates balloon for changes that "should be simple"
- [ ] There's heavy reliance on people who were "there when it was built"
- [ ] When those long-tenured people are on vacation, certain work stops
- [ ] Explanations frequently start with "historically, we..." with no written history
- [ ] Decisions from years ago are referenced but nobody can find the original discussion

---

## Documentation

Signs that what's written down isn't capturing what matters.

- [ ] Slack threads or old tickets are cited as "documentation" for decisions
- [ ] Git blame shows significant changes with no meaningful commit messages
- [ ] README files describe how to run code but not why it exists
- [ ] Architecture diagrams are clearly outdated but still referenced
- [ ] There are no ADRs or decision records for major technical choices
- [ ] API documentation exists but doesn't explain the "why" behind design choices
- [ ] Wikis or docs have large sections marked "TODO" or "needs update"
- [ ] New team members create their own personal notes because official docs don't help
- [ ] The same explanations are given verbally over and over but never written down
- [ ] When asked "why is it this way?", the answer is often "I don't know, it's always been like that"

---

## Scoring

Count your checked boxes and assess your context debt level:

| Checked | Level | Interpretation |
|---------|-------|----------------|
| 0 – 5   | Low | Normal healthy codebase. Some folklore is inevitable. |
| 6 – 12  | Moderate | Context debt is accumulating. Worth addressing proactively. |
| 13 – 20 | High | Significant friction likely. Prioritize documentation and knowledge capture. |
| 21 – 30 | Critical | Major risk. Knowledge loss could cause serious incidents. Needs immediate attention. |
| 31+     | Severe | The system is held together by oral tradition. Consider dedicated remediation effort. |

**Note:** Not all folklore is equally expensive. A few items in critical paths can be worse than many items in low-traffic areas. Use this as a starting point for conversation, not a precise measurement.

---

## What To Do Next

If you've identified significant folklore, here's how to start addressing it:

**Immediate (this week):**
1. Pick the 3 most painful items from your checked boxes
2. For each one, identify who currently holds the knowledge
3. Schedule 30 minutes with that person to extract and document the context

**Short-term (this month):**
4. Create a mini-ADR or decision note for each item, capturing what you learn
5. Add the remaining high-priority items to your debt backlog
6. Introduce "why" prompts in your PR template to prevent new folklore

**Ongoing:**
7. Add folklore detection to your onboarding process—new hires are excellent at spotting it
8. Run this checklist quarterly or after significant team changes
9. Celebrate when folklore gets documented—make knowledge capture visible and valued

---

## Using This Checklist

**In a retrospective:** Walk through each section as a team. Check boxes together and discuss patterns.

**During onboarding:** Have new team members complete this after their first month. Their fresh perspective catches things veterans have normalized.

**Quarterly review:** Track your score over time. A decreasing count means you're making progress.

**After incidents:** If a postmortem reveals "we didn't know X," add relevant checklist items and assess whether similar gaps exist elsewhere.

---

*Folklore isn't a moral failing—it's an inevitability. The goal isn't zero folklore; it's making the important stuff visible before it costs you.*
