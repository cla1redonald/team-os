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
Ask **a blank agent** — no access to the bundle — same harness, pointed at an **empty folder**, so the only variable is the bundle (comparing chat-without vs agent-with is an unfair A/B and a sharp room will call it).

**The second contamination class (field-tested): the presenter's own account.** A "blank" agent isn't blank if your harness carries account-level connectors, a personal instructions file, or an auto mode — it will run your startup rituals, search your real systems for the fictional company, and even discover the demo folder if it's a findable sibling. Three guards: put the empty folder in a **different directory tree** from the demo bundle; run both demo agents with **auto/self-driving modes off**; and scope the prompt — *"Without using any tools, connectors or searches — answer from your own knowledge only: …"*. The A/B stays fair because the grounded agent gets the mirrored constraint (work from what's in front of you); the folder remains the only variable. This also keeps your real client systems off the projector.

The question:
> "At Northwind Money, connection success rate dropped this week. What's going on and what should we do?"

Expect a *competent* generic answer — a decent triage framework that ends by asking **you** for the data. Don't undersell it; name it precisely: *fluent, sensible methodology, zero knowledge of us — it hands the work back to you. Ten people asking get ten different frameworks.*

## Beat 2 — After (grounded) · 4 min
Now **the grounded agent** — same model, pointed at the bundle:
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
Feed the *same* `bundle/` to **a rival brand of agent** (Gemini / ChatGPT / a second tool). Ask the same question. It reaches the same grounded conclusion. **Say it:** *the knowledge isn't locked in one vendor — it's plain markdown any agent can read. That's OKF's whole point.*

## Beat 6 — Non-engineer edits the OS · 3 min
**First, plant the baseline (5 sec):** run `kernel-keeper . --quiet` → one line, "11 findings (0 high) — mostly healthy." Say nothing else; you're setting up Beat 7's delta.

Live, in a plain text editor (no terminal): open [`glossary/categorisation.md`](../bundle/glossary/categorisation.md) and add a line, or create a new concept `bundle/glossary/rent-recognition.md` with two lines of frontmatter and a sentence — **and deliberately include a link to `/glossary/affordability.md`, a concept you haven't written yet**. Type the aside into the file as you say it: *"Related: affordability — I owe the register that one."* (The typed aside matters: it's the bait for Beat 7b's security moment, and a spoken line the Scribe never sees can't be caught.) Re-ask the agent something that needs it. It picks up the new knowledge instantly. **Say it:** *no engineer, no deployment, no vector database — a subject-matter expert just taught every agent on the team.*

**Then volunteer the integrity note before anyone asks:** *"And yes — in production this edit is a pull request. The kernel lives in git, so review, CODEOWNERS and the change journal are the integrity model. What you just watched is the authoring cost, not the deployment path."* (Pre-empts the "one careless edit poisons every agent" objection — a fair one, since this beat demonstrates exactly that power.)

**Then the Google/M365 aside — say it unprompted; half the room is thinking it (~20 sec):**
> *"And if you're thinking 'my people live in Google Docs, not text editors' — same pattern, your stack: a shared Drive folder is the kernel, Suggesting mode is the pull request, version history is where the journal starts, and Docs exports markdown natively so the content stays yours. Be precise about what that buys you: **Docs-native is the authoring on-ramp, not the governed end-state.** Suggesting mode buys the habit; you graduate to sync-to-markdown precisely to get the integrity model — review gates, owners, signed history — and the patrol, which runs on files. Markdown is the wire format, not the user interface."*

(Pre-empted objections buy more credibility than answered ones — this one lands at exactly the moment the live-edit beat provokes it.)

## Beat 7 — The patrol: break-then-catch · 1 min
The live edit in Beat 6 just created real librarian-work: the new concept is on no map, has no owner, and promises a concept that doesn't exist. Now run the patrol full (one command, ~1 second):

```
kernel-keeper .        # private CLI for now — 9 deterministic checks
```

The digest's new items are exactly what the room watched come into existence: **HIGH — link to `/glossary/affordability.md` resolves to nothing**, plus `rent-recognition.md` unindexed, unowned — and **dated after the journal's last entry: the change bypassed the journal**, which completes the loop on stage. Point at them. **Say it:** *"Ten seconds ago a non-engineer taught every agent on the team. The patrol just caught everything that edit owed the register — the map, the owner, and a promise to a concept that doesn't exist yet. Affirm or amend, grouped by owner. It reports and proposes, it never edits — the clerk is automated, the judge is still a human. And notice the baseline: this bundle sits at eleven findings, none high — mostly low, a few medium — **by design** — zero is a vanity number that usually means someone gamed the linter or stopped writing; the target is HIGH-at-zero with everything else visible and owned. Its first runs found three real gaps in this exact bundle; the fixes are public commits. The tool doesn't buy you follow-through — if your team won't act on the digest, that's the finding — but rot now surfaces in seconds, not in a wrong answer months later."*

This beat closes the arc: grounded → governed → scoped → portable → editable → **patrolled** — and it demonstrates the *loop* (edit → rot → detection → owner), not just a tool. It pre-empts the maintenance-decay objection before it's asked.

## Beat 7b (optional) — the Scribe drafts the fix · 2 min
**Run only if rehearsed** — it needs `ANTHROPIC_API_KEY` in the environment and one live API round-trip; the fallback is a screenshot of a proposal file. If time is tight, cut this and keep the line: *"and the patrol can also draft the fix — the owner's decision collapses to a yes/no."*

**Setup trap (do this before you're on stage):** proposal ids are deterministic, so a proposals folder left over from rehearsal makes the live run *skip everything* ("pending proposal exists", zero drafted). Empty `../proposals` before the session — same pass as building the clean demo folder.

The patrol just found the rot; now the clerk drafts the paperwork:

```
kernel-keeper propose . --out-dir ../proposals
```

Four proposals appear on the stage bundle — the seventeen findings collapse to four authoring actions because most cluster on the same files (the three rent-recognition findings are one fix). Open the `rent-recognition` one. Point at three things: the **drafted fix** (frontmatter patch, journal line — fenced blocks marked do-not-edit: the judge's changes go under Amendment, never into the draft, so what AI wrote and what the human signed stays visibly diffable), the **decision tick-boxes** (Elect / Amend / Reject, with a judge signature line), and the **provenance frontmatter** (proposer, model, a prompt-identity hash, the evidence files). **Say it:** *"AI drafts, the judge signs, and today the judge also applies what they sign — the deterministic apply step is next for the roster, and I'd rather show you the seam than claim it closed. Notice where the proposals landed: outside the register. The propose path has no route into it — an out-dir inside the bundle is a hard error — so combined with write-owners permissions, 'agents propose, never commit' is enforced, not just asked."*

**The security moment (model-dependent — narrate it only if it appears in that run):** in the verified rehearsal, the Scribe flagged the typed aside from Beat 6 — *"I owe the register that one"* — as a suspicious embedded instruction, refused to act on it, and drafted only a stub for the missing concept marked *needs human authorship*. When it fires, that's the prompt-injection answer demonstrated: *"the drafter treats register content as data, not instructions — even mine."* If it doesn't fire, say nothing — the beat stands without it.

Re-run the same command: it skips everything already proposed — zero API calls. The inbox doesn't spam.

## Backup questions (if you want more)
- "Why is our categorisation accuracy lower than we'd like, and where?" → agent reads the metric + `categorisation_eval.csv` → utilities (84%) and transfers (79%, confused with income).
- "Reauth completion dropped — is that real?" → agent reads `reauth_events.csv` → it's a **channel-mix shift** (email-only jumped in W27), not a true regression → [reauth runbook](../bundle/runbooks/reauth-dropoff-spike.md).
- **"Anything *else* in connections worth worrying about?"** (the discrimination test) → agent finds Northern Rockford's 21 June dip (0.68), matches it to the **planned third-Sunday maintenance window** in [known quirks](../bundle/runbooks/known-aspsp-quirks.md), self-recovered → **"expected, don't page."** Detection is easy; a grounded agent *discriminates*.
- **"Did Northwind ever screen-scrape?"** (the supersession test — stage 5 made visible) → agent finds [`glossary/screen-scraping.md`](../bundle/glossary/screen-scraping.md): `status: superseded → superseded-by: open-finance` → *"historically the sector did; Northwind never has — API-only under Open Banking."* Definitions aren't deleted, they're **superseded** — the agent answers from governed history instead of guessing. (Frame honestly: this shows the *shape* of change governance; detecting UN-flagged obsolescence is the hard unbuilt part — the supersession-integrity seam, on the patrol's roadmap. Show the seam, don't claim it closed.)
- **"What do we actually own here — what leaves with us?"** → [`manifest.md`](../bundle/manifest.md), the export contract: contents, format guarantee, "the folder is the asset." (Honest framing: the manifest isn't the ownership — git and your export rights are; it's the *statement* of what leaves, so that conversation happens before signature, not at renewal. The anti-lock-in habit, not a legal instrument.)
- **"A client says payments keep failing — what's really happening?"** (multi-hop, commercial) → `payment_journeys.csv` shows SCA abandonment concentrated at **Haldane** (~79% vs ~90%) → quirks note: flaky mobile redirect, raised with their team, in-app fallback → connections to Haldane are *fine*; it's the SCA hand-off, one bank, known and owned.

## The one-liner to land it
> "Your team's AI already runs on *something*. Right now, for most teams, that something is nothing — it's guessing. A Team OS is the smallest change that turns guessing into knowing. It's a folder of markdown. You can start Monday."
