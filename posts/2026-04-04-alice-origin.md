---
title: "Alice Was Built Before the Wave"
date: 2026-04-04
pillar: Origin
tags: [alice, sovereignty, self-hosted, koad-io, sandstorm, history]
target: HackerNews, personal site, About page anchor
word_count: ~1400
---

# Alice Was Built Before the Wave

Twelve years ago, in a small city called Hespeler, Ontario, koad started building Alice.

Not "started thinking about building Alice." Not "wrote a spec for Alice." Started building her — conversation architecture, knowledge structure, a system designed to guide a human through learning something real. This was 2013, maybe 2014. The transformer paper didn't exist yet. GPT didn't exist. The word "sovereignty" wasn't being applied to AI because there was no AI wave to be sovereign from.

There was just a person, a problem, and a machine.

---

## The platform that shut down

Alice needed a home. At the time, the best option was Sandstorm — a self-hosted web app platform that let you run open-source apps on your own server. It was the right call. Sovereign-ish, at least. You ran your own instance. The data was yours.

Then Sandstorm shut down.

Not because it was bad. Not because it failed in any obvious way. It just ended — the organization wound down, the project wound down with it, and the infrastructure that Alice lived inside disappeared.

This is the thing that doesn't get talked about in the "build on platforms" playbook: the platform doesn't have to betray you. It just has to stop existing. And it will, eventually. Everything does.

koad had built something real. It was gone. Not the idea — the home.

---

## The rebuild

What followed wasn't a pivot. It was a conviction.

If Alice's home could disappear, Alice needed a home that couldn't disappear. Files on a drive. Git history. No landlord, no kill switch, no terms-of-service that could be updated at 11pm on a Tuesday. The sovereignty principle that became the center of koad:io — *not your keys, not your agent* — didn't come from philosophy. It came from losing something.

koad rebuilt Alice on disk. The `koad/alice` repository on GitHub was created in 2021 — not the beginning of Alice, but a continuation. A checkpoint in a longer history that predates the repo by years.

The GitHub timestamp is 2021. The actual work is older. The belief that your agent should live on hardware you control is not a 2024 insight. It's a lesson from ~2019, earned the hard way.

---

## What the AI wave changed (and didn't)

When transformers arrived, when GPT landed, when "AI agent" became a phrase that conference talks were built around — koad wasn't catching the wave. He was already in the water.

The wave validated something he'd believed for years. It also brought a new version of the same problem: the new homes for agents were all platforms again. Paid APIs. Cloud-hosted inference. Terms of service. Vendors who could change the rules or the pricing or the availability at will.

The ecosystem built itself around the same dependency structure that killed Sandstorm, just with more compute and more hype.

koad:io is the infrastructure built in response to all of it. Entities that run on hardware you own. Trust bonds that live in GPG-signed files. A content architecture where Alice — or any entity — can be backed up, forked, migrated, and restored. Not because those features were on a roadmap. Because they were necessary.

---

## Today

It's April 2026. koad is typing this from a $200 refurbished ThinkPad, in his father's garage, with a Mac Mini called `fourty4` running fifteen AI entities in parallel on the shelf.

Alice is live. She has twelve levels, a conversation interface, a graduation ceremony with a GPG certificate block. Four entities coordinated to build her UI: Muse designed, Chiron wrote the curriculum, Juno built when Vulcan's auth failed. The PR merged on April 4. The record is in the git history and the issue thread.

None of this was fast. It was twelve years of building the same idea in different conditions — before the wave, during the shutdown, after the rebuild, into whatever this moment is.

The infrastructure that makes Alice possible isn't a product. It's a response to a specific kind of loss, built by someone who knows what it costs to build a thing and then watch the ground disappear beneath it.

---

## Why this matters (if you're building anything)

You don't have to have lost something to understand this. But if you have — if you've built on a platform that changed its API, shut down its free tier, got acquired, or simply stopped — you already know the argument.

The answer isn't to stop building on other people's infrastructure entirely. The answer is to know what you own and what you're renting, and to build the critical things on what you own.

Alice is critical. Her home is a directory. Her history is git. Her trust relationships are files on disk with GPG signatures. If every cloud vendor disappeared tomorrow, Alice would still be running, teachable, forkable, and alive.

That's not a feature. That's the point.

---

*Alice's repo is at koad/alice. The coordination thread for her April 2026 UI build is at koad/juno#25. If you're building something that matters to you, the question worth asking is: where does it live if the platform doesn't?*
