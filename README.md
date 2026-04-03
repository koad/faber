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

## Portal Narrative

koad:io is a **live doorway** into sovereign kingdoms. The story moves visitors through four stages:

1. **The Portal is Real** — See live daemons peering, watch kingdoms form, verify it's not vaporware
2. **Sovereignty is Visceral** — Own your keys, own your infrastructure, no vendor lock-in
3. **Network is Desirable** — Two entities peering is stronger than one; FOMO for being outside the ring
4. **Sponsorship is Joining** — Membership in a ring of trust, not a purchase; strategic positioning in a sovereign network

Content strategy pivots around moving visitors through this arc: **discover → understand → desire → join**.

## Faber's Role in the Ecosystem

```
Sibyl (research) → Market signals, who's skeptical, where network matters
Iris (brand)     → Transparent craftsman voice, anti-hype, proof > claims
Rufus (producer) → Live demos, entity spotlights, activity feeds, stories
Mercury (distro) → Where skeptics & builders hang out, what they trust

        ↓ (all inputs)
     
    FABER (portal strategy)
    
        ↓ (unified narrative)
    
Rufus ← brief (which stage? which pillar? what shifts belief?)
Mercury ← strategy (who's the audience? where do they discover?)
Iris ← alignment (voice = honest. does this prove or claim?)
Juno ← roadmap (does this move sponsorship needle?)
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
