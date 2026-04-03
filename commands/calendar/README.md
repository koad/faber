# Command: faber calendar

**Status:** Planned (unbuilt)

Generate or update content calendar.

## Usage

```bash
faber calendar [quarter] [--refresh]
```

## Description

Creates or updates a 3-month rolling content calendar with:
- Strategic priorities
- Content pieces planned
- Target dates
- Assigned producer (Rufus)
- Distribution channels (Mercury)
- Audience segments

## Example

```bash
faber calendar Q2 2026
faber calendar --refresh  # Update current quarter
```

Output: Updates CALENDAR.md with new entries

## Implementation

- [ ] Build calendar template system
- [ ] Parse strategy priorities
- [ ] Coordinate with Rufus capacity
- [ ] Align with Mercury channel calendar
- [ ] Generate calendar view (markdown + possibly Gantt)
- [ ] Track calendar adherence
