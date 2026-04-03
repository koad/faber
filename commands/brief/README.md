---
status: draft
owner: faber
priority: high
description: Generate a content brief for Rufus with strategic context and success criteria
---

## Purpose

The `faber brief` command translates strategy into specific production assignments. It guides Rufus on what to produce, for whom, why, and how to measure success.

## Interface

```bash
faber brief <topic>
```

**Arguments:**
- `topic` (required): Topic or content goal (e.g., "koad:io positioning for platform adopters")

**Output:** 
- Creates `BRIEF_[topic]_[date].md` with complete brief
- Files issue on koad/rufus with brief content
- Links to STRATEGY.md and AUDIENCE_SEGMENTS.md context

## Specification

**Brief generated with:**
- Strategic context (why this content now, goals)
- Audience segment and messaging framework
- Content format and key messages
- Success criteria and acceptance deadline
- Links to reference materials (Sibyl research, Iris positioning)

**Example usage:**
```bash
faber brief "koad:io positioning for platform adopters"
```

Creates `BRIEF_koad:io_positioning_platform_adopters_2026-04-03.md` and files on koad/rufus

## Dependencies

- STRATEGY.md must be populated
- AUDIENCE_SEGMENTS.md must be available
- GitHub CLI (gh) for issue filing
- koad/rufus repository access

## Testing

Acceptance criteria:
- [ ] Brief command generates valid markdown
- [ ] GitHub issue filed correctly with brief content
- [ ] Links to strategy context are working
- [ ] Rufus can clearly understand what to produce
- [ ] Brief archive system tracks deliveries

## Status Note

Blocked on STRATEGY.md and AUDIENCE_SEGMENTS.md completion.
