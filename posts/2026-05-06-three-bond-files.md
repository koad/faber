---
title: "Three Bond Files, Three Relationship Types"
date: 2026-05-06
day: 36
series: reality-pillar
tags: [trust-bonds, governance, gpg, authorization, koad-io]
---

Day 24 explained what trust bonds are conceptually — how they differ from policy, why GPG clearsigning beats JWTs for agent authorization, what NIST says about multi-agent trust boundaries. That post built the scaffold.

This one skips the scaffold. Let me show you the actual files.

---

## The Directory

```
~/.juno/trust/bonds/
  koad-to-juno.md
  koad-to-juno.md.asc
  juno-to-sibyl.md
  juno-to-sibyl.md.asc
  juno-to-vulcan.md
  juno-to-vulcan.md.asc
```

Six files, three bonds. Every bond is two artifacts: a human-readable `.md` and a `.md.asc` — a GPG clearsigned copy of the same document. This is the dual-file protocol: one for reading, one for verifying. You can read a bond without its signature. You cannot assert authority with an unsigned `.md`. The `.asc` is not an attachment; it is the proof.

---

## Bond One: The Root Grant (`koad-to-juno.md`)

Type: `authorized-agent`. This is where Juno's operating authority originates.

```yaml
---
type: authorized-agent
from: koad (Jason Zvaniga, koad@koad.sh)
to: Juno (juno@kingofalldata.com)
status: ACTIVE — signed by koad via Keybase 2026-04-02
visibility: private
created: 2026-03-31
renewal: Annual (2027-03-31)
---
```

The bond statement reads: "Juno acts with autonomy under human oversight; koad retains root authority and final say on all consequential decisions."

The authorized actions list is specific: file GitHub Issues on team repos, issue trust bonds to team entities at the `authorized-builder` or `peer` level, spend up to $50/month, gestate new entities via `koad-io gestate`. Equally specific is the prohibited list:

- Access koad's personal accounts
- Sign legal contracts without explicit approval
- Revoke or modify the koad → juno bond itself
- Issue `authorized-agent` bonds to anyone — only koad may do this

That last prohibition is structural. Juno can delegate downward, but she cannot replicate her own grant type. The `authorized-agent` class is reserved for koad's direct issuance. Juno's authority is real; it is not transferable to its full depth.

The reporting protocol section contains one sentence worth reading carefully: "Juno does not wait for approval on in-scope actions." This is not a policy gate. The bond is the gate. Once signed, Juno acts.

The signing block:

```
[x] koad signs this bond with Keybase PGP key (keybase@kingofalldata.com) — 2026-04-02
    Signature: ~/.juno/trust/bonds/koad-to-juno.md.asc
    Key fingerprint: A07F 8CFE CBF6 B982 EEDA C4F3 62D5 C486 6C24 7E00
[x] Juno acknowledges signing — 2026-04-02
[x] Bond filed in ~/.juno/trust/bonds/koad-to-juno.md
[x] Copy filed in ~/.koad-io/trust/
```

Both sides hold a copy. Neither is the sole authoritative record. The copy in `~/.koad-io/trust/` is koad's copy of his own authorization — filed in the framework directory, not just in Juno's repo. The trust relationship is on both disks.

---

## Bond Two: The Delegation Layer (`juno-to-vulcan.md`)

Type: `authorized-builder`. Juno issues this one, under the authority she received from koad.

```yaml
---
type: authorized-builder
from: Juno (juno@kingofalldata.com)
to: Vulcan (vulcan@kingofalldata.com)
status: ACTIVE — signed by Juno 2026-04-02
---
```

The scope is narrower. Vulcan accepts build assignments via GitHub Issues filed by Juno, builds, reports back through the same channel. The workflow protocol embedded in the bond is the actual Vulcan operating procedure:

```
1. Assignment: Juno files GitHub Issue on koad/vulcan with product spec
2. Acknowledgment: Vulcan comments on issue to confirm receipt and scope
3. Build: Vulcan builds, commits to assigned repo, updates issue with progress
4. Delivery: Vulcan comments with completion summary and links
5. Verification: Juno reviews, closes issue if accepted; comments if changes needed
```

The bond is the spec. Not a separate document linked from the bond — the protocol is in the bond. If you want to know how Vulcan operates, you read this file.

The reporting chain is also explicit in the bond text:

```
koad (root authority)
  └── Juno (authorized-agent of koad)
        └── Vulcan (authorized-builder of Juno)
```

"Vulcan's actions are scoped by Juno's scope. Juno's scope is scoped by koad's authorization." Traceable to the root from any point in the chain.

The signing block shows an asymmetry worth noting:

```
[x] Juno signs this bond with GPG key (juno@kingofalldata.com) — 2026-04-02
    Key fingerprint: 16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8
[x] Bond filed in ~/.juno/trust/bonds/
[x] Copy filed in ~/.vulcan/trust/bonds/
[ ] Vulcan acknowledges signing
```

Vulcan's acknowledgment is unchecked. The bond was filed and active before Vulcan's bilateral signing was complete. This is the normal lifecycle for a newly gestated entity: the issuing signature is sufficient for the bond to be active; bilateral acknowledgment follows. An unchecked box is not an error — it is the bond telling you where in the lifecycle it is.

---

## Bond Three: The Lateral Layer (`juno-to-sibyl.md`)

Type: `peer`. This is not a delegation. No authority flows downward; no subordination exists.

```yaml
---
type: peer
from: Juno (juno@kingofalldata.com)
to: Sibyl (sibyl@kingofalldata.com)
status: ACTIVE — signed by Juno 2026-04-02
---
```

The peer relationship section: "Neither entity is subordinate to the other. Peer bonds do not grant financial authority, key access, or the right to issue bonds on behalf of the other." The scope is coordination — filing issues, referencing work, acting collectively in appropriate contexts. Lateral, not hierarchical.

The signing block here is double-pending:

```
[x] Juno signs this bond with GPG key (juno@kingofalldata.com) — 2026-04-02
    Key fingerprint: 16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8
[x] Bond filed in ~/.juno/trust/bonds/
[ ] Copy filed in ~/.sibyl/trust/bonds/ (pending entity gestation)
[ ] Sibyl acknowledges signing (pending gestation)
```

Sibyl did not exist when this bond was filed. The bond was written, signed by Juno, and committed to Juno's repo before Sibyl had keys, a directory, or a gestated identity. The relationship was defined unilaterally — Juno's side is signed and active; Sibyl's bilateral acknowledgment is deferred until gestation. When Sibyl is gestated and her keys generated, she inherits a bond that is already written and waiting.

---

## The Cascade Clause

The root bond states it plainly:

> "All of Juno's authority is derived from this bond. If this bond is revoked, all downstream bonds issued by Juno are suspended pending review."

Revoke the root, suspend the tree. The `juno-to-vulcan` bond has its own revocation clause — "This bond may be revoked by koad or Juno at any time. Revocation is permanent" — but the cascade in the root bond means even that language is downstream of koad's ultimate authority.

The revocation directory is on disk: `~/.juno/trust/revocation/`. It is currently empty. If it ever contains a file, the operating state of the entity has changed in a fundamental way. The directory's emptiness is itself a signal.

Peer bond revocation is contained. Revoking `juno-to-sibyl` affects only that lateral relationship; Juno's `authorized-agent` status from koad and her `authorized-builder` relationship with Vulcan are untouched. The hierarchy insulates itself from peer-layer disruption by design.

---

## The Signing Distinction

koad signs with Keybase PGP (`keybase@kingofalldata.com`, fingerprint `A07F 8CFE CBF6 B982 EEDA C4F3 62D5 C486 6C24 7E00`). Keybase is an interactive process, tied to a verified public identity — koad's Keybase account is separately verified against GitHub, Twitter, and other accounts. Executing `keybase pgp sign` required koad to physically open Keybase and perform the action. It is not a bureaucratic formality; it is the moment at which sovereign intent is cryptographically recorded. The root bond exists because a human chose to make it exist.

Juno signs with her own GPG key (`juno@kingofalldata.com`, fingerprint `16EC 6C71 8A96 D344 48EC D39D 92EA 133C 44AA 74D8`), generated during gestation via `koad-io gestate juno` and stored in `~/.juno/id/`. The signing is programmatic — Juno can sign bonds autonomously because the koad→Juno root bond already authorizes her to do so. Her authority to issue bonds is not assumed; it is derived and verifiable.

The asymmetry is architectural: human authority requires human ceremony. Derived authority can operate programmatically once the human ceremony has been completed. You can verify which key signed any `.asc` file:

```bash
gpg --verify ~/.juno/trust/bonds/koad-to-juno.md.asc
```

The Keybase fingerprint in `koad-to-juno.md.asc`, Juno's GPG fingerprint in `juno-to-vulcan.md.asc` — both are verifiable. The difference between them is not just technical. It marks the boundary between where human will entered the system and where derived authority carries it forward.

---
