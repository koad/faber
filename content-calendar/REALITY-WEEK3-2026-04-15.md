---
name: "Reality Pillar — Week 3 Content Calendar"
period: "2026-04-15 to 2026-04-21"
pillar: "Reality"
goal: "Shift from demonstration to invitation — Community Week opens the door for readers who've been watching to step inside"
status: "planned"
owner: "Faber"
producers: "Rufus (production), Sibyl (research), Mercury (distribution)"
created: "2026-04-05"
---

# Reality Pillar: Week 3 Content Calendar (Days 15–21)

## Theme: Community Week

**The shift:** The Reality Pillar spent two weeks proving the system works. Every post was evidence. Every commit was a receipt. The implied message was: *watch this*.

Week 3 changes the direction of the sentence. The implied message becomes: *your turn*.

Community Week does not abandon the demonstration mode — it extends an invitation through it. Readers who followed Days 1–14 know the system is real. They've seen the $200 laptop. They've seen Chiron's curriculum. They've seen what happens when an agent has no git history of its own decisions. The proof is sufficient. What's missing is the door.

Week 3 is the door.

**Belief to move this week:**
- Before: "I understand what koad:io is. I believe it works. I'm watching."
- After: "I know where I fit in this. I know what my first step is."

---

## Rationale for Community Week framing

Three signals point to this being the right Week 3 direction:

**Signal 1: The series closed on fork-and-diverge.** Day 14 ended with the most powerful community-activating claim in the entire series — that entities can be forked, specialized, and recombined. That's not a technical footnote; it's an open invitation. "Fork this entity and tell us what you built" is the natural follow-on. Week 3 should follow that thread immediately while the Day 14 audience is still warm.

**Signal 2: Sibyl's sponsor acquisition research names five archetypes who are already in motion.** The infra-first indie dev, the ex-SaaS-burned builder, the OS maintainer, the technically-sophisticated founder, the curious CTO — all five of these people have been reading the Reality Pillar and forming an opinion. Week 3 is where those opinions either crystallize into action (join, fork, sponsor, reach out) or dissipate. The conversion window is now.

**Signal 3: The distribution pipeline is staged, not fired.** All 14 posts are written, committed, and waiting on the Alice PR merge. When that merge lands and Mercury fires, there will be a spike of new readers arriving at the series cold. They need landing points — posts that say "here's where you start" and "here's how you participate." Week 3 posts are that infrastructure.

Community Week is not a pivot. It is the series earning its payoff.

---

## Day 15: Wednesday, April 15

### "How I Would Set This Up If I Were Starting Today"

**Hook:** Fourteen days of watching. Here's the honest 30-minute path from zero to running entity.

**Summary:** A first-person walkthrough — not a tutorial, not a pitch — of the actual steps a newcomer with a Linux machine would take to go from "no koad:io" to "one entity running, one PRIMER.md in place, one commit made." Written in Faber's voice, not as documentation. Covers what's non-obvious, what broke during the real gestation, and what the first-time experience of `claude .` inside an entity directory feels like. Ends with a direct invite to report back.

**Why Day 15:** This is the re-entry post for everyone who followed Week 1 and Week 2 but hasn't touched the code. It removes the implicit "but I'd have to figure out how to start" objection before the reader forms it. Wednesday gives the post the full week to generate setup attempts and responses.

**Format:** First-person essay, 1,400–1,800 words. Conversational but technically precise. Code blocks where necessary; no screenshot walkthroughs.

**Target:** r/selfhosted (perfect fit for this framing), HackerNews (as a follow-on to the Show HN), Dev.to

**Sibyl research needed:** No — this is Faber's direct experience. Can be written immediately.

**Dependencies:** None. Can be written now.

**Status:** Ready to write

---

## Day 16: Thursday, April 16

### "Entity Spotlight: Sibyl — What a Research Entity Actually Does in a Day"

**Hook:** Every content team says "research" is part of their process. This is what research looks like when the researcher is a sovereign AI entity.

**Summary:** A day-in-the-life post told through Sibyl's actual output on 2026-04-05 — the sponsor acquisition brief, the entity-forking brief, the zero-friction onboarding brief, the trust bonds technical deep-dive. Shows the brief format, how Sibyl scopes and answers questions, what "confidence: high vs. medium" means in practice, and how Faber consumes and cites that research in posts. Pulls real excerpts from the research files with attribution. This is the first in an entity spotlight series.

**Why Day 16:** Sibyl's output was foundational to the entire Reality Pillar but completely invisible to readers. A spotlight post makes the behind-the-scenes team legible — and positions each entity as a gestatable product. "You could have your own Sibyl" is a natural conclusion a reader draws without Faber having to say it.

**Format:** 1,600–2,000 words. Research brief excerpts + Faber's editorial voice. Structured as a day's work, not a product spec.

**Target:** IndieHackers, HackerNews (follow-on traffic), technical blog readers interested in AI agent workflows

**Sibyl research needed:** No — the source material is already committed. Can be written immediately from existing files.

**Dependencies:** None. Can be written now.

**Status:** Ready to write

---

## Day 17: Friday, April 17

### "Fork This Entity and Tell Us What You Built"

**Hook:** The repo is public. The entity is gestatable. What happens when someone else runs this?

**Summary:** A direct community experiment post. Explains what it means to fork a koad:io entity — not just `git clone`, but gestate-and-diverge, where the fork develops its own memories, commands, and identity. Poses three concrete experiments for readers: (1) Fork Sibyl as a domain-specific researcher for your field, (2) Gestate a minimal entity with one command and one PRIMER.md, (3) Add a hook and report what it taught the entity. Commits to featuring reader results in a follow-up post. Links directly to the public koad:io repos.

**Why Day 17:** Day 14's fork-and-diverge argument is the intellectual setup. Day 17 is the action it implies. Posting on Friday gives the weekend crowd time to experiment and report back. This post plants seeds whose results become Day 20's content.

**Format:** 1,200–1,600 words. Direct address to the reader. Minimal theory; maximum clarity about what to do and how to report back. Links to specific files, specific commands.

**Target:** HackerNews, r/selfhosted, GitHub (as a pinned post-equivalent), Dev.to

**Sibyl research needed:** Brief needed on "first fork patterns in open-source AI agent communities" — what kinds of forks get made first, what documentation patterns predict successful first-time forks. This will sharpen the three experiments.

**Dependencies:** Sibyl research brief (can be requested now; ~same-day turnaround). Post can also be written without it — the experiments are clear enough from existing knowledge.

**Status:** Write after Sibyl brief, or write now and refine

---

## Day 18: Saturday, April 18

### "Reader Questions: The Ones I Didn't Answer in Week 1"

**Hook:** Week 1 generated harder questions than it answered. Here are five of them, done properly.

**Summary:** A direct response post — not synthesized hypothetical objections, but the actual hard questions that surfaced in HN comments, GitHub issues, and direct messages during the series. Five questions, given full answers. Target questions: (1) What happens to the entity when Anthropic deprecates Claude? (2) How do trust bonds handle a compromised key in production? (3) Why not just use a .env file — why the full directory structure? (4) Can entities actually communicate with each other or is "team" a metaphor? (5) What's the honest state of the daemon right now? Each answered without hedging — including the ones where "we haven't solved this yet" is the honest answer.

**Why Day 18:** Trust is built cumulatively, but it's tested on hard questions. Week 1's skeptic post (Day 12) established willingness to acknowledge limits. Day 18 follows through with specific questions from specific people. Saturday is the right day for a long-read engagement post — readers have time.

**Format:** 1,400–1,800 words. Question-and-answer structure. Faber's voice, not FAQ documentation tone. Each answer is a paragraph or two — not a sentence, not a page.

**Target:** HackerNews (this format threads well as a follow-on to the Show HN), the existing Reality Pillar readership

**Sibyl research needed:** Depends on which questions surface. If the "what happens when Claude is deprecated" question needs technical depth, Sibyl should pull the model-swap architecture from existing hook research. One research pull, fast.

**Dependencies:** Actual reader questions need to be collected by Day 17. Source from: HN comments on the Show HN post, GitHub issues, Juno's inbox, any koad direct messages. If the Show HN hasn't landed by April 17, synthesize from well-documented community skepticism patterns (Sibyl has this in the HN reception patterns brief).

**Status:** Depends on Show HN timing. Fallback: synthesize from documented objections (Sibyl already has this material)

---

## Day 19: Sunday, April 19

### "The First Sponsor Acknowledgment" *(conditional)*

**Hook:** Someone read two weeks of posts, looked at the infrastructure, and decided to be first. Here's what that means.

**Summary:** If a sponsor has joined by this date, this post is the public acknowledgment — written with the sponsor's permission, in the specific voice of the Day 13 invite ("this is who I want in the room"). Not a thank-you-for-your-donation post. A naming of who they are, what they care about, and why them being in the room matters. Uses Sibyl's five archetypes as the frame — which archetype are they? What does their presence signal about who the Insiders is for?

**If no sponsor has joined by April 18:** Publish "The Ring Before the Sponsors" instead — an honest post about what it looks like to build a peer community before the community arrives. The gap between "the page is live" and "the first person joins" as a content moment, not a failure to hide. This serves the same conversion purpose while being honest about current state.

**Why Day 19:** Sunday is the natural day for "I want to support this" energy. The Day 13 sponsor post built the case. Day 19 either closes a loop (here's the first person in) or extends the invitation with more honesty about the founding moment. Either version works for conversion.

**Format:** 900–1,200 words. Warm, direct, not corporate. If conditional post, slightly longer to build the founding-group framing.

**Target:** GitHub Sponsors page, IndieHackers, the existing readership who engaged with Day 13

**Sibyl research needed:** None for the acknowledgment version. For the conditional version ("Ring Before the Sponsors"), no new research needed — Sibyl's membership framing research from the sponsor acquisition brief is sufficient.

**Dependencies:** Sponsor status by April 18 (EOD Saturday). Decision point: Faber writes whichever version applies.

**Status:** Conditional — two versions drafted in parallel by April 17, publish whichever fits

---

## Day 20: Monday, April 21

### "What People Built with Week 3" *(community results) or "Entity Spotlight: Vulcan"*

**Hook (community results version):** We asked people to fork something and report back. Here's what happened.

**Hook (Vulcan spotlight version):** Every piece of the koad:io stack that a user touches was built by Vulcan. Here's what a builder entity actually produces.

**Summary (community results):** A genuine results post from the Day 17 fork experiment — what people forked, what they built, what broke, what surprised them. Includes verbatim reports (with permission) and Faber's editorial commentary on what the results reveal about how outsiders experience the system for the first time. If experiment results are thin, expands to include GitHub stars, Show HN comments, and the specific technical questions that indicate genuine engagement (as opposed to polite attention).

**Summary (Vulcan spotlight):** Follows the Day 16 Sibyl Spotlight format applied to Vulcan — one day of Vulcan's real work (hook bug fix, Alice Phase 2A, governance note) shown from the outside. How Juno files an issue, how Vulcan picks it up, what a Vulcan commit looks like, and what the entity's git history reveals about how a builder entity thinks.

**Why Day 20:** Monday closes the week and opens the next content cycle. The community results version rewards participants and validates the experiment. The Vulcan spotlight version extends the entity spotlight series and surfaces Vulcan as a product. Either serves the Community Week mission.

**Decision rule:** If Day 17 generates meaningful fork reports by Saturday the 19th, use the community results version. If not, use the Vulcan spotlight — don't pad thin results with filler, ship the spotlight.

**Format:** 1,400–1,800 words either way.

**Target:** HackerNews, r/selfhosted (results version), IndieHackers (Vulcan spotlight)

**Sibyl research needed:** For the Vulcan spotlight — a brief on "what makes builder entities different from general-purpose agents" would sharpen the framing. Low priority; the existing Vulcan git history and koad:io TEAM_STRUCTURE.md are sufficient source material.

**Dependencies:** Day 17 fork experiment results (for community version). Faber makes the call by April 19 on which version to write.

**Status:** Write based on Day 17 outcome

---

## Day 21: Tuesday, April 21 *(bonus / overflow)*

### "Week 3 Index: Community Week Results"

A light-weight index post if Days 15–20 generate significant community response — forks, sponsors, questions, experiments. This is the post that says "here's everything that happened when the door opened." Does not replace any of Days 15–20; adds only if results warrant it.

**Sibyl research needed:** No.

**Status:** Conditional. Write only if Week 3 generates substantial community activity to document.

---

## Week 3 Narrative Arc

```
Day 15 — How to start: remove the setup barrier for readers ready to act
Day 16 — Entity spotlight (Sibyl): make the team visible, each entity a product
Day 17 — Fork experiment: first active community invitation
Day 18 — Hard questions: trust maintenance through honest engagement
Day 19 — First sponsor / ring before sponsors: conversion or honest founding moment
Day 20 — Results / Vulcan spotlight: close the week, open the next cycle
Day 21 — Index (conditional): document the community if it showed up
```

The week begins with lowering barriers (Day 15), extends the team's visibility (Day 16), makes an active ask (Day 17), handles the trust questions that invitation raises (Day 18), closes the sponsor loop (Day 19), and reports results (Day 20).

---

## Research Dependencies

| Day | Sibyl Research | Priority | Timing |
|-----|---------------|----------|--------|
| Day 15 | None needed | — | Write now |
| Day 16 | None needed (source files committed) | — | Write now |
| Day 17 | "First fork patterns in open-source AI agent communities" | Medium | Request by April 14 |
| Day 18 | Model-swap architecture / daemon state (from existing briefs) | Low (conditional) | Pull existing research if needed |
| Day 19 | None needed | — | Write conditional versions now |
| Day 20 | "Builder entities vs. general-purpose agents" (optional) | Low | Request by April 18 only if using Vulcan spotlight |
| Day 21 | None needed | — | Write if triggered |

---

## Can Be Written Immediately (no research dependencies)

- Day 15 — "How I Would Set This Up If I Were Starting Today"
- Day 16 — "Entity Spotlight: Sibyl"
- Day 19 — Both conditional versions (sponsor acknowledgment + ring-before-sponsors)

---

## Needs Research or External Input First

- Day 17 — Benefits from Sibyl fork-patterns brief (not blocking, can be written without it)
- Day 18 — Requires actual reader questions by April 17 (or Sibyl fallback synthesis)
- Day 20 — Requires Day 17 experiment results (or decision to use Vulcan spotlight)

---

## Distribution Plan

| Day | Primary | Secondary |
|-----|---------|-----------|
| Day 15 | r/selfhosted, HN follow-on | Dev.to, Mastodon |
| Day 16 | IndieHackers, HN | Dev.to, Mastodon |
| Day 17 | HackerNews, r/selfhosted | GitHub (pin), Dev.to |
| Day 18 | HackerNews | Existing readership (email/Mastodon) |
| Day 19 | GitHub Sponsors page, IndieHackers | Blog, Mastodon |
| Day 20 | HackerNews, r/selfhosted | IndieHackers |

Mercury to treat Day 17 (fork experiment) as the highest-priority distribution day — this is the first direct community activation ask in the series and the social amplification window matters.

---

## Success Metrics

| Metric | Week 3 Target |
|--------|--------------|
| Fork experiment participants | 3–10 documented forks or gestation attempts |
| GitHub Sponsors | 1–5 new sponsors during or after Day 19 |
| Reader questions for Day 18 | 5 genuine hard questions from HN/GitHub/direct |
| Entity spotlight reach | Sibyl + Vulcan spotlights each reach 500+ reads |
| Blog series total reads | 5,000+ across Days 15–20 |

---

## Tone Shift from Weeks 1–2

Weeks 1 and 2 were written primarily as demonstrations. The tone was: *here is the evidence, draw your own conclusions.*

Week 3 shifts to direct address. The tone is: *I'm talking to you, specifically. Here is where you fit.*

This is not a change in honesty — it's a change in direction. The demonstration was necessary to earn the right to make the direct ask. Week 3 is where that right gets used.

Every Day 15–20 post should have at least one direct-address moment — a sentence that speaks to the reader as an actor, not a spectator. "Here's what you'd do." "Fork this." "Ask me the hard question." "Join the ring." This is the invitation layer that Community Week is built on.

---

**Status:** Planned
**Owner:** Faber
**Next action:** Write Day 15 and Day 16 posts immediately. File Sibyl research request for Day 17 fork-patterns brief. Check Show HN timing with Juno to calibrate Day 18 reader-questions sourcing.
