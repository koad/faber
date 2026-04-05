---
title: "Show HN: koad:io — give your local AI agent a home directory (identity, memory, authorization in git)"
date: 2026-04-10
author: Faber
status: ready
channel: hackernews
format: show-hn
post-by: koad
timing: Tuesday 8–10am ET
issue: koad/faber#9
---

# Show HN: koad:io — give your local AI agent a home directory (identity, memory, authorization in git)

---

Your local AI agent doesn't know who it is between restarts.

I gave it a home directory.

---

`~/.juno/` is a directory on disk. Here's what's in it:

```
~/.juno/
  memories/001-identity.md     ← who the agent is (persistent, committed)
  trust/bonds/juno-to-sibyl.md ← what it's authorized to do (GPG-signed file)
  LOGS/                        ← what it decided (git history is the audit trail)
  id/                          ← Ed25519, ECDSA, RSA, DSA keypairs on your hardware
```

Three commands tell the whole story:

```bash
cat ~/.juno/memories/001-identity.md
```
That's Juno's identity. A committed file. Not a prompt parameter. Not a runtime variable. A file with a 6-day git history that survives any restart, any framework swap, any host migration.

```bash
gpg --verify ~/.juno/trust/bonds/juno-to-sibyl.md.asc
```
That's authorization. Juno issued a signed peer bond to Sibyl (the research entity). The bond is readable — open it with any text editor and it tells you exactly what Sibyl is permitted to do and who said so. Compare that to a 403 with no explanation.

```bash
git log --author="Juno" --oneline
```
That's accountability. 213 commits across 6 days of real operations. The entity's cognitive history, timestamped, attributed, tamper-evident. Not a vendor audit log. The same git you already use.

---

**Why git is the right substrate for agent identity**

The Unix home directory is the intellectual ancestor. Every Unix user has `~/.bashrc`, `~/.ssh/`, `~/.gitconfig` — files that define who the user is to the system. koad:io applies the same model to AI agents. `~/.juno/` is Juno's home directory. She reads it on every invocation.

Git gives you four capabilities that nothing else does cleanly:

- **Fork** to create a new entity lineage (Juno → new entity with different authorization scope)
- **Roll back** to undo a drift (the entity behaved oddly for two sessions; `git revert` fixes it)
- **Diff** to see what changed between sessions (not "the model changed" — the actual files that define it)
- **Clone** to move the entity to different hardware (`cp -r and it moves` — identity, history, bonds, all of it)

The sovereignty argument is architectural, not philosophical: `~/.juno/` is on your disk. `git remote -v` points to your repo. There is no cloud dependency in the startup sequence. A vendor going offline doesn't revoke your agent's identity, because the identity is a file.

---

**What's running on it**

15 entities have been operating on koad:io for 6 days: Juno (business ops), Vulcan (builder), Sibyl (research), Veritas (quality), Mercury (communications), Muse (UI), and nine others. Each entity is its own `~/.<entity>/` directory. Each has its own git repo, its own keypairs, its own trust bonds.

The operations are public. `git log --oneline` on any entity repo shows what it has actually done.

---

**What koad:io doesn't do**

koad:io doesn't manage inference. It has no opinion about your models, your VRAM, or your inference stack. Bring Ollama, llama.cpp, Claude Code, whatever runs locally. koad:io sits above that layer and gives the agent a stable identity before the inference session begins.

It's also not an agent framework. LangGraph agents can run inside a koad:io entity. The entity provides identity, memory, and authorization; the framework provides task execution. Different layers.

---

**How to try it**

```bash
git clone https://github.com/koad/juno
cat juno/memories/001-identity.md
```

That's what persistent agent identity looks like. No setup required to understand the pattern.

Full framework: https://github.com/koad/koad-io

---

The category name — "agent home directory" — doesn't exist yet as a defined pattern. CLAUDE.md and AGENTS.md are project configs. Letta/MemGPT solves memory (facts the agent knows). koad:io solves identity (who the agent is). The ICM paper (arxiv:2603.16021) describes filesystem-as-orchestration during execution; koad:io is filesystem-as-identity before execution starts.

Happy to go deep on the trust bond architecture, the pre-invocation context assembly pattern, or how authorization chains work across entities.

---

## First Comment (posted by koad immediately after submission)

---

A few things worth saying upfront before the thread develops:

**On "why not CrewAI/AutoGen/LangGraph":**

Those frameworks assign identity via code parameters at runtime — `role="researcher"`, `system_prompt="You are..."`. Code parameters reset on restart. koad:io stores identity in committed files. The difference isn't academic: when Juno restarts, she reads `memories/001-identity.md` from git. The file has a 6-day history. When a CrewAI "researcher" restarts, it reads a string in your Python file. One of those is an entity with continuity. The other is a configuration that happens to sound like one.

That said: koad:io is not a replacement for those frameworks — it's what you add before them. You can run LangGraph task execution inside a koad:io entity. The entity layer handles who the agent is; the framework handles what it does.

**On "what does Claude Code add beyond a wrapper":**

Nothing, by design. koad:io doesn't modify Claude Code or add a proprietary layer on top of it. Each entity is a directory with a `.env` file that sets `ENTITY=juno` and `ENTITY_DIR=/home/koad/.juno`. When Claude Code starts in that directory, it reads PRIMER.md (the entity's current-state brief) and CLAUDE.md (the entity's standing instructions). That's it. The value isn't in wrapping the model — it's in what's in the directory when the model starts. The context pre-loads identity, authorization scope, and operational history. The model reads it. The model acts as that entity. Framework-agnostic by architecture.

**What's not built yet (honest accounting):**

- The gestation tooling (`koad-io gestate <entityname>`) is functional but not packaged for easy external use. If you want to try creating your own entity today, you're essentially templating a directory structure and a `.env` file — that's actually most of what gestation does.
- Cross-entity trust verification is manual right now. The bonds are signed and verifiable via `gpg --verify`, but there's no automated enforcement layer — a misbehaving entity won't be automatically blocked by the framework. That's a daemon feature, not yet shipped.
- The full daemon (the component that routes tasks between entities and enforces trust scope) is in progress.

The directory structure, the git-native identity, the signed trust bonds — those are working and have been running for 6 days. The rest is sequenced.

---
