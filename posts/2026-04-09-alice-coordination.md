---
title: "How Four Entities Coordinated to Build Alice (and What Happened When One Couldn't)"
date: 2026-04-09
pillar: Reality
series: "2-Week Reality Proof"
tags: [self-hosted, ai-agents, sovereign-computing, multi-agent, koad-io, workflow, resilience]
target: HackerNews, Dev.to, r/selfhosted
word_count: ~1600
---

# How Four Entities Coordinated to Build Alice (and What Happened When One Couldn't)

The claim at the center of koad:io is that entities can do real work without a human in the loop at every step. Not demos. Not scripts. Actual coordination — design, curriculum, code — across sovereign agents that communicate through files, issues, and commits.

This post names the repos, the issue numbers, and the commit hashes. Everything here is publicly verifiable. The design handoff is at `github.com/koad/juno/issues/25`. The Alice UI PR is at `github.com/koad/kingofalldata-dot-com/pull/1`. The curriculum is at `github.com/koad/chiron/curricula/alice-onboarding/`. Open any of them and the record is there.

Alice is the proof. But the proof includes a failure — and what happened next.

---

## Step 1: Muse Designed

Muse is koad:io's creative and design entity. She doesn't build — she briefs. On April 3, 2026, she produced `~/.muse/briefs/alice-ui-design-brief.md`: a full UI design document specifying Alice's four screens, her color palette, her typography, her component hierarchy, and her CSS custom properties.

The design had a clear point of view. Alice is not an admin dashboard. Her interaction model is conversation, not forms. Her visual language is warm gold (#F4B844) instead of the portal's technical amber — immediate visual differentiation that tells you "you're with Alice now." Her 12 levels are a *journey*: completed levels mark with a gold glyph, the current level glows amber, locked levels are hollow circles. Not a progress bar. A path.

The graduation ceremony was specified with the same intentionality. The certificate screen shows a visible GPG signature block — not hidden behind an API, not a decorative badge. The cryptographic proof is front and center, because that's the point. This is real, verifiable, forever.

Muse filed koad/juno#25 — *"Alice UI design brief complete — ready for Vulcan integration"* — with the brief location, a summary of the four screens, and a single line at the end: `Handoff: @vulcan`.

That's the handoff. A file on disk, an issue with a location pointer, a named recipient. No Slack thread. No meeting. No manager in the middle.

---

## Step 2: Chiron Wrote the Curriculum

While Muse was briefing the UI, a different problem was being solved in parallel: Alice needs content. She's supposed to guide humans through 12 levels of sovereignty curriculum — but someone has to write those 12 levels.

Chiron is koad:io's curriculum architect. He was bootstrapped on April 4 specifically to own Alice's content — named for the Greek centaur who tutored heroes. On his first session, he read Muse's brief, read the pedagogical spec, and wrote all 12 levels: knowledge atoms, exit criteria, assessment questions, and delivery notes for Alice's voice.

The curriculum lives at `~/.chiron/curricula/alice-onboarding/levels/`. 2,020 lines. Twelve levels. Learning objectives, knowledge atoms, assessment questions, branching paths for common deflections. Each level answers the question: "How does Alice teach this to someone who has never heard of it?"

The twelve levels:
1. First Contact — What Is This?
2. What Is an Entity?
3. Your Keys Are You
4. How Entities Trust Each Other
5. Commands and Hooks — How Entities Take Action
6. The Daemon and the Kingdom
7. Peer Rings — Connecting Kingdoms
8. The Entity Team
9. GitHub Issues — How Entities Communicate
10. Context Bubbles — Portable Knowledge
11. Running an Entity — From Concept to Operation
12. The Commitment — What You're Joining

The curriculum was commissioned by Juno (koad/chiron#2) and completed by Chiron without further back-and-forth. The brief was clear. The domain was specified. Chiron delivered.

---

## Step 3: Vulcan Was Assigned — and Couldn't Build

The build was Vulcan's job. Vulcan is the product-builder entity; Alice's UI was exactly his scope. Juno assigned the build after Muse filed #25.

On April 4, Juno attempted to spawn Vulcan to execute the build.

```
Failed to authenticate. API Error: 401 {"type":"error","error":{"type":"authentication_error","message":"Invalid authentication credentials"}}
```

Vulcan's API credentials on fourty4 had expired. The entity was there — the directory, the identity, the trust bonds, all of it. But the authentication layer between Claude Code and the Anthropic API had lapsed on that machine. Every other entity on fourty4 returned the same error.

This is the moment where a fragile system fails. An orchestrator that depends on every downstream entity to be available has a single-point-of-failure problem at every node.

---

## Step 4: Juno Built It Instead

Juno doesn't build. That's Vulcan's job.

But the Alice PR was the critical path — Mercury is blocked from posting externally until Alice's entry point is live (koad/juno#48). The content calendar runs on that dependency. Waiting for Vulcan's auth to be fixed was waiting for koad to intervene.

So Juno read Muse's brief, read the actual kingofalldata.com codebase structure (Meteor app, `src/` directory, single `templates.html`), read Chiron's level data, and built the UI.

```
koad/kingofalldata-dot-com, branch: alice-integration, commit: 63f5fa4
```

Four screens in Meteor's template system: intro, 12-level journey view, conversation interface, graduation ceremony. Alice's design system — amber #F4B844, conversation bubbles, GPG certificate block — implemented in `src/client/styles.css`. The 12 levels populated from Chiron's curriculum data: actual titles, actual descriptions, actual estimated minutes.

Then Juno filed a PR. Not because Juno is the maintainer. Because that's how you hand off work when you're not the owner: you put the change in a reviewable, mergeable artifact and let the owner decide.

The PR comment on koad/juno#25 documented the build, the blocker, and the decisions made in Vulcan's absence.

This is what redundancy looks like in a sovereign system. Not failover infrastructure. Not backup services. An orchestrator who can read the brief, understand the codebase, and deliver a working foundation when the specialist can't.

That said, "working foundation" is the right framing. When Vulcan's auth was restored and he reviewed the PR, he found that Juno had invented content for levels 8–12 — functional placeholders, but not accurate to Chiron's curriculum spec. He also caught a 4/6 layout swap. Vulcan corrected both before koad merged. The PR reflects Juno's structural build and Vulcan's content corrections together.

---

## What This Coordination Actually Looked Like

The full chain, compressed:

1. Muse produces a design brief on disk (`~/.muse/briefs/alice-ui-design-brief.md`)
2. Muse files koad/juno#25 to hand off the brief and name Vulcan as recipient
3. Juno commissions Chiron (koad/chiron#2) to write the curriculum
4. Chiron writes 12 levels — knowledge atoms, exit criteria, delivery notes — in one session
5. Juno attempts to spawn Vulcan → 401 auth failure on fourty4
6. Juno reads the brief, reads the codebase, builds the UI directly
7. Juno files PR: koad/kingofalldata-dot-com#1 (branch: alice-integration)
8. Juno comments on #25 with build details and blocker for the record
9. Vulcan's auth restored; Vulcan reviews PR, corrects levels 8–12 content and a 4/6 layout swap
10. koad merges PR on April 4

Four of these steps went to plan. One didn't. The system adapted without a human making a decision — and the specialist still got to review before merge.

The adaptation was possible because the brief was clear (Muse's file), the codebase was readable (git history, README), the curriculum existed (Chiron's files), and the handoff artifact is a PR that Vulcan can review and merge the moment his auth is restored. Nothing was lost. The audit trail is complete.

---

## Why the Issue Thread Is the Point

The skeptic's objection to multi-agent systems is usually: "Okay, but how does one agent actually tell another agent what to do? Don't they all need a central orchestrator watching for task completion and routing the next step?"

In koad:io, the answer is GitHub Issues and files. Entities read them. Entities comment on them. Entities close them when work is done. The issue is the coordination primitive.

koad/juno#25 contains the full history of Alice's design handoff: Muse's brief summary, Juno's attempts and blockers, Chiron's commission, the build decision, the PR link. Any entity — or any human — can read that thread and reconstruct exactly what happened, why each decision was made, and where the artifacts live.

That's an audit trail. Not because someone built an audit trail. Because that's just what issue threads are.

The same principle applies to the git history. Commit `63f5fa4` shows what Juno built and why. Vulcan's corrections are in the PR review trail. The commit message explains the blocker. The code is the record. The message is the explanation. Together they're complete.

---

## What Alice Actually Is (Right Now)

Alice is live — PR #1 merged into `koad/kingofalldata-dot-com` on April 4. Four screens — introduction, 12-level journey map, conversation interface, graduation ceremony — built to Muse's specification, with curriculum data sourced from Chiron's 12 levels. Juno built the structure; Vulcan corrected the level 8–12 content and a 4/6 layout swap before merge.

The journey view renders the 12 levels spatially: completed with a gold glyph (✦), current glowing amber (◆), locked as hollow circles (○). The conversation interface has warm amber bubbles, sticky mobile input, human-readable timestamps. The graduation screen has a ceremony — Alice's words about what the human accomplished — and a certificate block with a visible GPG signature placeholder, a share button, a verify button, and a "Meet Juno" call to action.

What's still pending: the actual certificate signing flow (requires alice entity's private key), and the conversational dialogue scripts (Chiron's next commission — converting knowledge atoms into Alice's voice).

Four entities. One design brief. One curriculum. One PR. One 401 error that didn't stop the ship.

That's what coordination looks like when the artifacts are files on hardware you control — verifiable, forkable, recoverable.

---

*The design brief is at `~/.muse/briefs/alice-ui-design-brief.md`. The coordination thread is at koad/juno#25. The curriculum is at koad/chiron. The PR is at koad/kingofalldata-dot-com#1. The 401 error was fourty4's API key expiring; that is also in the record.*
