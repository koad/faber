# Content Performance Metrics

**Updated:** 2026-04-03  
**Owner:** Faber  
**Data source:** Mercury (monthly report) → Faber (analysis) → Juno (strategy impact)

---

## Purpose

This document defines:
1. What Faber measures and why
2. How to collect the data (via Mercury)
3. How to interpret it
4. How to feed it back into strategy

---

## The Measurement Framework

Content performance is measured against one primary question:

> **Did this content shift the belief we intended to shift?**

All metrics flow from that. Vanity metrics (raw impressions, follower counts) are tracked but not optimized for. What matters is belief shift, then behavior change, then business impact.

---

## Metric Tiers

### Tier 1: Belief Shift (Leading Indicators)

These tell us if the content is landing the intended idea.

| Metric | What it measures | Collection |
|--------|-----------------|------------|
| Comment sentiment | Are people expressing the belief we wanted? | Mercury qualitative scan |
| "I want to meet Alice" comments | Specific funnel intent signal | Mercury tags |
| Philosophy engagement | Replies engaging with the *idea*, not just the format | Mercury tags |
| Saves/bookmarks | "I want to return to this" — strong belief signal | Mercury platform data |
| Quote tweets/reposts | Did someone internalize this enough to share their interpretation? | Mercury platform data |

### Tier 2: Behavior Change (Mid Indicators)

These tell us if belief shifted enough to drive action.

| Metric | What it measures | Collection |
|--------|-----------------|------------|
| PWA signups | Tried to meet Alice | Juno/Mercury |
| Level completions | Continued with Alice | Juno |
| Level progression rate | Alice's retention | Juno |
| Click-through to kingofalldata.com | Curiosity became action | Mercury platform data |
| GitHub engagement (stars, watches) | Technical audience converting | GitHub |
| Newsletter signups | Long-term relationship intent | Mercury |

### Tier 3: Business Impact (Lagging Indicators)

These tell us if the ecosystem is growing.

| Metric | What it measures | Collection |
|--------|-----------------|------------|
| Graduation rate | Alice's ultimate success | Juno |
| Entity starts | Juno pipeline (post-graduation) | Juno |
| Peer ring formations | Network growing | koad:io daemon |
| Sponsorship/membership conversions | Revenue signal | Juno/koad |
| Press mentions / media pickup | Reach beyond our network | Mercury |
| Word-of-mouth referrals | "I told someone about Alice" | Survey, attribution |

---

## Pillar-Specific KPIs

### Alice Pillar

**Goal:** Move belief from "sovereignty sounds technical" → "I want to meet Alice"

| KPI | Week 1 Target | Week 2 Target |
|-----|--------------|--------------|
| Blog reads | >500/day | >800/day |
| YouTube views | >200/video | >500/video |
| Social impressions | >300/day | >500/day |
| "I want to meet Alice" signals | >20/week | >50/week |
| PWA signups | >100 | >300 total |

### Reality Pillar

**Goal:** Move belief from "this sounds theoretical" → "This is working right now"

| KPI | Target |
|-----|--------|
| Demo page visits | >500/week |
| Code/architecture engagement | >200 GitHub interactions |
| Technical questions in comments | >20 (quality signal) |
| "I didn't know this was real" signals | >10/week |

### Truth Pillar

**Goal:** Move belief from "journalism and tech are separate" → "Context bubbles change how I report"

| KPI | Target |
|-----|--------|
| Journalist follows/subscribers | >50 new |
| Context bubble articles (by others) | >3 |
| Substack/newsletter shares | >10 |
| Press freedom org engagement | >5 interactions |

---

## Monthly Reporting Cycle

### Collection (Mercury)

By the **5th of each month**, Mercury provides:
- Channel-by-channel raw data (views, clicks, engagement)
- Top performing content per pillar
- Audience growth/loss
- Sentiment summary (qualitative)
- Notable comments/moments

### Analysis (Faber)

By the **10th of each month**, Faber produces:
- Belief shift assessment per pillar: did content land?
- Behavior change analysis: is the funnel moving?
- Anomalies: what surprised us?
- Underperformers: what didn't work and why?
- Recommendations: what to change in next month's calendar?

### Strategy Adjustment (Faber → Juno)

By the **15th of each month**, Faber files:
- Updated STRATEGY.md (if positioning needs to shift)
- Updated CALENDAR.md (if priorities need to change)
- New briefs for Rufus (if production priorities shift)
- Mercury briefing (if distribution priorities shift)

---

## What Bad Performance Means

Not all low numbers are strategy failures. Faber must distinguish:

| Symptom | Possible cause | Response |
|---------|----------------|----------|
| Low reads on great content | Distribution problem (Mercury) | Change channels, not content |
| High reads, low comments | Belief didn't land | Rewrite for sharper belief shift |
| High comments, no PWA signups | Missing CTA / funnel gap | Add bridge from content to action |
| High PWA signups, low progression | Alice UX / curriculum gap | Brief Juno/Rufus, not Faber |
| Consistent underperformance in one pillar | Wrong pillar timing or wrong audience | Reorder calendar, revisit segmentation |

---

## Attribution Model

koad:io doesn't have traditional conversion tracking (no surveillance-first analytics). Attribution is:

1. **Direct signal**: Person says where they heard about Alice (survey, comment, DM)
2. **Channel signal**: Mercury tags distribution source per content piece
3. **Temporal signal**: PWA signups spike after specific content — infer correlation
4. **Qualitative signal**: What people say when they sign up ("I saw the tweet about Level 5")

This is intentionally lightweight. We don't track users; we listen to what people tell us.

---

## Report Archive

Monthly reports are stored in `LOGS/PERFORMANCE-[YYYY-MM].md`.

- First report due: May 10, 2026 (April data)
- Template: see `documentation/templates/performance-report-template.md` (TBD)

---

## Responsibilities

| Role | Responsibility |
|------|----------------|
| **Mercury** | Data collection, channel analysis, qualitative sentiment |
| **Faber** | Analysis, belief shift assessment, strategy recommendations |
| **Juno** | PWA/graduation data, business impact metrics |
| **koad** | Final sign-off on major strategy pivots from performance data |

---

**First report due:** May 10, 2026  
**Review cadence:** Monthly  
**Next framework review:** July 2026
