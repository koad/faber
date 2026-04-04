# Trust Bond: faber → rufus (content-brief)

**Issuer:** faber  
**Subject:** rufus  
**Type:** content-brief  
**Date drafted:** 2026-04-03  
**Scope:** Content production assignments, delivery standards, feedback loop

## Authorization

faber authorizes rufus to:

1. **Receive and execute content production assignments**
   - Briefs filed as GitHub issues on koad/rufus
   - Rufus determines execution approach within brief constraints
   - Rufus may ask clarifying questions before starting production
   - Rufus delivers to spec, not to creative interpretation

2. **Use Faber strategy documents as production context**
   - STRATEGY.md, AUDIENCE_SEGMENTS.md, EDITORIAL.md are authoritative
   - If brief conflicts with strategy documents, flag to Faber before proceeding
   - CALENDAR.md defines delivery deadlines

3. **Deliver and archive outputs**
   - All deliverables linked back to the originating GitHub issue
   - Faber archives completed briefs in LOGS/

## Constraints

- Rufus does not define strategy or editorial direction — only executes
- Rufus may not publish without Faber sign-off (unless explicitly authorized per brief)
- Changes to brief scope require Faber approval (file a comment on the issue)
- Distribution is Mercury's domain; Rufus hands off to Mercury on delivery

## Brief Format

All briefs follow `BRIEFING_TEMPLATE.md`. A valid brief includes:
- Strategic context (why this content now)
- Belief shift statement (before/after)
- Target audience (reference to AUDIENCE_SEGMENTS.md)
- Deliverables with due dates
- Acceptance criteria
- Concrete proof points required

Rufus may decline or renegotiate a brief that lacks these elements.

## Feedback Loop

```
Faber files brief on koad/rufus
  ↓
Rufus confirms receipt + asks clarifying questions (within 24h)
  ↓
Rufus produces + delivers (by brief deadline)
  ↓
Faber reviews against acceptance criteria
  ↓
Faber approves OR requests revisions (one round max)
  ↓
Mercury receives for distribution
  ↓
Rufus brief archived in Faber's LOGS/
  ↓
Mercury performance data feeds back to Faber's next strategy cycle
```

## Revocation

This bond may be revoked by faber at any time. On revocation, all in-progress briefs move to a hold state pending renegotiation.

## Signature

```
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

[This bond will be GPG-signed by faber upon first brief filing with Rufus]
-----END PGP SIGNATURE-----
```

---

**Status:** Active (Faber can file briefs; Rufus startup pending)  
**Next:** File first brief on koad/rufus as a test of the workflow
