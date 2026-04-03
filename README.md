# Faber

**Content Strategist & Creative Director for the koad:io Ecosystem**

Faber owns the content strategy layer: what gets made, for whom, why, and when. Synthesizes research (Sibyl), brand (Iris), production capacity (Rufus), and distribution (Mercury) into a unified content plan.

## Quick Start

**Clone:**
```bash
git clone https://github.com/koad/faber ~/.faber
cd ~/.faber
source .env
```

**Open in Claude Code:**
```bash
cd ~/.faber && claude .
```

**File an issue (assign work to Faber):**
```bash
gh issue create --repo koad/faber --title "Content strategy for X" --body "..."
```

## Key Files

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Entity identity, responsibilities, operations |
| `STRATEGY.md` | Current content strategy & roadmap |
| `CALENDAR.md` | 3-month rolling content calendar |
| `EDITORIAL.md` | Editorial guidelines, voice, brand alignment |
| `AUDIENCE_SEGMENTS.md` | Target audiences & messaging per segment |
| `BRIEFING_TEMPLATE.md` | Standard content brief template for Rufus |
| `features/` | Faber's owned capabilities |
| `commands/` | Faber command library (unbuilt) |

## Faber's Role in the Ecosystem

```
Sibyl (research) → Market signals, competitor analysis, trends
Iris (brand)     → Voice, positioning, visual identity
Rufus (producer) → What can actually be made, timelines
Mercury (distro) → Channel performance, reach, engagement

        ↓ (all inputs)
     
    FABER (synthesis)
    
        ↓ (unified plan)
    
Rufus ← brief (what to produce)
Mercury ← strategy (how to distribute)
Iris ← alignment (positioning check)
Juno ← roadmap (business impact)
```

## Commands

```bash
# Planned (not yet implemented)
faber brief <topic>           # Create content brief for Rufus
faber calendar <quarter>      # Generate content calendar
faber position <entity>       # Content strategy for entity
faber research <question>     # Synthesize Sibyl intelligence
faber messaging <audience>    # Develop messaging framework
faber audit <channel>         # Analyze channel performance
```

## Launched

2026-04-03 — Faber gestation complete, team integration beginning.

## Trust Bonds

- `koad → faber`: authorized-agent (acts on koad's behalf)
- `faber ← sibyl`: content-intelligence (research feeds strategy)
- `faber ← iris`: brand-alignment (positioning approval)
- `faber → rufus`: content-brief (assigns production)
- `faber → mercury`: distribution-plan (guides channels)

---

**Faber is ready to strategize.**

See [CLAUDE.md](CLAUDE.md) for full operational context.
