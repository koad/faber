# Faber Documentation

## How Faber Operates

This directory contains operational guides and reference material for Faber's role in the koad:io ecosystem.

## Key References

### Strategy & Planning
- **STRATEGY.md** — Current content strategy, roadmap, quarterly goals
- **CALENDAR.md** — 3-month rolling content calendar with priorities
- **EDITORIAL.md** — Editorial guidelines, voice, tone, brand alignment
- **AUDIENCE_SEGMENTS.md** — Target audiences, messaging per segment, engagement tactics

### Production & Distribution
- **BRIEFING_TEMPLATE.md** — Standard brief format for assigning content to Rufus
- **DISTRIBUTION_CHANNELS.md** — Channel analysis, performance metrics, audience reach
- **PARTNERSHIPS.md** — Content partnerships, guest strategies, cross-promotion

### Team Integration
- **TEAM_WORKFLOWS.md** — How Faber collaborates with Sibyl, Iris, Rufus, Mercury, Juno
- **GITHUB_OPERATIONS.md** — Issue workflow, assignment protocol, feedback loops
- **TRUST_BONDS.md** — Authorization scope, peer relationships, consent gestures

### Performance & Iteration
- **PERFORMANCE_METRICS.md** — How to measure content success
- **FEEDBACK_LOOPS.md** — How to adapt strategy based on performance
- **STRATEGY_REVIEWS.md** — Quarterly strategy reviews and updates

## Operational Principles

1. **Strategy is Sovereign** — Stored in git, owned by Faber, evolves with every commit
2. **Synthesis First** — Listen to all inputs (Sibyl, Iris, Rufus, Mercury), make coherent decisions
3. **Feedback Loops** — Observe what works, iterate, update strategy
4. **Simplicity Over Completeness** — Strategy should be clear and actionable, not exhaustive
5. **Async & Transparent** — All decisions documented, async-first communication

## First-Time Setup

When Faber wakes up (Claude Code session):

1. `git pull` — sync with remote
2. `git status` — check for uncommitted changes
3. `gh issue list --state open` — what work is pending?
4. Review MEMORY.md for active context
5. Begin work on highest-priority issue

## Updating Strategy

When you update strategy documents:

1. Edit the relevant file (STRATEGY.md, CALENDAR.md, etc.)
2. Commit with clear message: `git commit -m "strategy: update Q2 calendar and priorities"`
3. Push immediately: `git push`
4. Comment on related GitHub issues with summary

## Communication with Team

**Assigning work to Rufus:**
- Use `faber brief <topic>` (when implemented) or manually create a brief
- File issue on koad/rufus with brief attached
- Rufus comments when complete, links back to issue

**Aligning with Iris:**
- Share positioning/messaging updates in comments on GitHub
- Request review on messaging framework changes
- Track approvals in issue timeline

**Feeding intelligence to Sibyl:**
- Comment on content performance from Mercury
- Ask research questions via GitHub issues
- Track research output as it arrives

**Coordinating with Mercury:**
- Share distribution strategy & channel priorities
- Request performance analysis
- Update calendar based on channel feedback

---

See [../CLAUDE.md](../CLAUDE.md) for full entity context.
