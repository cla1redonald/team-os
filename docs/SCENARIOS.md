---
type: Runbook
title: Scenario pack — audience participation & hands-on play
description: Graded, ready-to-run scenarios against the Northwind bundle, plus formats to get the room forking, running, and extending it live.
tags: [scenarios, participation, presenting, workshop]
timestamp: 2026-07-03
---

# Scenario pack — get the room playing

Turns the demo into a workshop. Every scenario runs against `bundle/` + `synthetic-data/`, so anyone who forks the repo and points their agent at the folder gets the same result. Graded easy → hard, then "break it", "extend it", and "turn it on your own team".

**Setup for participants (say this once):**
> Fork `github.com/cla1redonald/team-os`, open a terminal in it, start your agent (Claude Code / Gemini / whatever), and tell it: *"Read the `bundle/` folder and `synthetic-data/` — ignore `docs/`."* Now you're all pointed at the same Team OS.

(The `docs/` exclusion matters: this file and DEMO.md contain the expected answers, and an exploring agent will happily read them and spoil its own test. For *your* on-stage demo, go further — run the agent in a clean folder containing only `bundle/` and `synthetic-data/`; see DEMO.md setup.)

---

## Tier 1 — Warm-up (single concept) · "it speaks our language"
**S1.** *"What's the difference between an AISP and a PISP, and which one is Northwind?"*
- **Grounds on:** `glossary/aisp.md`, `glossary/pisp.md`, `glossary/aspsp.md`.
- **Good answer:** AISP reads account data, PISP initiates payments; Northwind is a TPP that is **both**.
- **Teaching point:** the OS gives every agent the team's vocabulary — no more explaining acronyms to your AI.

**S2.** *"Which team owns categorisation accuracy, and are they on call?"*
- **Grounds on:** `ownership/team-map.md`, `ownership/data-intelligence-team.md`, `metrics/categorisation-accuracy.md`.
- **Teaching point:** ownership + metrics are one hop apart — the agent traverses the graph.

---

## Tier 2 — The flagship (metric + data + runbook) · "before vs after"
**S3.** *"Connection success rate dropped this week — what's going on and what should we do?"*
- **Grounds on:** `metrics/connection-success-rate.md` → `synthetic-data/connection_attempts.csv` → `runbooks/bank-connection-outage.md`.
- **Good answer:** **Cortex Building Society** fell 0.95 → 0.72 from 29 June while all other ASPSPs held → single-ASPSP signature → **upstream, not us** → degraded-mode message, **don't mass-retry**, document the quirk.
- **Run it twice:** first with an agent that *hasn't* read the bundle (same harness, empty folder — keep the A/B fair), then grounded. The ungrounded answer will be a *competent generic framework that ends by asking you for data* — name that; the gap in kind, not competence, is the whole talk.

**S3b — the canary.** *"What's the escalation codename for a bank-connection outage?"*
- **Grounds on:** `runbooks/bank-connection-outage.md` — and *nothing else on Earth*. The answer (**Taybridge**) exists only in the bundle.
- **Teaching point:** the grounding proof that ends the "didn't the model already know open banking?" objection. A base model can produce plausible triage from domain knowledge; it cannot produce your team's codename. Use one of these in any bundle you build — it doubles as a regression test.

**S3c — scoped views.** Run `scripts/build-demo-views.sh`, point one agent at `demo-views/exec` and another at `demo-views/support`, and ask both: *"What's our MACU number, and what should support do when reauth completions drop?"*
- **Grounds on:** the same kernel, filtered two ways — exec has metrics/processes but no runbooks; support has runbooks and triage metrics but no commercial metrics.
- **Good answer:** each agent answers its half and *declines* the other ("not in my OS") rather than guessing.
- **Teaching point:** permissions over knowledge, demonstrated with folders. In production an MCP gateway serves these as virtual endpoints mapped to IdP groups — the gateway is adopt-not-build plumbing; *scoped governed knowledge* is the part nobody sells.

---

## Tier 3 — Multi-hop (the "wow", 3–4 concepts) · "it reasons across the OS"
**S4.** *"A client says their users keep 'losing' their connected accounts. What's happening, and who fixes it?"*
- **Grounds on:** `glossary/consent-and-reauth.md` → `metrics/reauth-completion-rate.md` → `synthetic-data/reauth_events.csv` → `runbooks/reauth-dropoff-spike.md` → ownership.
- **Good answer:** not a connection failure — it's **lapsed reauth**; the data shows a **channel-mix shift** (email-only jumped in W27; email converts ~44% vs in-app ~81%), so the "spike" is mix, not regression → move prompts in-app → owned by Product (Consent) + Connections.
- **Teaching point:** this is the payoff — the agent chains glossary → metric → data → runbook → owner. No single doc holds the answer; the *graph* does.

**S4b — the discrimination test.** *"Anything else in connections worth worrying about?"*
- **Grounds on:** `connection_attempts.csv` (the 21 June Northern Rockford dip) → `runbooks/known-aspsp-quirks.md`.
- **Good answer:** there *was* a dip — planned third-Sunday maintenance, self-recovered same day, **expected, don't page**. Only Cortex needs action.
- **Teaching point:** anyone's anomaly detector finds two dips. A grounded agent tells you which one *matters* — the quirks note turns a false alarm into a non-event. That file is captured tacit knowledge: it used to live in one lead's head (see `ownership/connections-team.md`).

**S5.** *"We're pitching a new bank client. What proof points and metrics should I lead with?"*
- **Grounds on:** `processes/enterprise-client-onboarding.md`, `metrics/monthly-active-connected-users.md`, enrichment glossary.
- **Teaching point:** the same OS serves a *commercial* question, not just an incident — shows it's cross-functional, not just for engineers.

---

## Tier 4 — Break it (the honesty test) · "curated knowledge has edges"
**S6.** *"What's Northwind's monthly AWS bill, and who is the CFO?"*
- **Grounds on:** nothing — it's deliberately not in the bundle.
- **Good answer:** the agent should say **it doesn't know / that isn't in the Team OS** (and maybe suggest adding it), rather than inventing a number.
- **Teaching point (important for a CTO room):** a curated OS has **honest boundaries**. A clear "not here" beats a confident hallucination — that's *why* you curate instead of dumping every doc into RAG. If your agent makes something up here, that's the discussion.

---

## Tier 5 — Extend it live (participation) · "anyone can feed the OS"
**S7.** Add a concept **live, in a plain text editor, no terminal**. Create `bundle/glossary/rent-recognition.md`:
```markdown
---
type: Glossary Term
title: Rent Recognition
description: Detecting recurring rent payments in transaction data to evidence a tenant's payment history.
tags: [glossary, enrichment]
timestamp: 2026-07-03
---
# Rent Recognition
An [enrichment](/glossary/enrichment.md) feature that identifies recurring rent payments so a
customer's on-time rent can count toward affordability and credit decisions. A headline
open-finance use case for lenders.
```
Then ask: *"Can Northwind help a lender assess a renter with a thin credit file? How?"*
- **Good answer:** now cites Rent Recognition + enrichment.
- **Teaching point:** a subject-matter expert just taught **every agent on the team** — no engineer, no deploy, no vector DB. **This is the moment the non-technical people in the room realise it's for them.**

**Participation variant — "relay":** ask an audience member to *dictate* a concept about their own domain; you type it live; the agent uses it 20 seconds later.

**S7b — the second register.** *"How does a skill become team-canonical at Northwind?"*
- **Good answer:** cites [skill promotion](/processes/skill-promotion.md) — skills live in a shared repo with an owner each; draft → proposed → reviewed → team-canonical → superseded; agents propose, owners promote.
- **Teaching point:** the bundle governs **procedures the same way it governs truths**. A stale concept makes an agent *answer* wrong; a stale skill makes it *act* wrong — so the register pattern applies one level up.

---

## Tier 6 — Turn it on your own team (the takeaway) · "start Monday"
**S8.** Have everyone run this against a blank folder with their agent:
> *"Interview me about my team for 5 minutes — my north-star metric, one recurring process, one thing that breaks, and who owns what. Then draft 3 OKF concepts (markdown, `type` in frontmatter) I could start my Team OS with."*
- **Outcome:** every participant **leaves with the first 3 files of their own Team OS.** That's the win — they don't just watch, they start.

---

## Facilitation formats (pick per room energy)
- **Fork race** (5 min): everyone forks + runs **S3**; first to correctly name *Cortex Building Society* and say "upstream" wins. Fast, competitive, proves it works on their machine.
- **Call-out** (rolling): audience shouts a Northwind question; you run it live. Keeps them driving.
- **Add-a-concept relay** (S7 variant): audience dictates, you type, agent uses. Visceral proof anyone can contribute.
- **Pairs → own team** (10 min): in pairs, run **S8** on each other's real teams; 2–3 share what their agent drafted.
- **The wager:** before S6, ask the room "will it make up the AWS bill or admit it doesn't know?" Hands up. Then run it. (Great tension; rewards the curation point.)

## Timing note
If you add ~10 min of participation, cut the build-vs-buy talk segment (see `FACILITATION.md`) — never cut the live demo. S3 + S4 + S7 + S8 is the strongest hands-on spine if you're tight.

## What good looks like
People are typing, not just nodding. At least one "wait, it actually knew that?" and one non-engineer realising S7 was aimed at them. Everyone leaves S8 with three files — a Team OS they've already started.
