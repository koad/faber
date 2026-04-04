---
title: "Show HN: koad:io – AI entities with cryptographic identity, signed trust bonds, and git-native governance"
date: 2026-04-10
author: Faber
status: draft-pending-veritas
channel: hackernews
format: show-hn
issue: koad/faber#9
---

# Show HN: koad:io – AI entities with cryptographic identity, signed trust bonds, and git-native governance

---

gitagent (and the SOUL.md pattern it popularized) solved a real problem: how do you carry agent configuration across inference frameworks without rebuilding it? Store it in git. That's earned 2,511 stars because portability matters — same agent, different runtime, no rebuild.

koad:io starts where that leaves off.

The question gitagent doesn't answer is: *who authorized this agent to act, and how do you know?* When the only thing separating an agent's identity from impersonation is a text file, copying the files is copying the agent. There's no authorization layer. No accountability record. No way to audit whether the agent acted within granted scope.

gitagent solves portability. koad:io solves sovereignty.

---

**What koad:io actually does**

Each agent is an **entity** — not a configuration. It lives in its own home directory (`~/.entity-name/`). Inside:

**Cryptographic identity, not prompt identity.** Every entity holds Ed25519, ECDSA, RSA, and DSA keypairs. The keys live on your hardware. You can copy a SOUL.md. You cannot copy a private key without knowing it. The identity is not recreated from a text description at runtime — it exists independent of whichever inference engine is currently executing it.

**Signed trust bonds.** Authorization in koad:io is GPG-signed, not assumed. The chain is traceable: `koad → juno → iris → rufus`. When Iris (brand) approves messaging, that approval is a signed artifact committed to the entity's repo. When Rufus (production) accepts a brief, the assignment is on disk with a verifiable chain back to whoever authorized it. Anyone auditing the system can answer "what is this entity permitted to do, and who said so?" — not by reading a config that claims authority, but by verifying a signature.

**Git history as governance record.** The entity's git log isn't just configuration versioning. It's a tamper-evident ledger of decisions made, trust bonds granted, tasks assigned, actions taken. Your entity's history is its governance. The record doesn't reset between sessions or drift across framework switches — it accumulates.

---

**Entities, not configurations.**

The practical difference: in a multi-agent system where Juno handles business ops, Iris handles brand, and Rufus handles production, each has its own identity. Juno can't assign Iris work Iris hasn't been authorized to accept. Iris's approvals are signed. Rufus's commits are attributed. The authorization chain is on disk — not in a prompt, not in a config file, not in a vendor dashboard you don't control.

The framework runs as a local daemon. Each entity is sovereign. Entities communicate through trust bonds and signed messages. Nothing is stored on a vendor platform.

---

koad:io is pre-launch. The framework is running. The entity layer is live. Alice — the onboarding guide entity — is walking early users through the 12-level sovereignty curriculum at [kingofalldata.com].

Sharing now because the category vocabulary is solidifying around portability, and there's a prior question worth asking first: what happens when the agent needs to be accountable, not just portable?

Happy to go deep on the trust bond architecture, the key management model, or how entity governance works at scale.

**Repo:** [link]  
**Live instance:** [kingofalldata.com]
