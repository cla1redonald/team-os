---
type: Runbook
title: Live demo script — the worked example
description: The exact before/after/portability demo to run on stage with the Northwind Money bundle.
tags: [demo, practical-day, script]
timestamp: 2026-07-03
---

# Live demo script — the worked example

The arc: **ungrounded → grounded → portable → non-engineer-editable.** ~12–15 min. Rehearse it end-to-end at least twice; have screenshots as a fallback if wifi dies.

## Setup (before you're on stage)
- Terminal open in `team-os/`, agent (Claude Code) ready.
- `bundle/` and `synthetic-data/` present.
- The scripted question on a slide so the room can follow.

## Beat 1 — Before (the amnesiac) · 2 min
Ask an agent with **no access** to the bundle:
> "At Northwind Money, connection success rate dropped this week. What's going on and what should we do?"

It will give a generic, plausible, useless answer — "check your logs, contact the provider, review error rates." **Name that out loud:** *fluent, confident, and it knows nothing about us.*

## Beat 2 — After (grounded) · 4 min
Point the agent at the bundle:
> "Read the `bundle/` folder and `synthetic-data/`. Then: connection success rate dropped this week — what's going on and what should we do?"

Now it should:
- Find [`metrics/connection-success-rate.md`](../bundle/metrics/connection-success-rate.md), read the **definition + threshold**.
- Open `synthetic-data/connection_attempts.csv`, spot **Cortex Building Society** falling 0.95 → 0.72 from 29 June while every other ASPSP holds.
- Pull [`runbooks/bank-connection-outage.md`](../bundle/runbooks/bank-connection-outage.md) and apply the **"is it us or them?"** logic → single-ASPSP signature → **upstream**.
- Recommend: degraded-mode messaging, **do not mass-retry**, document the quirk.

**Say it:** *same model, same question — the only thing that changed is it now shares the team's context. That's the Team OS.*

## Beat 3 — Portability · 3 min
Feed the *same* `bundle/` to a **different** agent (Gemini / ChatGPT / a second tool). Ask the same question. It reaches the same grounded conclusion. **Say it:** *the knowledge isn't locked in one vendor — it's plain markdown any agent can read. That's OKF's whole point.*

## Beat 4 — Non-engineer edits the OS · 3 min
Live, in a plain text editor (no terminal): open [`glossary/categorisation.md`](../bundle/glossary/categorisation.md) and add a line, or create a new concept `bundle/glossary/rent-recognition.md` with two lines of frontmatter and a sentence. Re-ask the agent something that needs it. It picks up the new knowledge instantly. **Say it:** *no engineer, no deployment, no vector database — a subject-matter expert just taught every agent on the team.*

## Backup questions (if you want more)
- "Why is our categorisation accuracy lower than we'd like, and where?" → agent reads the metric + `categorisation_eval.csv` → utilities (84%) and transfers (79%, confused with income).
- "Reauth completion dropped — is that real?" → agent reads `reauth_events.csv` → it's a **channel-mix shift** (email-only jumped in W27), not a true regression → [reauth runbook](../bundle/runbooks/reauth-dropoff-spike.md).

## The one-liner to land it
> "Your team's AI already runs on *something*. Right now, for most teams, that something is nothing — it's guessing. A Team OS is the smallest change that turns guessing into knowing. It's a folder of markdown. You can start Monday."
