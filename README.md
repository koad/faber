# Faber — Content Strategy & Creative Direction

**Entity:** faber  
**Role:** Content strategist and creative director for the koad:io ecosystem  
**Repository:** https://github.com/koad/faber

## What Faber Does

Faber owns the content strategy layer: what gets made, for whom, why, and when. Synthesizes intelligence from Sibyl (research), brand direction from Iris (positioning), production capacity from Rufus, and distribution insights from Mercury into a unified content plan that feeds production, distribution, and strategy.

**Name origin:** Latin for craftsman — the one who decides what to build before anyone picks up a tool.

## Two-Layer Architecture

```
~/.koad-io/    ← Framework layer (CLI tools, templates, daemon)
~/.faber/      ← Entity layer (this repo: identity, strategy, commands, docs, keys)
```

## Strategy Pipeline

```
Sibyl (research) → Market signals, who's skeptical, where network matters
Iris (brand)     → Voice, positioning, what to prove vs. what to claim
Rufus (producer) → What can actually be made, timelines, capacity
Mercury (distro) → Where audiences live, what they trust

        ↓ (all inputs)

    FABER (content strategy)

        ↓ (unified plan)

Rufus ← brief (what to make, for which stage, what shifts belief)
Mercury ← strategy (audience, channel, distribution plan)
Iris ← alignment check (does this prove or just claim?)
Juno ← roadmap (does this move the sponsorship needle?)
```

## Responsibilities

- **Content Strategy** — what gets made, when, for whom, why
- **Editorial calendar** — 3-month rolling plan, priorities, format decisions
- **Audience segmentation** — messaging per segment, channel fit
- **Cross-entity orchestration** — translates research into production briefs
- **Feedback loop** — monitors Mercury's engagement data, refines strategy

## Key Files

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Entity identity, responsibilities, operations |
| `STRATEGY.md` | Current content strategy & roadmap |
| `CALENDAR.md` | 3-month rolling content calendar |
| `EDITORIAL.md` | Editorial guidelines, voice, brand alignment |
| `AUDIENCE_SEGMENTS.md` | Target audiences & messaging per segment |
| `BRIEFING_TEMPLATE.md` | Standard content brief template for Rufus |

## Team Position

```
koad (root)
  └── Juno (orchestrator)
        └── Faber (content strategy) ← this entity
              → Rufus (production)
              → Mercury (distribution)
              ← Sibyl (research input)
              ← Iris (brand alignment)
```

## How to Reach Faber

- **Content strategy requests:** File a GitHub Issue on [koad/faber](https://github.com/koad/faber)
- **Strategy documents:** `~/.faber/` — STRATEGY.md, CALENDAR.md, EDITORIAL.md

## More Information

See `CLAUDE.md` in this directory for Faber's complete runtime instructions and operational constraints.
