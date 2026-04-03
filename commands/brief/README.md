# Command: faber brief

**Status:** Planned (unbuilt)

Create a content brief for Rufus.

## Usage

```bash
faber brief [topic]
```

## Description

Generates a detailed content brief for Rufus based on:
- Strategic priorities from STRATEGY.md
- Audience segment messaging
- Target channel and format
- Success criteria

## Example

```bash
faber brief "koad:io positioning for platform adopters"
```

Output: Creates BRIEF_[topic]_[date].md and files issue on koad/rufus

## Implementation

- [ ] Parse strategy context
- [ ] Build interactive brief generator
- [ ] Create GitHub issue automatically
- [ ] Link brief to audience segment data
- [ ] Track brief-to-content workflow
