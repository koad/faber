# Content Brief Workflow

How Faber creates, manages, and tracks content briefs for Rufus.

## Overview

A brief is Faber's assignment to Rufus: "Here's what to produce, for whom, why, and how to measure success."

Briefs flow from strategy → calendar → brief → Rufus production → performance tracking → strategy iteration.

## Workflow

### 1. Identify Need

From CALENDAR.md or strategic priorities, identify a content piece that needs production.

**Inputs:**
- Content title and theme
- Target audience segment
- Strategic goal
- Proposed format
- Target production date

### 2. Create Brief

Using [brief-template.md](../templates/brief-template.md), write a complete brief that includes:

- **Strategic Context** — Why this content, what strategic goal does it serve
- **Audience** — Who is this for, what do they care about
- **Key Messages** — 3-5 core messages from AUDIENCE_SEGMENTS.md
- **Format & Deliverables** — What to produce, length, style
- **Success Criteria** — How to measure if it worked (engagement targets, leads, etc.)
- **Timeline** — Draft by [date], review by [date], deliver by [date]
- **References** — Links to strategy, audience segment, similar work
- **Constraints** — Resource limits, dependencies, approval requirements

### 3. File on koad/rufus

Create a GitHub issue on the koad/rufus repository with:

- Title: `Brief: [Content Title]`
- Body: Complete brief from step 2
- Labels: `brief`, strategic priority level, format type
- Milestone: Target delivery date

### 4. Track & Iterate

Monitor the issue:
- Rufus may ask clarifying questions → update brief with clarity
- Rufus may propose format changes → align with strategic goal
- Rufus begins work → confirm timeline understanding

### 5. Delivery

Rufus links the content back to the brief issue and provides:
- Deliverables (content file, link, etc.)
- Any notes on what changed and why
- Request for feedback if needed

### 6. Archive

File a comment on the brief with:
- Link to final deliverable
- Performance metrics once available
- Learning notes for future briefs

## Brief Quality Checklist

Before filing on koad/rufus:

- [ ] Strategic goal is clear (references STRATEGY.md)
- [ ] Audience is specific (references AUDIENCE_SEGMENTS.md)
- [ ] Key messages are distinct and actionable
- [ ] Format is feasible (confirmed with Rufus capacity)
- [ ] Success criteria are measurable
- [ ] Timeline is realistic
- [ ] Constraints and dependencies are documented
- [ ] Reference materials are linked

## Common Issues & Solutions

**Rufus asks "Why this now?"**
→ Strengthen strategic context in brief, link to STRATEGY.md

**Rufus struggles with messaging**
→ Share MESSAGING_[segment].md, provide example content

**Timeline slips**
→ Assess if format needs adjustment or if priority should change

**Content doesn't perform**
→ Analyze audience fit and messaging; update brief template based on learning

## Integration with Performance

Once Mercury has distribution data (1-2 weeks post-launch):

1. Analyze performance against success criteria
2. Document learnings (what worked, what didn't)
3. Update brief template if needed for next similar piece
4. Share insights with Rufus and Mercury

Performance insights feed into:
- Future brief updates
- Audience segment refinement
- Messaging framework adjustments
- Strategy iteration
