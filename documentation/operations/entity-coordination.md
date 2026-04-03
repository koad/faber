# Entity Coordination

How Faber works with Sibyl, Iris, Rufus, Mercury, and Juno.

## Entity Roles

```
Sibyl (research) ──┐
                   │
Iris (brand)  ────┤─→ Faber (strategy) ──┬──→ Rufus (production)
                   │                       │
Juno (biz)    ────┘                       └──→ Mercury (distribution)
```

## Upstream Inputs

### Sibyl (Market Intelligence)

**What Faber needs from Sibyl:**
- Market research reports (quarterly or as available)
- Competitor analysis and positioning
- Audience sentiment and trends
- Emerging opportunities
- Industry signals and news

**How to ask:**
- File issue on koad/sibyl with research question
- Tag with `for-faber` label
- Include deadline if time-sensitive

**Cadence:**
- Quarterly: Request full market analysis for strategy planning
- As-needed: Ask about specific opportunities or trends
- Monthly: Review Sibyl's latest research for calendar adjustments

**Integration point:**
- Sibyl insights → audience segmentation and messaging → strategy

### Iris (Brand Direction)

**What Faber needs from Iris:**
- Brand positioning statement (core values, positioning, differentiation)
- Voice and tone guidelines
- Key messages and messaging hierarchy
- Visual identity and brand elements
- Updates when brand direction evolves

**How to ask:**
- Share draft messaging frameworks with Iris for alignment
- File issue on koad/iris for brand-related questions
- Request review on content briefs before Rufus production

**Cadence:**
- Quarterly: Align overall strategy with brand direction
- As-needed: Request approval on messaging changes
- Whenever: Get brand feedback before major content initiatives

**Integration point:**
- Iris input → messaging frameworks and content briefs → Rufus guidance

### Juno (Business Goals)

**What Faber needs from Juno:**
- Business goals and OKRs for the period
- Revenue targets and ROI expectations
- Strategic priorities
- Market positioning goals
- Resource allocations

**How to ask:**
- Attend quarterly planning meetings
- File issues on koad/juno for goal clarification
- Get alignment on strategic priorities

**Cadence:**
- Quarterly: Full alignment on business goals
- Monthly: Check-in on progress vs. goals
- As-needed: Get guidance on priority shifts

**Integration point:**
- Juno goals → strategy priorities → calendar

## Downstream Partners

### Rufus (Production)

**What Faber gives to Rufus:**
- Content briefs with clear specifications
- Audience context and messaging guidance
- Timeline and delivery expectations
- Reference materials and brand guidance
- Prioritization and scheduling (CALENDAR.md)

**How to work with Rufus:**
- Create briefs using [brief-template.md](../templates/brief-template.md)
- File issues on koad/rufus with complete briefs
- Respond quickly to Rufus questions on briefs
- Provide feedback on deliverables

**Cadence:**
- Weekly: Brief creation as calendar drives work
- Bi-weekly: Check-in on content in progress
- As-delivered: Receive content and provide feedback

**Integration point:**
- Faber brief → Rufus production → delivered content

### Mercury (Distribution)

**What Faber gives to Mercury:**
- Distribution strategy (channel priorities, audience targeting)
- Content calendar with release dates
- Audience segment information
- Key messages for each piece

**What Faber gets from Mercury:**
- Channel performance analytics
- Audience engagement data
- Distribution capacity and timing constraints
- Content performance reports

**How to work with Mercury:**
- Share CALENDAR.md and channel priorities
- Request performance data monthly
- File issues on koad/mercury for distribution questions
- Iterate strategy based on performance insights

**Cadence:**
- Quarterly: Share updated strategy and calendar
- Monthly: Collect performance data
- Weekly: Review trending performance
- As-needed: Coordinate on timing or channel changes

**Integration point:**
- Faber calendar → Mercury distribution + performance data → strategy iteration

## Trust & Scope

Each entity operates autonomously but respects these boundaries:

- **Faber's authority:** What content gets made, when, for whom, why
- **Rufus's authority:** How content gets made, technical execution
- **Mercury's authority:** How content gets distributed, channel optimization
- **Iris's authority:** Brand voice, positioning, visual identity
- **Sibyl's authority:** Market research, competitive analysis
- **Juno's authority:** Business goals, revenue, resource allocation

When there's tension (e.g., Rufus wants to make something Juno doesn't prioritize), Faber facilitates discussion and makes the call based on:
1. Business goals (Juno)
2. Brand fit (Iris)
3. Market opportunity (Sibyl)
4. Feasibility (Rufus)
5. Distribution (Mercury)

## Communication Channels

**Primary:** GitHub Issues on each entity's repo
- File issue, tag relevant entity, include deadline
- Entities respond in issue comments
- Provides audit trail and async coordination

**Secondary:** Direct messages or calls for urgent matters

**Artifacts:** Shared markdown documents in git
- STRATEGY.md
- CALENDAR.md
- AUDIENCE_SEGMENTS.md
- EDITORIAL.md
- BRIEFING_TEMPLATE.md
- PERFORMANCE_METRICS.md

## Conflict Resolution

When entities disagree:

1. **Listen** — Understand each entity's constraint or priority
2. **Synthesize** — Look for solutions that honor all inputs
3. **Escalate to Juno** — If unresolvable, Juno (business) decides
4. **Document** — Record decision and reasoning in git/issues

Example: Rufus wants 2 weeks to produce content, but Mercury says it needs to go out next week.
- Option 1: Reduce scope (Faber + Rufus negotiate)
- Option 2: Shift other work (Faber rearranges calendar)
- Option 3: Escalate to Juno (Juno decides which deadline wins)
