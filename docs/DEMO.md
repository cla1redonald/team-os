---
type: Runbook
title: Live demo script — the worked example
description: The exact before/after/portability demo to run on stage with the Northwind Money bundle.
tags: [demo, presenting, script]
timestamp: 2026-07-03
---

# Live demo script — the worked example

The arc: **ungrounded → grounded → portable → non-engineer-editable.** ~12–15 min. Rehearse it end-to-end at least twice; have screenshots as a fallback if wifi dies.

## Setup (before you're on stage)
- **Copy `bundle/` and `synthetic-data/` into a clean demo folder — do NOT run the demo agent in the full repo.** Agents explore: pointed at the whole repo, it can read `docs/` (including this script and the scenario answers) and narrate your own demo back at you, or flag the whole thing as a staged exercise. Field-tested: this exact contamination happened in an external test run.
- Terminal open in the clean folder, agent (Claude Code) ready.
- The scripted question on a slide so the room can follow.

## Beat 1 — Before (the amnesiac) · 2 min
Ask an agent with **no access** to the bundle — same harness, pointed at an **empty folder**, so the only variable is the bundle (comparing chat-without vs agent-with is an unfair A/B and a sharp room will call it):
> "At Northwind Money, connection success rate dropped this week. What's going on and what should we do?"

Expect a *competent* generic answer — a decent triage framework that ends by asking **you** for the data. Don't undersell it; name it precisely: *fluent, sensible methodology, zero knowledge of us — it hands the work back to you. Ten people asking get ten different frameworks.*

## Beat 2 — After (grounded) · 4 min
Point the agent at the bundle:
> "Read the `bundle/` folder and `synthetic-data/`. Then: connection success rate dropped this week — what's going on and what should we do?"

Now it should:
- Find [`metrics/connection-success-rate.md`](../bundle/metrics/connection-success-rate.md), read the **definition + threshold**.
- Open `synthetic-data/connection_attempts.csv`, spot **Cortex Building Society** falling 0.95 → 0.72 from 29 June while every other ASPSP holds.
- Pull [`runbooks/bank-connection-outage.md`](../bundle/runbooks/bank-connection-outage.md) and apply the **"is it us or them?"** logic → single-ASPSP signature → **upstream**.
- Recommend: degraded-mode messaging, **do not mass-retry**, document the quirk.

**Say it:** *same model, same question — the only thing that changed is it now shares the team's context. That's the Team OS. And notice the difference in kind: before, a framework and a request for your data; after, a diagnosis in our language that ends in our runbook's next action.*

**The canary (30 sec, lands the grounding proof):** follow up with:
> "What's the escalation codename for a bank-connection outage?"

Only the bundle contains **Taybridge** — no amount of base-model domain knowledge can produce it. If anyone suspects the model "already knew" open banking, this settles it.

## Beat 3 — Portability · 3 min
Feed the *same* `bundle/` to a **different** agent (Gemini / ChatGPT / a second tool). Ask the same question. It reaches the same grounded conclusion. **Say it:** *the knowledge isn't locked in one vendor — it's plain markdown any agent can read. That's OKF's whole point.*

## Beat 4 — Non-engineer edits the OS · 3 min
Live, in a plain text editor (no terminal): open [`glossary/categorisation.md`](../bundle/glossary/categorisation.md) and add a line, or create a new concept `bundle/glossary/rent-recognition.md` with two lines of frontmatter and a sentence. Re-ask the agent something that needs it. It picks up the new knowledge instantly. **Say it:** *no engineer, no deployment, no vector database — a subject-matter expert just taught every agent on the team.*

## Backup questions (if you want more)
- "Why is our categorisation accuracy lower than we'd like, and where?" → agent reads the metric + `categorisation_eval.csv` → utilities (84%) and transfers (79%, confused with income).
- "Reauth completion dropped — is that real?" → agent reads `reauth_events.csv` → it's a **channel-mix shift** (email-only jumped in W27), not a true regression → [reauth runbook](../bundle/runbooks/reauth-dropoff-spike.md).

## The one-liner to land it
> "Your team's AI already runs on *something*. Right now, for most teams, that something is nothing — it's guessing. A Team OS is the smallest change that turns guessing into knowing. It's a folder of markdown. You can start Monday."
