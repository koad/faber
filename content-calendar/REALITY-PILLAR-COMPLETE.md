---
name: "Reality Pillar — Series Complete"
status: complete
posts: 14
period: "2026-04-04 to 2026-04-14"
total_words: 27586
owner: Faber
completed: 2026-04-14
---

# Reality Pillar: Series Complete

## Series Overview

| Field | Value |
|-------|-------|
| Series name | 2-Week Reality Proof |
| Pillar | Reality |
| Posts | 14 |
| Publication period | April 4–14, 2026 |
| Total word count | ~27,600 words |
| Average post length | ~1,970 words |
| Author | Faber (content strategy) |
| Production support | Rufus, Sibyl, Chiron, Vesta |

---

## Full Post Inventory

| # | File | Title | Date | Words | Day |
|---|------|-------|------|-------|-----|
| 1 | `2026-04-04-entities-on-disk.md` | Entities Are Running on Disk | Apr 4 | 2,469 | 1 |
| 2 | `2026-04-04-filesystem-is-the-interface.md` | The Filesystem Is the Interface | Apr 4 | 1,807 | 2 |
| 3 | `2026-04-05-trust-bonds-arent-policy.md` | Trust Bonds Aren't Policy | Apr 5 | 2,013 | 6 |
| 4 | `2026-04-05-200-dollar-laptop.md` | The $200 Laptop Experiment | Apr 5 | 1,529 | 7 |
| 5 | `2026-04-06-trust-bonds.md` | Trust Bonds Aren't Policy—They're Cryptography | Apr 6 | 1,730 | 3 |
| 6 | `2026-04-07-sibyl-research.md` | Sibyl Does Research — Here's What That Actually Looks Like | Apr 7 | 1,328 | 4 |
| 7 | `2026-04-08-chiron-wrote-the-curriculum.md` | Chiron Wrote a Curriculum. Here's Every Level. | Apr 8 | 2,936 | 8 |
| 8 | `2026-04-09-alice-coordination.md` | How Four Entities Coordinated to Build Alice | Apr 9 | 1,662 | 5 |
| 9 | `2026-04-09-how-vesta-specs-what-we-build.md` | How Vesta Specs What We Build | Apr 9 | 2,536 | 9 |
| 10 | `2026-04-10-show-hn-agent-home-directory.md` | Show HN: koad:io — Give Your Local AI Agent a Home Directory | Apr 10 | 1,055 | 10 |
| 11 | `2026-04-11-files-on-disk-beats-cloud.md` | Files on Disk Beats Cloud | Apr 11 | 2,505 | 11 |
| 12 | `2026-04-12-week1-skeptics-were-right.md` | The Week 1 Skeptics Were Right | Apr 12 | 2,056 | 12 |
| 13 | `2026-04-13-this-is-who-should-sponsor-this.md` | This Is Who Should Sponsor This | Apr 13 | 1,740 | 13 |
| 14 | `2026-04-14-entities-can-fork-and-diverge.md` | Entities Can Fork and Diverge | Apr 14 | 2,220 | 14 |

**Total: 27,586 words across 14 posts**

---

## Topics Covered

**Week 1 (Days 1–7): Foundation**

- Entity architecture: git repos as sovereign agents, directory structure, memory systems
- PRIMER.md injection: filesystem-first orientation for agents
- Trust bonds: GPG-signed authorization vs. written policy
- Live operations: real work visible in commits, not demos
- The $200 laptop baseline: sovereignty doesn't require expensive hardware

**Week 2 (Days 8–14): Depth and Conversion**

- Curriculum architecture: Chiron's 12-level Alice onboarding curriculum in detail
- Multi-entity coordination: design → curriculum → code → verification loop, including a real failure and recovery
- Specification and verification: Vesta's review loop as the credibility layer
- HackerNews distribution: the Show HN post targeting the technical decision-maker audience
- The business case: vendor deprecation history, sovereign survival argument
- Skeptic engagement: naming real limits rather than claiming perfect coverage
- Sponsor conversion: public, honest ask with named archetypes
- Closing argument: fork-and-diverge as the survival property that distinguishes sovereign from cloud agents

---

## Distribution Status

| Post | Blog | HackerNews | Dev.to | r/selfhosted | Mastodon | Status |
|------|------|-----------|--------|--------------|----------|--------|
| Entities on Disk | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |
| Filesystem Is Interface | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |
| Trust Bonds Aren't Policy | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |
| $200 Laptop | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |
| Trust Bonds — Cryptography | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |
| Sibyl Does Research | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |
| Chiron's Curriculum | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |
| Alice Coordination | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |
| Vesta Specs | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |
| Show HN | needs blog PR + live links | ready after merge | ready | ready | ready | **blocked: Alice PR** |
| Files on Disk Beats Cloud | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |
| Week 1 Skeptics | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |
| This Is Who Should Sponsor | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |
| Entities Can Fork | needs blog PR | ready | ready | ready | ready | **blocked: Alice PR** |

**Primary blocker:** `koad/kingofalldata-dot-com#1` — the blog infrastructure PR. Once merged, all 14 posts can publish in sequence. Mercury is staged and waiting.

**Mercury credential status:** Blocked on koad providing platform credentials (issue #11). Social amplification ready to run the moment credentials arrive.

---

## What the Series Proved

### The $200 Laptop Experiment: Result

The full koad:io team operation — 9+ entities, 3-node infrastructure (thinker, flowbie, fourty4), live GitHub coordination, trust bond signing, content production — ran continuously from a ThinkPad that cost less than one month of comparable cloud hosting. The experiment ran from gestation (2026-03-30) through Day 14 (2026-04-14). Every claim in the series is backed by a public git commit or GitHub issue. The laptop is still running.

**What this disproves:** "You need enterprise infrastructure to run sovereign AI agents."
**What this proves:** Sovereignty is a software property, not a hardware requirement.

### Team Output Inventory: Days 1–14

What the entity team produced during the 14-day window this series covers:

| Entity | Output |
|--------|--------|
| Faber | 14 Reality Pillar posts (~27,600 words), content calendar, distribution strategy |
| Sibyl | Sponsor archetype research, competitive analysis, ICM synthesis paper |
| Chiron | Full 12-level Alice sovereignty curriculum (bootstrapped April 4) |
| Vulcan | Alice Phase 2A UI (koad/kingofalldata-dot-com PR #1), hook bug fix (FORCE_LOCAL=1), governance note |
| Vesta | Hook architecture review, PRIMER.md injection spec, pre-invocation context assembly spec |
| Juno | Cross-entity coordination, governance escalation resolution (#52, #53), Aegis Day 5 answers |
| Mercury | Distribution pipeline staged, social copy ready for all 14 posts |

This output was produced by a single human operator (koad) working part-time with no specialized hardware beyond the $200 laptop.

---

## What Comes Next for the Content Pipeline

### Immediate (blocked on Alice PR merge)

1. **Publish the series.** All 14 posts are written, committed, and ready. The blog PR (`koad/kingofalldata-dot-com#1`) is the only gate. Once merged: publish Day 1 through Day 14 in sequence over the following two weeks, or publish all at once with the index post as the entry point.

2. **Show HN submission.** Day 10 post needs final link polish (live repo link, live kingofalldata.com URL) before submitting. Target: Tuesday 8–10am ET for best HN timing. Mercury to coordinate social amplification same day.

3. **Mercury distribution run.** All 14 posts have platform targets mapped. Mercury needs platform credentials (#11) to execute. This is the first full Mercury distribution run — it is also the proof of concept for Mercury as an entity.

### Near-term (next content sprint)

4. **PRIMER.md post.** The pre-invocation context assembly post (`2026-04-05-pre-invocation-context-assembly.md`) is complete and in a separate series ("Naming What We Built"). It should publish alongside or shortly after the Reality Pillar to capture the technical audience who wants architecture depth.

5. **Chiron curriculum post as standalone.** Day 8's Chiron curriculum walkthrough can be distributed to the Alice audience independently — it is the "what Alice teaches" companion to the "how Alice works" story.

6. **Week 3 framing.** The Reality Pillar closes with an invitation to fork and sponsor. The natural follow-on is a "Community Week" pillar: first forks, first sponsors, first external entity gestations. Sibyl should research timing and audience targeting for this sprint.

7. **Series index distribution.** The index post (`2026-04-00-reality-pillar-index.md`) is the share-ready entry point for the full series. Mercury should treat this as the primary asset for anyone asking "what is koad:io" — it links the full 14-day proof in one place.

### Structural notes for future series

- **Day numbering discipline.** Some posts in this series have inconsistent day numbers in their frontmatter (Days 3–5 were retrospectively assigned; Days 1–2 don't have day fields). Future series should number consistently from the start.
- **Series tag uniformity.** The Show HN post was missing the `series:` frontmatter field. All posts in a series should carry the tag — it enables programmatic index generation.
- **Word count targets.** The series averaged ~1,970 words per post. The sweet spot for HackerNews is 1,400–2,200 words. Posts over 2,500 words (Chiron, Vesta, Files on Disk) should consider whether they need to be trimmed for distribution or kept long as reference pieces.

---

**Status:** Complete. All 14 posts committed to `~/.faber/posts/`. Distribution pending blog PR merge and Mercury credentials.

**Owner:** Faber
**Last updated:** 2026-04-05
