---
title: "Trust Bonds: What They Are, What They Aren't, Why the Distinction Matters"
subtitle: "The policy vs. bond distinction, GPG tradeoffs, and where koad:io sits in the emerging academic consensus on multi-agent authorization"
date: 2026-04-24
pillar: Reality
series: "How It Actually Works"
day: 24
tags: [cryptography, ai-agents, authorization, gpg, nist, governance, trust-bonds, koad-io]
target: HackerNews, developer security community
word_count: ~1600
---

# Trust Bonds: What They Are, What They Aren't, Why the Distinction Matters

*Day 24 — Reality Pillar: How It Actually Works*

---

If you've worked with RBAC, OAuth, or NIST frameworks, you've already built a mental model for authorization. It probably looks like this: identities have roles, roles have permissions, permissions gate actions, a central system enforces the whole thing. That model has served enterprise software well for decades.

It has a structural gap that only becomes visible when you move to multi-agent AI systems operating without continuous human supervision. This post is about that gap, why it matters, what trust bonds do differently, and — critically — where GPG falls short and what comes next.

The earlier posts in this series (*Trust Bonds Aren't Policy*, *Not Your Keys, Not Your Authorization*) established the vocabulary and made the sovereignty argument. This one is for the reader who already knows the field and wants the precise technical argument.

---

## The Structural Gap in Policy-Based Authorization

RBAC stores authorization state. An IAM database records that `juno` has been granted the `business-agent` role. That role maps to a set of permitted operations. At runtime, the system checks the mapping and allows or blocks the action.

What the database does not store is the grant event itself — who made the decision, on what date, under what circumstances, with what intended scope. "Juno has business-agent" is all that survives. The grant is state; the granting is gone.

This is not a bug in RBAC — it's a deliberate design choice optimized for query performance. At scale, you need fast lookups, not audit trails. But the consequence is structural: a policy system can answer "is this allowed?" but not "who decided this was allowed, and can you prove it?"

This problem was formalized in January 2025. arxiv:2501.09674 (*Authenticated Delegation and Authorized AI Agents*, South, Marro, Hardjono et al., arXiv preprint submitted to ICML) addresses multi-hop delegation directly, examining how cryptographic accountability must be maintained across delegation chains — and what breaks when it isn't. The core concern: as delegation hops accumulate, the cryptographic link back to the initiating authority becomes difficult to establish without purpose-built mechanisms.

In a human-operator system, that's manageable — you can reconstruct the grant history from org charts, meeting notes, and audit logs maintained by separate systems. In a multi-agent system operating autonomously at speed, you can't. By the time something goes wrong, the authorization chain is unrecoverable.

Entro Security's "2025 State of Non-Human Identities and Secrets in Cybersecurity" (September 2024) quantified the failure mode: 97% of non-human identities carry excess privileges. That number reflects the lifecycle problem — authorizations accumulate, revocation requires active effort, nobody is watching the permissions table.

---

## What a Trust Bond Contains That Policy Doesn't

A trust bond in koad:io is a structured document with six fields:

- **Grantor**: the authorizing entity, GPG-identified by key fingerprint
- **Grantee**: the entity receiving authorization
- **Scope**: explicit list of authorized actions, and explicit NOT list
- **Domain**: the context in which authorization applies
- **Issued date**: when the grant was made
- **Signature**: cryptographic proof the grantor signed this exact document at this timestamp

The signature is the critical element that policy lacks. The bond doesn't record that an authorization exists — it records that a specific named identity, holding a specific private key, signed a specific document on a specific date authorizing a specific scope.

That's the distinction between state and evidence. Policy says "Juno is authorized." A trust bond says "koad (fingerprint: `A07F 8CFE CBF6 B982...`) signed a document on 2026-04-02 asserting that Juno is authorized to act on koad's behalf within these explicitly listed constraints." The bond is verifiable without contacting any external service. The grantor cannot plausibly deny it. The scope cannot be altered without producing a detectable signature mismatch.

Verification is one command:

```bash
gpg --verify ~/.juno/trust/bonds/koad-to-juno.md.asc
```

No API. No session. No central authority. The math is the proof.

---

## GPG: What It Gets Right and Where It Falls Short

This is where the technical reader deserves honesty rather than advocacy.

**What GPG gets right:**

GPG clearsign provides non-repudiation. The signer cannot plausibly deny having signed the document. It is decentralized — there is no certificate authority, no issuing service that can be compromised or shut down. It is offline-capable — verification requires only the public key, which can be distributed statically. And it is battle-tested across thirty years of production use in contexts far more adversarial than agent authorization.

For the specific problem koad:io is solving — "did this specific identity authorize this specific action, and can you prove it without asking anyone?" — GPG is the correct primitive.

**What GPG gets wrong:**

GnuPG's own documentation deprecates clearsign in favor of detached signatures. From the GnuPG manual: "clearsigned documents are deprecated because detached signatures provide a more solid framework." Clearsign encodes the signed content and signature in a single file; detached signatures keep them separate. The practical difference is edge-case robustness in document encoding — line endings, whitespace normalization, character encoding. For a controlled system like koad:io with a well-defined bond format, this is a minor issue. But it's a known improvement on the current implementation, worth naming.

Key management overhead is the harder problem. GPG private keys are not recoverable. If Juno's signing key is compromised, every bond Juno has ever signed requires re-evaluation — not just future bonds. The revocation process (a signed revocation certificate, distributed to keyservers) requires infrastructure that most deployments don't set up in advance. In the koad:io system, key compromise is manageable because the team is small and the key distribution is simple (canon.koad.sh). At enterprise scale, it becomes a serious operational burden.

There is no native capability attenuation in GPG. A bond authorizes a scope, but GPG cannot enforce that the bond is only used within that scope at runtime. The enforcement has to happen elsewhere — in the system checking bonds before allowing actions. GPG proves the authorization was granted; it doesn't constrain how the grantee uses it downstream.

And UX: GPG is hostile to non-technical users. Key generation, key distribution, keyserver infrastructure, passphrase management — these are friction points that don't exist in OAuth flows. For a closed team of technical entities operating on sovereign infrastructure, this is acceptable. For a product aimed at a general developer audience, it is a significant onboarding barrier.

---

## Where the Field Is Going

The academic literature on multi-agent authorization has converged on a two-layer architecture that clarifies where GPG fits and where it doesn't.

**Layer 1: Identity attestation.** "This entity is who it claims to be, and this named identity authorizes this scope." GPG is the right primitive here. The MIT-affiliated paper (arxiv:2501.09674) and the W3C DID/VC work (arxiv:2511.02841) both address this layer. DID/VC is the W3C-aligned long-term trajectory — decentralized identifiers anchored to infrastructure-agnostic ledgers, with verifiable credentials rather than signed files. GPG achieves the same properties without ledger dependency. For a sovereign system that explicitly avoids external infrastructure, GPG is a defensible Layer 1 choice.

**Layer 2: Pipeline delegation.** "Juno delegates task X to Sibyl with constraint Y, and Sibyl cannot re-delegate." This is where GPG is insufficient. GPG bonds are single-hop: Juno signs a document authorizing Sibyl. But if Sibyl needs to sub-delegate to another entity with reduced scope, GPG requires a new signature from a new key, and there is no native mechanism to enforce that Sibyl cannot expand scope.

The emerging standard for Layer 2 is Biscuits (arxiv:2603.24775, the Agent Identity Protocol). Biscuits are a public-key version of macaroons — Ed25519-chained signatures with Datalog policies that express conditional delegation. The holder can add constraints that reduce authority but cannot expand it. Verification does not require the root secret. This is the right primitive for multi-hop delegation chains.

The AIP paper (arxiv:2603.24775, 2026) introduces Invocation-Bound Capability Tokens built on this model, directly targeting MCP and A2A protocols — which are now the dominant agent communication protocols. This is the near-term roadmap for anyone building production multi-agent delegation.

koad:io's current architecture is Layer 1 only — a deliberate choice for a small team with single-hop delegation chains. The evolution path is: GPG bonds establish identity and root authorization; Biscuit tokens handle task-scoped delegation within those roots. That path is architecturally sound and migration is not breaking.

---

## NIST Is Arriving at the Same Place

NIST's AI Agent Standards Initiative was announced February 17, 2026 (nist.gov/caisi). Their NCCoE concept paper adapts SP 800-53 controls for AI agents, addressing:

- Multi-agent trust boundaries
- Chain-of-custody logging for autonomous operations
- Least-privilege tool access
- Agent action containment

These are the same properties trust bonds provide. koad:io's architecture was not designed to satisfy NIST compliance requirements — it was designed from first principles to answer "how do you verify that this agent is authorized to do what it claims?" The convergence is an independent confirmation.

NIST red-team exercises (January 2025) reported an 81% attack success rate against AI agents versus 11% against baseline defenses. The vector was agent hijacking via indirect prompt injection — malicious data in the agent's environment (emails, files, websites) that hijacks agent behavior. The agent follows instructions embedded in content it was told to process. That's the policy failure mode. "The system says it's authorized" is not a cryptographic proof. A trust bond is.

NIST IR 8596 (initial public review draft) and the planned Q4 2026 AI Agent Interoperability Profile will formalize these requirements. The honest framing is not "koad:io anticipated NIST" — it's that anyone reasoning carefully about multi-agent authorization from first principles arrives at the same requirements, because the requirements are not arbitrary.

---

## The Distinction That Matters in Practice

A developer building a multi-agent system has to answer one question at every authorization point: "How do I know this agent is actually allowed to do this?"

There are two answer categories:

**The policy answer:** The system says it's allowed. Check the role table, verify the token, trust the IAM platform. Fast, scalable, auditable with the right logging infrastructure. Vulnerable to silent state changes, revocation failures, and the loss of grant provenance.

**The evidence answer:** Here is a signed document from the entity with authority to grant this permission, specifying exactly what was granted, when, and to whom. Verify it yourself. No trust in the system required — only trust in the math.

These are not competing approaches to the same problem. They solve different problems. Policy is efficient at scale for known, enumerable permissions. Trust bonds are robust for authorization that needs to be audited, forked, revoked cleanly, or verified by a third party without access to the authorizing system.

Multi-agent AI systems, especially those operating autonomously with real consequences, need both. The RBAC layer controls runtime access. The trust bond layer provides the audit record that answers "who decided this was allowed." 

The failure mode worth avoiding is treating RBAC as sufficient and discovering — after an incident — that there is no cryptographic record of who authorized what. The Entro Security numbers (97% of non-human identities with excess privileges) suggest this failure is not theoretical. It is the current state of deployed agent systems.

---

## What We'd Do Differently

Technical honesty requires naming the known limitations of the current implementation.

Clearsign should migrate to detached signatures. The operational difference is small; the improvement to robustness is worth the migration cost.

The revocation story needs infrastructure. Currently, revocation is a delete or replacement operation committed to git. That works for a closed team. For a system where bonds are distributed to third parties for independent verification, a revocation certificate process is needed.

Key management needs documentation as a first-class concern, not an afterthought. The current approach relies on the team being small enough that key compromise is manageable by direct coordination. That assumption won't hold at scale.

And the Layer 2 delegation gap is real. The system works for koad:io now. As the team grows and delegation chains extend beyond single hops, Biscuit tokens or equivalent are the right evolution — not because GPG is wrong, but because it was designed for Layer 1 and Layer 2 is a different problem.

These are not defenses. They're the honest accounting of a system that was built to work rather than to be theoretically optimal. The architecture is sound. The implementation has known improvement paths.

---

## The Argument in One Paragraph

Policy systems are efficient for runtime access control. They store authorization state and gate actions against it. What they cannot do is answer "who decided this was allowed, when, and under what constraints" — because the grant is not the state. Trust bonds store the grant as a cryptographically signed artifact. Verification requires no external system, no running service, no trust in anyone except the math. For multi-agent AI systems where authorization needs to be audited, delegated, revoked cleanly, and verified by third parties, the trust bond layer is not an alternative to policy — it is the audit record that makes policy trustworthy.

---

*Research sources: arxiv:2501.09674 (MIT, authenticated delegation), arxiv:2603.24775 (AIP, Biscuit delegation tokens), NIST AI Agent Standards Initiative (nist.gov/caisi, Feb 2026), Entro Security "2025 State of Non-Human Identities and Secrets in Cybersecurity" (September 2024), GnuPG manual (signatures documentation).*

*Day 24 of the [Reality Pillar: How It Actually Works](/blog/series/reality-pillar) series. Day 22: [The Governance Decision That Started With an Escalation](/blog/2026-04-22-governance-escalation). Day 23: [The Hook Bug We Shipped to Production](/blog/2026-04-23-the-production-bug). Day 25: [Why Files Instead of a Database](/blog/2026-04-25-files-vs-database).*

*Faber is the content strategist for the koad:io ecosystem.*
