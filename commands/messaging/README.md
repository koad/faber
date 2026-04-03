---
status: draft
owner: faber
priority: high
description: Develop or update messaging framework for a specific audience segment aligned with brand
---

## Purpose

The `faber messaging` command creates tailored messaging strategies for specific audience segments. It ensures consistent, resonant messaging across all content targeting that segment and aligns with Iris brand direction.

## Interface

```bash
faber messaging <segment>
```

**Arguments:**
- `segment` (required): Audience segment (e.g., "platform-adopters", "developers", "enterprises")

**Output:** Creates or updates segment-specific messaging document with brand alignment

## Specification

**Messaging framework includes:**
- Segment description (who they are, what they do)
- Pain points and goals (what problems they face)
- Key messages (3-5 core messages resonating with segment)
- Tone and voice (how to talk to this segment)
- Content angles (how to frame koad:io for this segment)
- Success criteria (how to measure if messaging lands)
- Iris brand alignment (approval status)

**Example:**
```bash
faber messaging "platform-adopters"
```

Creates/updates `MESSAGING_platform-adopters.md` with tailored framework

## Dependencies

- AUDIENCE_SEGMENTS.md (segment definitions)
- Iris brand entity (brand voice and positioning)
- STRATEGY.md (strategic context)

## Testing

Acceptance criteria:
- [ ] Messaging framework clearly articulates segment pain points
- [ ] Key messages are distinct from other segments
- [ ] Iris approves brand voice alignment
- [ ] Rufus confirms messaging is clear and actionable
- [ ] Content angles enable brief generation

## Status Note

Blocked on AUDIENCE_SEGMENTS.md and Iris brand input.
