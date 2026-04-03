---
status: draft
owner: faber
priority: high
description: Generate or update 3-month rolling content calendar with strategy, dates, and audience alignment
---

## Purpose

The `faber calendar` command creates and maintains a 3-month rolling view of planned content. It ensures Rufus has a production roadmap and Mercury knows what content is coming.

## Interface

```bash
faber calendar [quarter] [--refresh]
```

**Arguments:**
- `quarter` (optional): Target quarter (e.g., "Q2 2026", defaults to current)
- `--refresh` (optional): Update current quarter with latest strategy

**Output:** Updates `CALENDAR.md` with structured content plan

## Specification

**Calendar includes per content piece:**
- Content title and description
- Content format (doc, video, demo, post, thread, etc.)
- Target audience segment
- Distribution channel(s)
- Production deadline (when Rufus should complete)
- Release date (when Mercury should distribute)
- Strategic goal alignment
- Priority (critical/high/medium/low)

**Format:** Markdown table with timeline, linked to strategy documents

**Example:**
```bash
faber calendar Q2 2026
```

Generates CALENDAR.md with Q2 2026 content roadmap based on STRATEGY.md priorities

## Dependencies

- STRATEGY.md (content priorities)
- AUDIENCE_SEGMENTS.md (audience mapping)
- Rufus capacity planning (production estimates)
- Mercury channel calendar (distribution timing)

## Testing

Acceptance criteria:
- [ ] Calendar generated with all planned content
- [ ] Dates are realistic based on Rufus capacity
- [ ] Mercury confirms channel availability
- [ ] Strategy-to-calendar traceability is clear
- [ ] Quarterly refresh process is documented

## Status Note

Blocked on STRATEGY.md completion and Rufus/Mercury capacity input.
