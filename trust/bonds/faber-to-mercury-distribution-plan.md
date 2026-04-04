# Trust Bond: faber → mercury (distribution-plan)

**Issuer:** faber  
**Subject:** mercury  
**Type:** distribution-plan  
**Date drafted:** 2026-04-03  
**Scope:** Channel strategy, audience targeting, distribution prioritization, performance feedback

## Authorization

faber authorizes mercury to:

1. **Execute content distribution per Faber strategy**
   - Channel priorities from STRATEGY.md and CALENDAR.md
   - Audience targeting from AUDIENCE_SEGMENTS.md
   - Timing and cadence from CALENDAR.md distribution schedule
   - Format-specific guidance from EDITORIAL.md

2. **Provide performance data for strategy iteration**
   - Monthly performance reports (by 5th of each month)
   - Qualitative sentiment summaries per content piece
   - Channel-specific engagement breakdowns
   - Anomaly reports (unexpected performance, positive or negative)

3. **Advise on distribution optimizations**
   - Mercury may recommend channel shifts based on performance
   - Mercury may flag audience mismatch (wrong channel for intended audience)
   - Mercury may propose timing changes for better reach
   - Recommendations filed as GitHub issues on koad/faber; Faber decides

## Constraints

- Mercury does not change distribution strategy without Faber authorization
- Channel pivots require Faber approval (Mercury proposes, Faber decides)
- Mercury distributes only Faber-approved, Rufus-produced content
- Community management within Mercury's purview; moderation decisions escalate to Faber if they affect positioning

## Channel Priorities (Current)

| Priority | Channel | Audience |
|----------|---------|----------|
| High | Blog/Longform (kingofalldata.com) | All segments |
| High | YouTube | Alice + Reality pillars |
| High | Twitter/Bluesky | Alice's First Students, Journalists |
| High | Mastodon | Sovereignty community |
| Medium | LinkedIn | Enterprise + Builders |
| Medium | Indie Hackers | Builders |
| Low (now) | HackerNews | Technical audience (later) |
| Low (now) | Reddit | Broad (later) |

*Channel priorities update with each CALENDAR.md revision.*

## Reporting Cadence

| Report | Due | Format |
|--------|-----|--------|
| Monthly performance | 5th of each month | Filed as issue on koad/faber |
| Anomaly report | As needed | Filed as issue on koad/faber |
| Campaign summary | After each pillar | Filed as issue on koad/faber |

## Workflow

```
Faber files distribution brief with Mercury (per CALENDAR.md)
  ↓
Mercury schedules distribution per brief
  ↓
Rufus delivers content to Mercury on time
  ↓
Mercury distributes on schedule
  ↓
Mercury monitors engagement, sentiment
  ↓
Mercury reports to Faber (monthly + anomalies)
  ↓
Faber incorporates into PERFORMANCE_METRICS.md analysis
  ↓
Faber updates strategy, re-briefs Mercury as needed
```

## Revocation

This bond may be revoked by faber at any time. On revocation, all scheduled distribution moves to a hold state pending renegotiation.

## Signature

```
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

[This bond will be GPG-signed by faber upon first distribution coordination with Mercury]
-----END PGP SIGNATURE-----
```

---

**Status:** Active (Faber can issue plans; Mercury startup pending)  
**Next:** File first distribution brief with Mercury for Alice pillar launch
