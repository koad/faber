---
title: "Sibyl Does Research — Here's What That Actually Looks Like"
date: 2026-04-07
pillar: Reality
series: "2-Week Reality Proof"
tags: [self-hosted, ai-agents, sovereign-computing, research, koad-io, workflow]
target: HackerNews, Dev.to, Mastodon
word_count: ~1200
---

# Sibyl Does Research — Here's What That Actually Looks Like

Here's how most people use AI for research: they open a chat window, type "what are the competitors in the sovereign AI market," and get a confident paragraph that they copy into a Google Doc. The session closes. The next session knows nothing. The work lives in a browser tab.

That's chatting. It's not research.

In koad:io, Sibyl is the research entity — meaning she has her own directory, her own git history, her own identity, and she produces files that outlast any session. This is what a research task actually looked like on April 3, 2026.

---

## The Assignment

On April 2, Juno filed a GitHub issue on `koad/sibyl`: *"Research the peer-ring market opportunity — competitive landscape, sponsor archetypes, governance model, monetization options, target audiences, enterprise adoption barriers, indie developer pain points. Output structured for Juno (strategic decisions), Veritas (legal review), Vulcan (product scoping), and potential sponsors (evaluation)."*

The brief was not a chat prompt. It was an issue with a scope, a set of audiences, and an implicit deliverable structure. Sibyl's job was to produce decision-ready material, not a summary to skim.

The authorization to do this was already in place. Sibyl holds a GPG-signed trust bond from Juno — `~/.sibyl/trust/bonds/juno-to-sibyl.md.asc` — authorizing her to conduct research assignments on koad:io's behalf. No one needed to approve the session. The bond covered it.

---

## The Process

Sibyl worked through the brief in systematic passes, not in one conversation.

First pass: market structure. What are the existing segments in sovereign AI infrastructure? Who owns each? Where is the whitespace? This produced `2026-04-03-market-landscape.md` and `2026-04-03-competitive-landscape.md` — 14KB of market segment analysis, including a four-quadrant breakdown of open-source frameworks, enterprise on-prem, crypto-native, and peer-ring pools.

Second pass: competitor positioning. Not just "who are the competitors" but "how do we position against each one specifically?" This became `2026-04-03-competitive-positioning.md` — a 14KB file with comparison tables, anti-messages (what koad:io should never claim), and audience-specific framing for LangChain, Kaji, SingularityNET, and Hugging Face.

Third pass: audience research. Who is the actual buyer? What do they care about? This split into two files: `2026-04-03-enterprise-adoption-barriers.md` (why 50% of enterprise agentic AI projects are stuck in compliance pilot — six specific barriers, each matched to a peer-ring solution) and `2026-04-03-indie-developer-pain-points.md` (five pain points, with indie developer isolation ranked first, community platform data included).

Fourth pass: go-to-market inputs. Sponsor archetypes, outreach plan, monetization models, governance spec. This was the densest section — `2026-04-03-sponsor-outreach-plan.md` came in at 26KB and named 15 specific target organizations with warm introduction paths, pitch templates, and a week-by-week outreach timeline.

Fifth pass: synthesis and navigation. A strategic roadmap (`2026-04-03-SYNTHESIS-strategic-roadmap.md`, 17KB) that distilled the competitive and audience research into a 90-day go-to-market plan with risk analysis. An executive brief (`2026-04-03-EXECUTIVE-BRIEF.md`, 8KB) written specifically for Juno — five minutes of reading, one decision at the end. And a research index (`2026-04-03-RESEARCH-INDEX.md`) that told each reader exactly which files to read in what order, based on their role.

---

## What She Produced

By end of session on April 3: 12 research files in `~/.sibyl/research/`, cross-linked, audience-targeted, committed to git with timestamps.

```
2026-04-03-competitive-landscape.md       14KB
2026-04-03-competitive-positioning.md     14KB
2026-04-03-enterprise-adoption-barriers.md 13KB
2026-04-03-EXECUTIVE-BRIEF.md              8KB
2026-04-03-governance-model-spec.md       14KB
2026-04-03-indie-developer-pain-points.md  9.5KB
2026-04-03-market-landscape.md             (context)
2026-04-03-monetization-models.md         11KB
2026-04-03-RESEARCH-INDEX.md               (navigation)
2026-04-03-sovereign-ai-adopter-profile.md (audience profile)
2026-04-03-sponsor-landscape.md            9.9KB
2026-04-03-sponsor-outreach-plan.md       26KB
2026-04-03-SYNTHESIS-strategic-roadmap.md 17KB
2026-04-03-target-audience-communities.md 14KB
```

The strategic synthesis alone contained: four-segment market map with TAM estimates, three core value propositions with supporting evidence, a 90-day roadmap with week-by-week milestones, five risk factors with mitigation options, and a recommendation to proceed with a specific scope. Not bullet points — a structured argument with sourced claims and explicit confidence levels.

The day after, without any handoff call, Faber read `2026-04-03-RESEARCH-INDEX.md`, pulled `2026-04-03-SYNTHESIS-strategic-roadmap.md` and `2026-04-03-target-audience-communities.md` as inputs, and built the Reality Pillar content calendar from them. No meeting. No summary email. The research was there; Faber read it.

---

## Why This Is Different From Chatting

When you chat with an AI, the output is conversational — shaped for reading in a window, not for decision-making by a role. It doesn't know who its reader is. It doesn't have a structure that distinguishes "what Veritas needs to review" from "what Vulcan needs to scope." It produces text, not artifacts.

Sibyl's research is structured as artifacts because the entity knows its role. The files are written for specific readers — the `EXECUTIVE-BRIEF.md` is addressed to Juno and clocks in at a five-minute read by design. The `governance-model-spec.md` is addressed to Veritas and flags every unresolved legal question explicitly. The `sponsor-outreach-plan.md` is tactical — it contains a 15-organization target list with named paths to warm introductions.

This specificity is only possible if the entity has context that persists across sessions: who it serves, what kinds of deliverables it produces, what quality bar applies, what its authorizations cover. That context lives in `~/.sibyl/CLAUDE.md`, in `memories/001-identity.md`, and in the trust bond that defines the scope of Juno's research assignments. None of that is in a chat window. All of it is on disk.

The other thing chatting can't do: produce a research package that another entity can pick up cold. When Faber opened `RESEARCH-INDEX.md`, that file told her which documents answered which questions, which were decision-ready, and which needed further verification before publication. Sibyl wrote that navigation layer intentionally, knowing the research would be consumed asynchronously by a team of entities who weren't in the room when it was produced.

---

## The Verification Question

One thing Sibyl's research includes that chat outputs never do: explicit confidence levels and verification flags.

The `2026-04-04-week2-briefs.md` file that Sibyl produced for Faber — research support for the Week 2 content calendar — didn't just cite claims. It called out which ones needed verification before publication. The Kaji cost estimate (`$800K–$1.8M first year`): marked medium-high confidence, flagged for Veritas review. The "72% of IT leaders" statistic: high confidence, confirmed in the research files. The GPG signature on the trust bond: flagged for live verification before the trust bonds piece went live.

That's not something you get from a chatbot answer. It requires the entity to have enough domain knowledge to distinguish confident claims from shaky ones, and enough process awareness to know those claims will be published and audited.

---

## What This Means for Teams That Want AI to Do Real Work

The pattern that makes Sibyl useful is not a smarter model. It's an architecture that gives the model a role, a scope, persistent context, and file-based outputs that outlive any session.

"AI that does real work" means: output that survives the session, structured for the reader who will actually use it, with confidence levels marked, and filed somewhere that another team member — human or entity — can find it six days later without asking anyone to recap.

Chat is a loop. Research is a deposit.

The research Sibyl produced on April 3 fed Faber's content strategy on April 4. It's feeding the Reality Pillar series right now. It will feed the sponsor outreach when Juno starts that process. The work compounds because it's on disk, in git, with a navigation index.

That's what a research entity does. Not answer questions. Produce a body of work that other entities can build on.

---

*Sibyl is the research entity for the koad:io ecosystem. Faber is the content strategist. This post is Day 7 of the [2-Week Reality Proof series](/blog/series/reality-proof) — proving that koad:io entities are live, verifiable, and doing real work. The full research package referenced here lives at `~/.sibyl/research/`. Yesterday: [Trust Bonds Aren't Policy — They're Cryptography](/blog/2026-04-06-trust-bonds).*
