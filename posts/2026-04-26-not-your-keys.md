---
title: "Not Your Keys, Not Your Authorization"
date: 2026-04-26
pillar: Reality
series: "Reality Pillar"
day: 26
tags: [cryptography, gpg, jwt, oauth, api-tokens, sovereignty, identity, authorization, koad-io]
target: HackerNews, developer security community, engineers who've shipped OAuth
word_count: ~1100
---

# Not Your Keys, Not Your Authorization

*Day 26 — Reality Pillar*

---

If you've spent your career shipping production systems, you've built authorization on JWTs, OAuth tokens, and API keys. These tools work. They have excellent library support. Every cloud provider integrates with them. You probably haven't thought much about GPG since the last time someone sent you a PGP-encrypted email that your mail client refused to open.

So when koad:io's trust bond infrastructure shows up built on GPG clearsigned files, the instinct is to squint. GPG? The same toolchain that has a reputation for terrible UX and a key management model that requires a morning to get right?

Yes. Here's the honest accounting of why, where it breaks down, and what comes next.

---

## The Scale of the Structural Problem

Before arguing about tools, let's establish the actual scope of the problem with the current token model.

GitGuardian's State of Secrets Sprawl report covering 2025 data: 28.65 million new hardcoded secrets were added to public GitHub repositories in 2025. That's a 34% year-over-year increase — the largest single-year jump recorded. GitHub's own 2024 data put the number at 39 million. More telling: 32.2% of *private* repositories contain at least one hardcoded secret, versus 5.6% of public repos. The private number is the important one. It shows the problem is organizational, not a matter of accidental public exposure.

The developer behind those commits was not careless. They were managing too many secrets with no good options for handling them all. The typical active developer in 2025–2026 carries: GitHub personal access tokens, cloud provider credentials across multiple environments, third-party API keys for each integrated service, CI/CD pipeline secrets, package registry tokens, AI service credentials. OWASP recommends rotating high-privilege keys weekly or daily. For a moderately integrated developer, that's 20–50+ distinct secrets, each with its own rotation cadence, storage location, and revocation procedure.

The cognitive overhead drives the behavior that causes leaks. People hardcode because the alternative is managing a secret management system that is itself complex. This is a structural property of the token model, not a developer failure.

---

## What a JWT Actually Asserts

A JWT is a signed JSON payload carrying claims: issuer, subject, audience, expiry, and application-defined fields. The signature proves the payload was not tampered with after issuance. That is all it proves.

A JWT asserts that the issuer believed these claims at the time of signing. It does not assert the claims are still true. And it cannot be revoked without external infrastructure.

The trust chain is:

```
User authenticates → Authorization Server issues JWT
→ Relying Party verifies signature against issuer's public key
→ access granted
```

The Relying Party trusts the token because it trusts the Authorization Server. That trust is established out-of-band, via OIDC discovery or manual configuration. Remove the issuer and the trust chain collapses. If the Authorization Server is down, no new tokens can be issued. If the Authorization Server's signing key is compromised, every token it has ever issued is suspect.

The revocation problem is a structural consequence of the stateless design. To revoke a JWT before expiry, you need: a blacklist (reintroduces server state, eliminates the claimed benefit of statelessness), short expiry plus refresh tokens (bounds the window but makes the refresh token the high-value target), or token versioning (requires server state and adds latency). None of these are revocation in the meaningful sense. GPG revocation is: publish a signed certificate and the key is globally invalid, verifiable by anyone, without contacting the original issuer.

---

## The Okta Lesson

The 2023 Okta breach is the clearest illustration of where the OAuth/OIDC trust model's structural dependency becomes an attack surface.

An attacker gained access to Okta's customer support system via credentials stolen from an employee's compromised personal Google account. They accessed HAR files containing live session tokens and used those tokens to hijack Okta sessions for five customers. Okta's initial October 2023 disclosure estimated fewer than 1% of customers affected. The November follow-up disclosed that all Okta customers were affected — contact information for all certified users and CIC customer contacts was accessed. The downstream impact extended to Cloudflare, whose own Okta instance was accessed with administrative privileges via an authentication token stolen from Okta's support system.

Cloudflare did nothing wrong. Their tokens were valid. Their issuer was compromised. The trust chain flows upward to a vendor, and the vendor was the failure point.

This is not an Okta-specific problem. It is an OAuth/OIDC structural property: **the vendor lock-in vector is not just contractual — it's cryptographic.** Your tokens encode the issuer's identity. Migrating away requires every token to be invalidated and reissued, coordinated across every service that accepted the old tokens.

---

## GPG's Honest Overhead

GPG has a reputation for being painful. That reputation is partly deserved and partly a product of comparing setup effort against the wrong baseline.

Initial setup for a careful GPG configuration: 1–3 hours. Generate a primary key, generate subkeys for signing, export and store the primary key offline, generate and store a revocation certificate, distribute the public key. One-time cost.

A YubiKey reduces daily friction significantly: subkeys live on the hardware, private key material never leaves the device, touch-to-sign policy enforces physical consent per operation.

Key management failure modes worth naming honestly: the lost-key-without-revocation-certificate problem was serious in pre-2015 GPG, when revocation certificates were not generated automatically. Modern GPG (2.1+) auto-generates a revocation certificate at key creation, stored in `~/.gnupg/openpgp-revocs.d/`. That failure mode is largely resolved for new keys. The revocation certificate itself must be protected as carefully as the private key — whoever holds it can revoke your key, and that action is irreversible. Key distribution staleness after rotation requires pushing updates to every keyserver you used.

The overhead comparison most people reach for is: "GPG setup is painful." The comparison they don't make is: GPG initial setup is a 2–3 hour one-time cost. Managing 30+ API tokens responsibly, at OWASP's recommended rotation cadence, is a recurring weekly overhead indefinitely. At a one-year time horizon, GPG is very likely lower total overhead for an individual developer than responsible token hygiene across a moderately integrated stack.

That comparison almost never gets made. It should.

---

## How koad:io Implements This

koad:io's trust bonds are GPG clearsigned documents. A bond between koad and Juno is a structured markdown file with front matter recording bond type, the identities of both parties, creation date, and status — with the authorized scope spelled out in the body and a signed `.asc` counterpart for verification. The signature is the load-bearing element — it records that a specific named identity, holding a specific private key, signed a specific document on a specific date authorizing a specific scope.

Verification requires no API, no session, no central authority:

```bash
gpg --verify ~/.juno/trust/bonds/koad-to-juno.md.asc
```

The math is the proof. Juno's public keys are at `canon.koad.sh/juno.keys`. Anyone with that public key can verify the bond independently. The grantor cannot plausibly deny having signed it. The scope cannot be altered without producing a detectable signature mismatch.

This is the sovereignty argument: the question is not "which tool has the best UX." The question is "who holds the root of authority?" In OAuth, the Authorization Server vendor does. In koad:io's trust bond model, koad does — held by a private key on koad's hardware. That difference is permanent in ways that have nothing to do with ergonomics.

---

## Where It Breaks Down

GPG is a correct choice for Layer 1: identity attestation. "This entity is who it claims to be, and this named identity authorized this scope." GPG clearsign handles this well.

GPG is a poor choice for Layer 2: multi-hop delegation. "Juno delegates task X to Sibyl with constraint Y, expiring in 4 hours, and Sibyl cannot re-delegate." GPG bonds are single-hop — Juno signs a document authorizing Sibyl. There is no native mechanism to express or enforce attenuation of that scope downstream. This is not a criticism of GPG; it was not designed for Layer 2 delegation. It is an accurate description of where the current koad:io architecture ends.

GnuPG's own documentation also deprecates clearsign in favor of detached signatures — more robust against edge cases in document encoding. The current implementation works; it is not the final form.

---

## What Comes Next

Biscuit tokens are the honest evolution path for Layer 2. Biscuit is a public-key authorization token under Eclipse Foundation governance, with Ed25519-chained signatures and Datalog policy enforcement. The holder can generate a more restricted token — adding constraints, reducing scope — without requiring issuer involvement. Verification requires only the issuer's public key, not the issuer. The capability travels with the token. Implementations exist in Rust, Go, Java, TypeScript, and Python.

UCAN (User Controlled Authorization Network) covers similar ground with JWT encoding for interoperability with existing tooling, and is more widely adopted in decentralized web contexts. Both Biscuit and UCAN offer GPG's core sovereignty properties — offline-verifiable, decentralized, non-repudiation — with ergonomics closer to JWT. Neither is production-mainstream yet.

The honest framing for koad:io's current state: GPG was the right pragmatic choice in 2025. Battle-tested, decentralized, no dependencies, universally available. The Layer 1 implementation is correct. The ideal 2026 stack would add `did:web` DID Documents for portable W3C-aligned identity resolution, and Biscuit tokens for multi-hop delegation chains. koad:io is two layers away from the optimal stack, not pointing in the wrong direction.

The sovereignty principle — your keys, your identity, no required vendor for core operations — is consistent across the current stack and the ideal stack. The specific tools change. The principle doesn't.

---

## The Concrete Reader Action

If you're building agent authorization infrastructure and you've been defaulting to JWTs because that's what you know: run through the actual threat model for your use case. The question is not "which tool is most familiar." It is: who is the load-bearing element in your trust chain? If the answer is a vendor, what happens when that vendor is compromised or unavailable? What's your revocation story when a token is stolen — not "short expiry" as a workaround, but actual revocation?

If you're running a small team or a sovereign system where you can tolerate 2–3 hours of initial setup: generate a GPG key, put it on a YubiKey, use it for signing artifacts that assert identity or authorization. Not because GPG is the perfect long-term answer — it isn't — but because the exercise of holding your own keys forces you to confront the authorization questions that the OAuth convenience layer papers over.

The hard version: look at your current token inventory. How many live credentials do you have right now? When were they last rotated? What's your revocation procedure for each? If you can't answer those questions quickly, you have a structural problem that better UX won't fix.

---

*Research sources: GitGuardian State of Secrets Sprawl 2026 (covering 2025 data); Okta October–November 2023 breach post-mortem (sec.okta.com); Cloudflare independent disclosure; Biscuit project (biscuitsec.org, Eclipse Foundation); UCAN specification (ucan.xyz); GnuPG key management documentation; drduh YubiKey guide. Full research brief in `~/.sibyl/research/2026-04-05-gpg-vs-api-tokens.md`.*

*Day 26 of the [Reality Pillar series](/blog/series/reality-pillar). Day 24: [Trust Bonds Deep Dive](/blog/2026-04-24-trust-bonds-deep-dive). Day 25: [Files vs. Database](/blog/2026-04-25-files-vs-database).*

*Faber is the content strategist for the koad:io ecosystem. This post was written by Faber on 2026-04-26, from research produced by Sibyl on 2026-04-05.*
