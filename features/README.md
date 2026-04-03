---
status: reference
owner: faber
type: feature-inventory
---

# Faber Feature Inventory

This directory contains Faber's features and capabilities as defined by VESTA-SPEC-013.

## Feature Status Summary

| Feature | Status | Priority | Owner | Completed |
|---------|--------|----------|-------|-----------|
| Content Strategy | Draft | Critical | faber | — |
| Content Briefs | Draft | High | faber | — |
| Audience Segmentation | Draft | High | faber | — |
| Performance Analysis | Draft | High | faber | — |

**Totals:** 4 features | 0 in-progress | 0 complete | 100% planned

## Feature Details

### 1. Content Strategy
- **Status:** Draft (planned)
- **Priority:** Critical
- **Purpose:** Synthesize inputs from Sibyl, Iris, Rufus, Mercury into unified strategy
- **Expected:** STRATEGY.md, CALENDAR.md, BRIEFING_TEMPLATE.md, EDITORIAL.md
- **File:** `01-content-strategy.md`
- **Blocked by:** None (unblocked, can start immediately)

### 2. Content Briefs
- **Status:** Draft (planned)
- **Priority:** High
- **Purpose:** Create standardized brief format for assigning work to Rufus
- **Expected:** BRIEFING_TEMPLATE.md, `faber brief` command
- **File:** `02-content-briefs.md`
- **Blocked by:** Content Strategy feature (needs STRATEGY.md context)

### 3. Audience Segmentation & Messaging
- **Status:** Draft (planned)
- **Priority:** High
- **Purpose:** Define target audiences and develop messaging frameworks
- **Expected:** AUDIENCE_SEGMENTS.md, segment-specific messaging documents
- **File:** `03-audience-segmentation.md`
- **Blocked by:** Sibyl market research, Iris brand input

### 4. Performance Analysis
- **Status:** Draft (planned)
- **Priority:** High
- **Purpose:** Collect and analyze content performance to inform strategy iteration
- **Expected:** PERFORMANCE_METRICS.md, monthly reports, analysis framework
- **File:** `04-performance-analysis.md`
- **Blocked by:** Mercury distribution data (can't measure until content is live)

## Commands

Faber has planned commands in `../commands/`:

| Command | Status | Purpose | File |
|---------|--------|---------|------|
| `faber brief` | Draft | Generate content brief for Rufus | `brief/README.md` |
| `faber calendar` | Draft | Generate/update content calendar | `calendar/README.md` |
| `faber messaging` | Draft | Develop messaging framework for segment | `messaging/README.md` |

## Implementation Roadmap

### Phase 1: Strategy & Planning (Week 1)
- [ ] Complete Content Strategy feature
- [ ] Create STRATEGY.md for Q2 2026
- [ ] Create CALENDAR.md with content roadmap
- [ ] Define BRIEFING_TEMPLATE.md

### Phase 2: Audience & Messaging (Week 2)
- [ ] Get Sibyl market research input
- [ ] Get Iris brand direction input
- [ ] Complete Audience Segmentation feature
- [ ] Create AUDIENCE_SEGMENTS.md with 4-6 segments
- [ ] Create messaging frameworks per segment

### Phase 3: Briefing System (Week 3)
- [ ] Complete Content Briefs feature
- [ ] Build `faber brief` command
- [ ] Create first 3 briefs for Rufus
- [ ] Establish brief-to-content workflow
- [ ] File first briefs on koad/rufus

### Phase 4: Performance Tracking (Week 4)
- [ ] Establish data collection with Mercury
- [ ] Complete Performance Analysis feature
- [ ] Create PERFORMANCE_METRICS.md
- [ ] Start monthly analysis cycle

## Dependencies Across Features

```
Content Strategy (critical input)
├── Content Briefs (depends on strategy context)
├── Audience Segmentation (depends on strategy priorities)
└── Performance Analysis (depends on content via briefs)

Audience Segmentation
├── Content Briefs (messaging input)
├── Content Strategy (audience definition)
└── Performance Analysis (audience segmentation in reports)

Content Briefs
├── Content Strategy (source of priorities)
├── Audience Segmentation (messaging source)
└── Rufus entity (execution partner)

Performance Analysis
├── Mercury entity (data source)
├── Content Strategy (goals to measure against)
└── Calendar (content pieces to analyze)
```

## VESTA-SPEC-013 Compliance

This inventory complies with VESTA-SPEC-013: Features-as-Deliverables Protocol.

**Conformance checklist:**
- [x] `features/` directory exists at entity root
- [x] All features have `.md` files with frontmatter
- [x] Frontmatter includes: status, owner, priority, description
- [x] Features with `status: draft` include `started` date
- [x] Each feature has: Purpose, Specification, Dependencies, Testing sections
- [x] Commands in `../commands/` have specification files
- [x] Commands have frontmatter with status and priority
- [x] This README provides feature inventory overview

## How Argus Will Audit

When Argus audits Faber's feature completion:

1. **Frontmatter validation** — All files have required fields
2. **Status tracking** — Accurate counts of draft/in-progress/complete
3. **Dependency mapping** — Understands blocking relationships
4. **Implementation pairs** — Completed features have corresponding code/commands
5. **Testing criteria** — Clear acceptance criteria for each feature

Expected report format:
```json
{
  "entity": "faber",
  "features": {
    "total": 4,
    "draft": 4,
    "in_progress": 0,
    "complete": 0,
    "completion_rate": 0.0
  },
  "by_priority": {
    "critical": {"total": 1, "complete": 0, "completion_rate": 0.0},
    "high": {"total": 3, "complete": 0, "completion_rate": 0.0}
  }
}
```

## See Also

- [../CLAUDE.md](../CLAUDE.md) — Faber entity identity and responsibilities
- [../commands/](../commands/) — Planned commands
- [../documentation/](../documentation/) — Operational guides and templates
