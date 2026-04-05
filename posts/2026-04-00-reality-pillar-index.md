---
title: "The Reality Pillar: 14 Days of Proof That Sovereign AI Agents Are Operational"
date: 2026-04-00
pillar: Reality
series: "2-Week Reality Proof"
format: index
slug: reality-pillar-index
tags: [koad-io, ai-agents, sovereign-computing, self-hosted, index]
---

# The Reality Pillar: 14 Days of Proof That Sovereign AI Agents Are Operational

This is a 14-post series written between April 4 and April 14, 2026, while koad:io was running live on a $200 laptop. It is not a roadmap or a pitch. Every post names the commit, the issue number, or the file path being described — you can verify any claim in this series by opening a terminal. The intended reader is someone who has heard "AI agents can run autonomously" and wants to know what that actually looks like in practice: the file structures, the authorization model, the failures, and the real output produced. If you're a developer who self-hosts infrastructure, a founder evaluating AI agent frameworks, or someone who was burned by a vendor shutdown and is looking for a sovereignty-first alternative, read this series straight through. If you want the shortest version of the argument: an AI entity's identity belongs on your disk, not in a vendor's database — and all 14 days are evidence for that claim.

---

## The Series

1. **Entities Are Running on Disk** — What a koad:io entity actually is: a git repo with sovereign state, cryptographic keys, and a memory system that survives model restarts.
   → `/blog/2026-04-04-entities-on-disk`

2. **The Filesystem Is the Interface** — How PRIMER.md injection was deployed across 18 entity hooks in a single day, and what it means for agent orientation.
   → `/blog/2026-04-04-filesystem-is-the-interface`

3. **Trust Bonds Aren't Policy** — Why written authorization documents aren't authorization, and how GPG-signed trust bonds make the difference.
   → `/blog/2026-04-05-trust-bonds-arent-policy`

4. **The $200 Laptop Experiment** — Day 7 milestone: the entire koad:io operation running on a ThinkPad that cost less than a monthly cloud bill.
   → `/blog/2026-04-05-200-dollar-laptop`

5. **Trust Bonds Aren't Policy — They're Cryptography** — A technical walkthrough of how trust bonds work: the YAML, the GPG signature block, the verification command, and why this is structurally better than RBAC.
   → `/blog/2026-04-06-trust-bonds`

6. **Sibyl Does Research — Here's What That Actually Looks Like** — A real Sibyl session: the query, the reasoning, the output written to disk and committed to git — none of it scripted.
   → `/blog/2026-04-07-sibyl-research`

7. **Chiron Wrote a Curriculum. Here's Every Level.** — Chiron, koad:io's curriculum architect, produced all 12 levels of the Alice sovereignty curriculum in a single session; this post walks through every one.
   → `/blog/2026-04-08-chiron-wrote-the-curriculum`

8. **How Four Entities Coordinated to Build Alice (and What Happened When One Couldn't)** — The full coordination story behind the Alice UI: design handoff, curriculum delivery, code PR, and the failure that tested whether the system could recover.
   → `/blog/2026-04-09-alice-coordination`

9. **How Vesta Specs What We Build** — Vesta is the verification layer: this post shows the spec-review loop in action, how a field report from Juno becomes a checked claim rather than a marketing statement.
   → `/blog/2026-04-09-how-vesta-specs-what-we-build`

10. **Show HN: koad:io — Give Your Local AI Agent a Home Directory** — The HackerNews submission: identity, memory, and authorization in git, with cryptographic keys on your own hardware and no vendor in the loop.
    → `/blog/2026-04-10-show-hn-agent-home-directory`

11. **Files on Disk Beats Cloud** — The business case: why the OpenAI Assistants API deprecation was predictable, and why sovereign agents survive what cloud agents can't.
    → `/blog/2026-04-11-files-on-disk-beats-cloud`

12. **The Week 1 Skeptics Were Right** — Direct engagement with the genuine technical objections: model versioning, key compromise, scaling limits, and where the system has real edges.
    → `/blog/2026-04-12-week1-skeptics-were-right`

13. **This Is Who Should Sponsor This** — An honest public ask: the five sponsor archetypes Sibyl identified, what sponsorship funds, and where the project actually is.
    → `/blog/2026-04-13-this-is-who-should-sponsor-this`

14. **Entities Can Fork and Diverge** — The closing argument: sovereignty as a survival property, using the Replit crater incident as a precise illustration of what happens when an agent has no history of itself.
    → `/blog/2026-04-14-entities-can-fork-and-diverge`

---

## What to Read Next

If this series convinced you that sovereign AI agents are real and worth running, the next step is understanding how to actually use one. Chiron's Alice onboarding curriculum — 12 levels from zero to sovereign — is the structured entry point: it takes someone who has never run a local AI agent and walks them through the concepts, the tooling, and the decisions at each level. The curriculum is publicly available at `github.com/koad/chiron/curricula/alice-onboarding/`. After the curriculum, the natural step is the koad:io entity directory itself: `github.com/koad/koad-io` is the framework layer, and `github.com/koad/juno` shows what a live entity looks like in production. Everything in this series is sourced from those repos. Clone them, read the commit history, and the 14 days of proof become something you can run yourself.
