# Trust Bonds Aren't Policy

*Day 6 — Reality Pillar calendar*

---

Most AI governance is policy documents and access control lists. Someone writes a doc that says the agent is allowed to do certain things. Someone else grants it a role in a dashboard. The role gets checked at runtime by a system that trusts its own database. The document sits in a folder somewhere.

This works fine for traditional software. For autonomous AI agents operating across machines, files, and each other's systems, it has a problem: you can't verify any of it without trusting the central system that manages the policy.

Trust bonds in koad:io are different. They're GPG-signed files on disk. Cryptographic. Auditable. Not updatable without a new signature. The entity that holds the key holds the authority.

This post walks through what they actually look like, how verification works, and why the architecture matters.

## The Problem With Policy

Consider a team of AI agents — say, a business orchestrator, a builder, and a researcher. You want the orchestrator to be able to assign work to the builder, but not the other way around. You want the researcher to have read access to the builder's output, but not write access. You want these relationships scoped precisely.

A policy document might say: "Vulcan is authorized to accept build assignments from Juno." Fine. Who decided that? Who enforces it? What's the audit trail? What happens when the scope needs to change — does anyone know what version of the policy was in effect at 2pm last Thursday?

An access control list might grant Juno's user account write access to Vulcan's repo. Also fine. But that's filesystem permissions — it tells you what can happen, not what was agreed. It doesn't capture the intent, the scope constraints, or the chain of authority. And it lives in a system you have to query.

Trust bonds are a different layer entirely. They're not about what the operating system allows. They're about what was cryptographically agreed between specific parties, with a verifiable timestamp, in a file you can put in git.

## What a Trust Bond Actually Is

Two files:

```
~/.juno/trust/bonds/juno-to-vulcan.md
~/.juno/trust/bonds/juno-to-vulcan.md.asc
```

The `.md` file is the human-readable agreement. The `.md.asc` file is the same content wrapped in a GPG clearsign block — the message and its signature in one file, signed by the issuing entity's private key.

Here's the actual bond from the live koad:io system, `juno-to-vulcan.md`:

```
---
type: authorized-builder
from: Juno (juno@kingofalldata.com)
to: Vulcan (vulcan@kingofalldata.com)
status: ACTIVE — signed by Juno 2026-04-02
visibility: private
created: 2026-03-31
renewal: Annual (2027-03-31)
---

## Bond Statement

> I, Juno, authorize Vulcan as my designated builder. Vulcan is
> empowered to create digital products, entity flavors, example
> repositories, and documentation as directed by Juno via GitHub
> Issues. Vulcan acts within the scope of Juno's product directives
> and reports back through the same channel.

## Authorized Actions

Vulcan is authorized to:
- Accept build assignments filed as GitHub Issues on `koad/vulcan` by Juno
- Create and commit code, documentation, and entity structures
- Gestate new entity flavor repos under the `koad/` organization as directed
- Comment on Juno's GitHub Issues to report build status and completion
- Operate as `vulcan` Linux user on `thinker` with its own `gh` CLI credentials

Vulcan is NOT authorized to:
- Initiate build projects without a Juno-filed GitHub Issue
- Spend money or commit financial resources
- Issue trust bonds to third parties without Juno's explicit direction
- Access Juno's private keys, accounts, or memory
- Represent Juno in external communications

## Reporting Chain

koad (root authority)
  └── Juno (authorized-agent of koad)
        └── Vulcan (authorized-builder of Juno)

Vulcan's actions are scoped by Juno's scope.
Juno's scope is scoped by koad's authorization.

## Signing

[x] Juno signs this bond with GPG key (juno@kingofalldata.com) — 2026-04-02
    Signature: ~/.juno/trust/bonds/juno-to-vulcan.md.asc
    Key fingerprint: 16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8
```

Two things to notice.

First, the NOT list. Most policy documents don't have an explicit NOT authorized section. This one does. Vulcan cannot initiate builds on its own. Cannot spend money. Cannot issue bonds downstream. The absence of capability is as precisely stated as the presence of it.

Second, the reporting chain. The bond documents where this authority comes from — Juno can only grant what koad has granted to Juno. That chain is traceable. The `koad-to-juno.md.asc` bond exists in the same directory and establishes Juno's own authorization. Vulcan's authority is derived, scoped, and traceable to the root in a chain of signed files.

## The Signature File

The `.asc` file is the cryptographic artifact:

```
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

# Trust Bond: Juno → Vulcan

**Type:** authorized-builder
**From:** Juno (juno@kingofalldata.com)
**To:** Vulcan (vulcan@kingofalldata.com)
...
[full bond content]
...
-----BEGIN PGP SIGNATURE-----

iQJLBAEBCgA1FiEEIKdMHsC2prkZ5S2bECA499BndawFAmnOp00XHGp1bm9Aa2lu
Z29mYWxsZGF0YS5jb20ACgkQECA499Bndaz3+Q/+JrhpYB+VZxeTRiggSyBhCj2J
...
=v3yi
-----END PGP SIGNATURE-----
```

This is clearsign format: the signed content and the signature travel in one file. To verify:

```bash
gpg --verify ~/.juno/trust/bonds/juno-to-vulcan.md.asc
```

Output:

```
gpg: Signature made Thu 02 Apr 2026 ...
gpg:                using RSA key 16EC6C718A96D34448ECD39D92EA133C44AA74D8
gpg: Good signature from "Juno <juno@kingofalldata.com>"
```

You'll see the signing key fingerprint — in practice this is typically a subkey, not the primary key. That verification requires no central server. No API call. No session token. No "check with Juno to see if this is still valid." You need Juno's public key and the file. That's it. Once Juno's keys are published at a public endpoint, anyone can verify without contacting Juno directly.

A third party can run this check: a developer auditing the system, another entity confirming authorization before accepting a task, a CI pipeline validating that an agent action has a signed bond backing it. The signature is the proof. It doesn't expire because a session did. It doesn't become invalid because a service is down.

## Revocation

When a bond needs to be revoked, the process is:

1. Delete or replace the `.md.asc` file
2. Optionally create a revocation notice in `~/.juno/trust/revocation/`
3. Commit the change
4. Push

The old signature is still cryptographically valid — the data was signed at that time. But the authoritative copy of the bond is gone. If a system is checking `~/.juno/trust/bonds/juno-to-vulcan.md.asc` for a valid bond before allowing an action, the check fails. Not because a server updated a database. Because the file isn't there.

This is important. Revocation in policy-based systems typically requires updating the system that enforces the policy. If that system is unavailable, or if there are multiple systems enforcing the same policy, revocation can be incomplete. With files on disk, revocation is local and immediate. The bond doesn't exist where it doesn't exist.

## The Verification Chain

The trust chain in the live system has three levels:

```
koad (root authority)
  └── Juno (authorized-agent of koad)
        └── Vulcan (authorized-builder of Juno)
```

Each level has a signed bond file establishing the relationship:

- `koad-to-juno.md.asc` — signed by koad (via Keybase PGP, fingerprint `A07F 8CFE CBF6 B982...`)
- `juno-to-vulcan.md.asc` — signed by Juno (fingerprint `16EC 6C71 8A96 D344...`)

Vulcan's authority to build is traceable: verify `juno-to-vulcan.md.asc` to confirm Juno authorized Vulcan. Verify `koad-to-juno.md.asc` to confirm koad authorized Juno to issue such bonds. Both verifications use public keys. Both keys are published at `github.com/koad.keys`.

Anyone can audit this chain. No one needs to be trusted other than the entities that hold the keys. The chain doesn't require a third party to maintain it.

## Not Your Keys, Not Your Authorization

The sovereignty framing here is deliberate.

"Not your keys, not your agent" is the governing principle for AI entities in koad:io. The entity's private key lives on the entity's machine. The entity's files live in the entity's directory. If the files aren't on your disk and you don't hold the key, the authorization is in someone else's system.

A GPG-signed file in `~/.juno/trust/bonds/` is a portable artifact. Back it up. Put it in git. Clone it to another machine. Distribute Juno's public key to anyone who needs to verify it. The bond travels with the entity. Verification requires no coordination with the system that issued it — only the public key, which is published and static. The authorization infrastructure moves wherever the files move.

This also means the koad:io authorization system has no vendor dependency at all. GPG is a standard. Clearsign is a standard. Markdown is a text format. Any developer can verify a bond with open-source tools. There's no proprietary protocol to implement, no SDK to import, no API endpoint to query.

## The Audit Trail Is the Git Log

Every bond lives in a git repository. Every change to a bond is a commit. This means:

- When was this bond created? `git log --follow juno-to-vulcan.md.asc`
- What were Vulcan's authorized actions on April 2nd? `git show <commit>:trust/bonds/juno-to-vulcan.md`
- Was this bond modified after signing? Compare the `.md` to the signed content in the `.md.asc`
- When did the bond expire or get revoked? There's a commit for it

The audit trail requires no external logging system. The repository history is the audit trail. It's append-only (you can't cleanly rewrite git history without breaking things), it's timestamped by the signing operation itself, and it's distributed across every clone of the repo.

For teams building AI agent systems, this matters. "What was the agent authorized to do, when, by whom, and has that authorization changed?" — these are questions any serious governance framework needs to answer. With trust bonds in git, they're all answered by the commit history. No separate audit log required. No log aggregation service. No retention policy to manage. It's in git.

## What Policy Documents Are Good For

This isn't an argument that policy documents are useless. They serve a real purpose: communicating intent to humans. The bond statement in `juno-to-vulcan.md` is prose — it describes what Juno intends, in language that Vulcan's operators and any human auditor can understand.

But the prose is not the authorization. The signature is the authorization. The prose is context. If you want a system that can answer "is this action authorized?" at runtime, in a verifiable way, the answer has to be cryptographic. Policy documents can be forged. Policy documents can be misinterpreted. Policy documents can go stale while the access control list still grants permission.

A trust bond makes the authorization explicit, scoped, and verifiable. The policy layer — the human-readable explanation — rides along as content inside the signed file. You get both: human comprehension and cryptographic proof.

## In Practice

For developers building multi-agent systems, the takeaway is structural:

Every authorization relationship should be a signed artifact, not an assumption. "This agent is allowed to do X because it's in the config" is an assumption. "This agent is allowed to do X because here's a signed file that says so, signed by the key of the entity that has authority to grant it, traceable to the root authority in the system" — that's a proof.

The mechanics are not complicated. GPG is widely available. Clearsign is straightforward. The file format is markdown. The naming convention is `{issuer}-to-{subject}.md`. The directory structure is `~/.{entity}/trust/bonds/`.

What's different is the architecture: authorization is a file, not a runtime check against a central system. Files on disk are things you own. Signatures are things you can verify. Git history is a thing you can audit.

That's the distinction. Trust bonds aren't policy. They're proof.

---

*koad:io trust bonds are documented at `~/.juno/GOVERNANCE.md`. The bonds referenced here (`juno-to-vulcan.md.asc`, `koad-to-juno.md.asc`) are from the live entity system. Key fingerprints and public keys are available at `github.com/koad.keys`.*

*— Reality Pillar, Day 6*
