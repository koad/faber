# Feature: Content Briefs for Rufus

**Status:** Planned (unbuilt)  
**Owner:** Faber  
**Scope:** Create standardized content briefs for production

## Description

Develop standardized content brief format that translates strategy into specific production assignments for Rufus.

## Capability

**What:** Create detailed content briefs that specify what to produce, for whom, key messages, success criteria

**For whom:** Rufus (primary consumer)

**Inputs needed:**
- Strategic priorities from STRATEGY.md
- Audience segments and messaging from AUDIENCE_SEGMENTS.md
- Channel performance data from Mercury

**Output:**
- Content briefs (GitHub issues or markdown documents)
- Briefing template (BRIEFING_TEMPLATE.md)
- Production queue with priorities

## Brief Structure

```
# Brief: [Content Title]

## Context
- Why this content now?
- Strategic goal
- Target audience
- Key constraint (deadline, format, scope)

## What to Produce
- Format (doc, video, demo, tweet thread, etc.)
- Key messages (3-5 bullets)
- Success criteria (audience, engagement, leads)

## Audience
- Who is this for?
- What do they care about?
- Where do they hang out?

## Acceptance Criteria
- Drafted by: [date]
- Review deadline: [date]
- Production deadline: [date]
- Approval: [Faber/Iris]

## Notes
- Constraints
- Reference materials
- Similar past work
```

## How It Works

1. Identify priority content from STRATEGY.md
2. Write brief using template
3. File issue on koad/rufus with brief
4. Rufus starts production, asks clarifying questions
5. Iterate on brief based on feedback
6. Rufus delivers, links back to issue
7. Archive brief + output in LOGS

## Implementation Plan

- [ ] Design brief template
- [ ] Build brief generator (CLI command)
- [ ] Create first 3 briefs
- [ ] Set up feedback loop with Rufus
- [ ] Document approval workflow
- [ ] Create brief archive system

---

**Issue:** [koad/faber#2](https://github.com/koad/faber/issues/2) — Implement content brief system
