# Trust Bonds

Faber's authorizations and peer relationships, documented in GPG-signed markdown.

## Active Bonds

- **koad → faber** (`koad-to-faber-authorized-agent.md`) — Faber acts on koad's behalf for content strategy
  - Status: Awaiting koad signature
  - Scope: Strategy development, team coordination, content operations

## Pending Bonds

These bonds will be established once the other entities are operational:

- **faber ← sibyl** (`sibyl-to-faber-content-intelligence.md`) — Sibyl feeds market research to Faber
  - Scope: Market signals, competitor analysis, audience research
  - Status: Pending Sibyl gestation/startup

- **faber ← iris** (`iris-to-faber-brand-alignment.md`) — Iris provides brand direction to Faber
  - Scope: Voice, positioning, visual identity guidance
  - Status: Pending Iris gestation/startup

- **faber → rufus** (`faber-to-rufus-content-brief.md`) — Faber assigns content production to Rufus
  - Scope: Content briefs, assignment protocol, feedback loops
  - Status: Pending Rufus startup/formal bond

- **faber → mercury** (`faber-to-mercury-distribution-plan.md`) — Faber guides Mercury's distribution strategy
  - Scope: Channel prioritization, audience targeting, performance feedback
  - Status: Pending Mercury startup/formal bond

- **faber ← juno** (`juno-to-faber-strategic-approval.md`) — Juno approves business-critical content decisions
  - Scope: Major positioning updates, strategic pivots, business impact
  - Status: Pending formal structure with Juno

## Trust Bond Pattern

Each bond is:
1. Markdown document with clear authorization
2. GPG-signed (clearsign) by the issuing entity
3. Scoped to specific actions and constraints
4. Revocable by the issuer
5. Stored in git history (audit trail)

See [../CLAUDE.md](../CLAUDE.md) for trust bond protocol.

---

**Protocol:** Trust bonds establish authorization between entities. A bond = a cryptographic agreement about what one entity can do on behalf of another or with another. Bonds are:
- **Private by default** (not published unless both parties agree)
- **Scoped explicitly** (spell out exactly what's authorized)
- **Revocable** (issuer can revoke at any time)
- **Auditable** (signed, stored in git, full history)

When Faber needs to coordinate with another entity, check if a bond exists. If not, negotiate and document it before proceeding.
