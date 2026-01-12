# Folklore Detection Checklist (Minimal)

Use this checklist to quickly spot areas where undocumented knowledge may be hiding.

---

## 1. Code & Config

- [ ] Are there critical code paths only one person understands?
- [ ] Do config files or env vars lack explanatory comments?
- [ ] Is there "magic" logic with no documented rationale?

## 2. Operations & Incidents

- [ ] Are runbooks missing or outdated for key failure modes?
- [ ] Do incident responses rely on tribal memory ("ask Jamie")?
- [ ] Are deployment steps documented and version-controlled?

## 3. Decisions & History

- [ ] Are major architectural decisions captured in ADRs or docs?
- [ ] Is there context for *why* things are built a certain way?
- [ ] Can new team members find the reasoning behind legacy code?

## 4. Team & Process

- [ ] Are onboarding docs current and comprehensive?
- [ ] Is there a single point of failure for critical knowledge?
- [ ] Do regular reviews surface undocumented risks?

---

## Quick Scoring

| Risk Level | Criteria                                 |
|------------|------------------------------------------|
| 🔴 High    | 3+ unchecked in any section              |
| 🟡 Medium  | 1–2 unchecked per section                |
| 🟢 Low     | All boxes checked                        |

**Action:** Prioritize high-risk areas for documentation sprints or pairing sessions.
