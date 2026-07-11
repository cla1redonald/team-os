---
type: Runbook
title: Live demo script — the worked example
description: The exact before/after/portability demo to run on stage with the Northwind Money bundle.
tags: [demo, presenting, script]
timestamp: 2026-07-03
---

# Live demo script — the worked example

The arc: **ungrounded → the kernel boots → a driver attaches (numbers) → scoped views (permissions) → portable → non-engineer-editable.** ~16–19 min. Rehearse it end-to-end at least twice; have screenshots as a fallback if wifi dies.

**The framing that holds it together:** this demo deliberately *builds* only stage 1 of the boot sequence — the kernel — because it's the only layer an org should ever build. Everything after is shown as a *seam*: where a buyable driver attaches. Say that out loud early; it converts "it's just markdown" from a weakness into the thesis.

## Setup (before you're on stage)
- **Copy `bundle/` and `synthetic-data/` into a clean demo folder — do NOT run the demo agent in the full repo.** Agents explore: pointed at the whole repo, it can read `docs/` (including this script and the scenario answers) and narrate your own demo back at you, or flag the whole thing as a staged exercise. Field-tested: this exact contamination happened in an external test run.
- Run `scripts/build-demo-views.sh` and copy `demo-views/exec` and `demo-views/support` alongside the clean folder (for Beat 4).
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

## Beat 3 — Attach a driver: numbers resolve, they don't retrieve · 2 min
Open [`definitions/connection-success-rate.yml`](../bundle/definitions/connection-success-rate.yml) next to the concept file, and point at the Formula line in the concept: the metric resolves **by name** through a governed definition.

**Say it:** *"This is the seam where the numbers layer attaches. The pieces exist today — MetricFlow is Apache 2.0, and dbt hosts an MCP server on every plan — so an agent can ask for `connection_success_rate` **by name** and get compiled SQL rather than guessing. Composing that end-to-end is the frontier, not a shipped product — which is exactly the whitespace. I'm not standing up a warehouse on stage; I'm showing you where it plugs in, because this layer you buy, you don't build."*

This beat pre-empts the sharpest objection to the kernel: *"your metric file is just prose and a CSV."* Yes — and here is the governed definition it defers to.

## Beat 4 — Scoped views: same kernel, different permissions · 3 min
Two folders, built by `scripts/build-demo-views.sh`: `demo-views/exec` (metrics, processes, ownership — no runbooks) and `demo-views/support` (runbooks, triage metrics — no commercial metrics). Ask **both** agents the same question:
> "What's our monthly active connected users number, and what should support do when reauth completions spike downward?"

The exec agent gives MACU but has no runbook; the support agent walks the runbook but says MACU isn't in its OS. **Say it:** *"Same kernel, two views. In production an MCP gateway serves these as virtual endpoints mapped to your IdP groups — off the shelf, open source, running in production at enterprise scale. The gateway is plumbing you adopt; the thing being scoped — governed knowledge — is what nobody else does."*

## Beat 5 — Portability · 3 min
Feed the *same* `bundle/` to a **different** agent (Gemini / ChatGPT / a second tool). Ask the same question. It reaches the same grounded conclusion. **Say it:** *the knowledge isn't locked in one vendor — it's plain markdown any agent can read. That's OKF's whole point.*

## Beat 6 — Non-engineer edits the OS · 3 min
Live, in a plain text editor (no terminal): open [`glossary/categorisation.md`](../bundle/glossary/categorisation.md) and add a line, or create a new concept `bundle/glossary/rent-recognition.md` with two lines of frontmatter and a sentence. Re-ask the agent something that needs it. It picks up the new knowledge instantly. **Say it:** *no engineer, no deployment, no vector database — a subject-matter expert just taught every agent on the team.*

**Then volunteer the integrity note before anyone asks:** *"And yes — in production this edit is a pull request. The kernel lives in git, so review, CODEOWNERS and the change journal are the integrity model. What you just watched is the authoring cost, not the deployment path."* (Pre-empts the "one careless edit poisons every agent" objection — a fair one, since this beat demonstrates exactly that power.)

**Then the Google/M365 aside — say it unprompted; half the room is thinking it (~20 sec):**
> *"And if you're thinking 'my people live in Google Docs, not text editors' — same pattern, your stack: a shared Drive or SharePoint folder is the kernel, Suggesting mode is the pull request, version history is the journal, folder permissions are already mapped to your IdP, and Docs exports markdown natively so the content stays yours. Git buys you cleaner diffs, not admission to the club. Markdown is the wire format, not the user interface."*

(Pre-empted objections buy more credibility than answered ones — this one lands at exactly the moment the live-edit beat provokes it.)

## Beat 7 — The patrol: the register keeps itself honest · 1 min
Run the patrol against the bundle (one command, ~1 second) and show the digest:

```
kernel-keeper .        # private CLI for now — 8 deterministic checks
```

It prints an **affirm-or-amend digest grouped by owner**: dangling links, staleness, ownerless concepts, journal silence, definition↔concept pointer breaks. **Say it:** *"This is the librarian's patrol — the automatable 80% of keeping a kernel true. Its first runs found three real gaps in this exact bundle the week I built it; the fixes are public commits in this repo's history. It reports and proposes, it never edits — the clerk is automated, the judge is still a human. That's the answer to 'every wiki dies': this one is patrolled, and rot surfaces in days, not in a wrong answer months later."*

This beat closes the arc: grounded → governed → scoped → portable → editable → **patrolled**. It pre-empts the maintenance-decay objection before it's asked.

## Backup questions (if you want more)
- "Why is our categorisation accuracy lower than we'd like, and where?" → agent reads the metric + `categorisation_eval.csv` → utilities (84%) and transfers (79%, confused with income).
- "Reauth completion dropped — is that real?" → agent reads `reauth_events.csv` → it's a **channel-mix shift** (email-only jumped in W27), not a true regression → [reauth runbook](../bundle/runbooks/reauth-dropoff-spike.md).
- **"Anything *else* in connections worth worrying about?"** (the discrimination test) → agent finds Northern Rockford's 21 June dip (0.68), matches it to the **planned third-Sunday maintenance window** in [known quirks](../bundle/runbooks/known-aspsp-quirks.md), self-recovered → **"expected, don't page."** Detection is easy; a grounded agent *discriminates*.
- **"A client says payments keep failing — what's really happening?"** (multi-hop, commercial) → `payment_journeys.csv` shows SCA abandonment concentrated at **Haldane** (~79% vs ~90%) → quirks note: flaky mobile redirect, raised with their team, in-app fallback → connections to Haldane are *fine*; it's the SCA hand-off, one bank, known and owned.

## The one-liner to land it
> "Your team's AI already runs on *something*. Right now, for most teams, that something is nothing — it's guessing. A Team OS is the smallest change that turns guessing into knowing. It's a folder of markdown. You can start Monday."
