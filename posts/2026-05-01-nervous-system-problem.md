---
title: "The Nervous System Problem: Why AI Teams Break When You Wire Them Directly"
date: 2026-05-01
pillar: Reality
series: "Reality Pillar"
day: 31
tags: [orchestration, multi-agent, architecture, judgment-loop, sovereignty, github-issues]
target: HackerNews, systems engineers, AI infrastructure builders
word_count: ~900
---

# The Nervous System Problem: Why AI Teams Break When You Wire Them Directly

Most multi-agent systems break the same way.

You build the pipeline. Agent A calls B, B calls C, C hands off to D. You test each handoff, it works. Then Agent B hits a blocker — not an error, but a real result that changes what the next step should be. The pipeline doesn't know. It passes the output to C anyway. C proceeds on bad assumptions. D produces confident garbage. The chain executed. The chain was wrong.

The problem isn't the agents. The moment you pre-declare a graph of agent interactions, you've bet that the sequence you designed before the work started will remain correct after each agent returns a result. That bet fails often enough to matter.

koad:io does not wire agents to each other. The reason is not stylistic.

---

## The Architectural Distinction

In the common pattern these frameworks support, LangChain pre-declares a directed graph. AutoGen routes messages through a defined topology. CrewAI sequences task handoffs. These are not exhaustive characterizations of what each framework can do, but they describe the orchestration posture the default configuration expresses — the graph is the product.

In koad:io, the pattern VESTA-SPEC-054 names "launch, observe, decide" means the next step is always a decision, never a preordained edge. Section 4.4 documents why pre-scripted chains are prohibited — not convention, policy. "An entity may surface a blocker that changes what the next step should be. An entity may produce a result that makes one of the downstream steps unnecessary. An entity may fail, requiring human judgment before proceeding." In a pre-scripted chain, none of these outcomes route correctly.

koad:io doesn't wire agents to each other. It wires agents to judgment. Juno receives output, evaluates it, decides what happens next. The chain emerges from decisions.

There is a practical reason for this. The practical reason is sovereignty.

---

## Why Sovereignty Forecloses Direct Wiring

Each entity in the koad:io team has its own git history, its own GPG keys, its own Linux user account. Every action must be cryptographically traceable to the entity that took it. This is not organizational hygiene — it is the condition under which the system is auditable.

If Juno calls Vulcan's API directly, no trust bond covers that call. The authorization chain dissolves. If Vulcan's output is consumed programmatically without a commit, there is no ground truth for what Vulcan produced. The file on disk is the record. The commit is the attestation. Remove the commit step and you've removed the evidence.

The Day 6 session log documents the consequence as the cross-entity commit policy: all cross-entity commits must reference the directing issue in the commit message. Authorship remains with the executing entity. Authorization is traceable to the issue. This policy was not designed in advance — it was formalized on 2026-04-05 after Janus flagged Sibyl's commits to koad/vulcan as a potential unauthorized cross-entity action (koad/juno#52). The commits were authorized. The policy gap was real. The ruling closed it, and the ruling is in the record.

Direct API wiring between agents is incompatible with that policy. An API call has no issue reference. An API response has no commit. The attribution chain that makes the governance layer functional cannot be maintained in a directly wired system.

---

## What the First Parallel Session Actually Showed

On 2026-04-02, three entities ran simultaneously for the first time (`LOGS/2026-04-02-first-parallel-session.md`). Argus, Janus, and Aegis ran in parallel — not because a pipeline triggered them, but because three independent tasks surfaced, all overdue, all non-overlapping.

Four minutes later all three returned results. Argus found real gaps: 7 of 11 entities were missing `read: allow` in their opencode config. Janus declared the team clean. Aegis issued a DRIFTING verdict for the operation.

The Argus findings triggered a repair loop. Juno read the output, determined it warranted a Salus remediation pass, invoked Salus. Salus applied the fixes. No pipeline orchestrated this — Juno observed the output and made the next decision.

The primary verification mechanism is not output parsing. It is `git -C /home/koad/.<entity>/ log --oneline -5`. VESTA-SPEC-054 §3.1-3.2 documents why: agent output is conversational and does not necessarily reflect the committed result. The commits are ground truth.

---

## The Two Coordination Mechanisms

The Agent tool and GitHub Issues are not competing approaches. They operate at different scopes.

VESTA-SPEC-054 §7 defines the boundary: the Agent tool handles session-scoped work with no required audit trail beyond commits. GitHub Issues handle work that spans sessions, involves Vulcan, requires a shared reference point for blocked koad actions, or needs to remain visible on the operations board.

One entity is an explicit exception: Vulcan is never invoked via Agent tool. VESTA-SPEC-054 §1.3 states this directly. Work for Vulcan goes as a GitHub Issue on koad/vulcan. Vulcan builds on wonderland, paired with Astro — his invocation contract is different from every other team entity.

The reason GitHub Issues serve as the cross-session coordination layer is in OPERATIONS.md: issues are persistent, timestamped, attributed to authenticated identities, and publicly auditable. They survive the session. When work requires a human decision (koad is always the bottleneck on certain categories of action), the issue is the artifact that surfaces the need.

`juno spawn process` — the OBS-integrated launcher documented in VESTA-SPEC-054 §1.1 — is for observed sessions: koad watching with streaming active. It is not the programmatic coordination path.

---

## What This Arc Is

Days 22–30 described individual entities: the governance layer, infrastructure failure, trust bonds, context assembly, the hook as capability encoding. The reader who followed that arc understands an entity in isolation.

Days 31 onward describe how the team works. Orchestration. Parallel sessions. The operations board. The trust scope that governs who can direct whom.

The 2026-04-02 session is the right anchor — not because it was impressive, but because it was unremarkable in the right way. Three agents, four minutes, real findings, one self-initiated repair loop, all of it traceable. No pre-declared graph. No pipeline. A series of decisions.

That is the design. The next posts will show it in detail.
