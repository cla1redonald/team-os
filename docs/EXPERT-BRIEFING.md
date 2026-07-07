---
type: Briefing
title: Team OS & the shared context layer — master expert briefing
description: The synthesis that makes the presenter the authority in the room. Thesis, landscape, practitioners, build-vs-buy, positioning, narrative, and Q&A defence.
tags: [team-os, briefing, master, presenting]
timestamp: 2026-07-03
---

# Team OS & the shared context layer — master expert briefing
*Synthesised from the research briefs in `docs/research/`. Every external claim is sourced there; honesty flags carried through.*

## 1. The thesis (say this in the first 90 seconds)
Every team's AI is a **brilliant amnesiac**. It's fluent, but it doesn't know *your* metrics, *your* processes, *your* customers, *your* decisions. Engineers quietly solved this — they have git, `CLAUDE.md`/`AGENTS.md`, and now formats to hand agents curated context. **Everyone else didn't.** That's why AI adoption stalls outside engineering: not a model problem, a **shared-context problem**. A **Team OS** is the fix — the curated, agent-readable knowledge layer a team's AI runs on. Google just shipped a standard for it (OKF); the pattern is spreading function by function. I'll stand one up live.

## 2. The mental model — four layers (your whiteboard)
| Layer | What it is | Canonical tool/format | If missing |
|---|---|---|---|
| **Instructions** | how the agent should behave | AGENTS.md, CLAUDE.md, Cursor/Windsurf rules | agent ignores your conventions |
| **Knowledge** | curated facts about *your* domain | **OKF** (LLM-wiki), llms.txt | agent is generic / confidently wrong ← **the gap outside eng** |
| **Memory** | what happened before / evolving state | Mem0, Letta, Zep; **Beads** (task memory) | agent has "50 First Dates" amnesia |
| **Tools/Retrieval** | live capabilities & data | MCP; Agent Skills (progressive disclosure) | agent can't reach real systems |

One line: *Instructions = the staff handbook. Knowledge = the company wiki. Memory = their notebook. Tools = their access badge.* The instructions layer is near-commoditised (converging on AGENTS.md); tools has a winner (MCP); memory is a battleground; **the knowledge layer was the gap — that's what OKF and a Team OS fill.**

## 3. OKF — the knowledge layer, standardised (3 weeks old)
Google's **Open Knowledge Format** (v0.1, 12 June 2026, `GoogleCloudPlatform/knowledge-catalog`, Apache-2.0): a directory of markdown files, **one "concept" per file**, only `type` required in frontmatter, concepts cross-linked into a **graph**; optional `index.md`/`log.md`. It's just markdown — forkable, git-hostable, **editable by a non-engineer**. It formalises the "LLM-wiki" pattern into something portable and vendor-neutral.
- **The sceptic's line to pre-empt:** *"a standard, or just a folder?"* Answer: technically a folder with rules — the value isn't expressiveness, it's **convergence/interop**. One month in, don't claim victory; claim it's the first serious attempt to standardise the knowledge layer.
- **Why not just RAG?** RAG retrieves from messy source docs; OKF is *curated* knowledge authored for agents — higher signal, version-controlled, human-auditable.

## 4. Beads — the memory layer, and the freshness flex
Steve Yegge's **Beads** (`bd`): git-native **external memory for coding agents** — a DAG of issues with dependencies, `bd ready` returns unblocked work in ~10ms. Solves the **"50 First Dates"** amnesia. 25k stars, "100% vibe coded," seven rearchitectures in three weeks.
- **The detail that proves you're current:** Beads **migrated from SQLite+JSONL to Dolt.** Every launch-era write-up describes the old stack — cite Dolt and you're clearly first-hand.
- **The honest altitude:** Beads is *task* memory, not a knowledge base ("Confluence vs Jira — Beads is Jira"). It's the memory layer; OKF is the knowledge layer. Don't conflate them — that's the most common architecture mistake.

## 5. The proof outside engineering (your thesis, evidenced)
- **Foundational:** Hannah Stulberg (**DoorDash**) — shared repo as team OS, *"no technical background required."* Teresa Torres & David Wascha — *"the markdown files ARE the system."*
- **Flagship:** **Pawel Huryn** (Product Compass, ~131k subs) — `pm-brain` ("Second Brain for PMs, made of markdown," no vector DB), `pm-skills`, `swarm-protocol` ("no Jira, just state sync"). A full three-layer Team OS for a non-eng function, open-source, at scale.
- **By function:** Marketing has named builders (Emily Kramer/MKT1, Elaine Zelby/Tofu's *"ICP, personas, messaging"* triplet, Animalz's style-guide-as-8-agents). Recruitment: Guillermo Flor's hiring OS where *onboarding comes from the same scorecard that hired the person.*
- **The killer finding for the room:** eng, **PM and marketing** have named individuals hand-rolling markdown Team OSes; **sales, HR and finance** have *vendors* selling "the context layer," not DIY practitioners. **The layer is furthest along exactly where people can hand-roll markdown, and stalls where governance and non-technical users dominate.** Your demo is the bridge — it hands the hand-rollable pattern to the stuck functions.

## 6. Build vs buy (the CTO debate you'll get)
A hand-curated OKF Team OS does by hand, for a small team, what **Glean / M365 Copilot / Atlassian Rovo / Notion / Dust / Guru** productise at scale.
- **DIY wins:** portability / zero lock-in (plain text in git — enterprise indexes are proprietary and often non-exportable; you *rent* retrieval), ~$0 cost, curation quality for <50-person teams, agent-neutral via MCP.
- **Enterprise wins:** connector breadth, **permission-aware retrieval at scale** (the #1 reason to buy — a DIY OKF has no per-user ACL), governance (SSO/SCIM, audit, residency).
- **The trigger to buy is capability, not cost:** buy when you need *enforced permissions* and *live-system reach*, which arrives before the dollars hurt.
- **Memory ≠ knowledge:** curated knowledge (OKF) is authored/governed; memory (Mem0/Letta/Zep/Beads) is derived/mutable. You need both.

## 7. Your positioning (why you, specifically)
Ground this in what *you've* actually built — a room like this can smell theory. List your own proof points before you present: the agents, skills, MCP servers, or knowledge systems you run day to day, and any team or org where you've applied the pattern for real. If you can pair diagnostics (*where you are*) with a Team OS (*how to improve*), that's a strong one-two.

## 8. The 45-minute narrative
1. **Problem** (3m) — the brilliant amnesiac; adoption stalls outside eng.
2. **Model** (4m) — the four layers; the knowledge-layer gap.
3. **Landscape** (6m) — OKF (3 weeks old), Beads (Dolt), the non-eng builders + the "vendors vs builders" finding.
4. **Live build** (12m) — stand up the Northwind Money OKF bundle; show it's markdown a non-engineer can write.
5. **The wow** (12m) — point an agent at it: **before** (no context → generic) vs **after** (grounded → diagnoses the Cortex CSR dip using metric + runbook + data); then the *same* bundle read by a second agent = portability.
6. **Build-vs-buy + why it matters** (6m) — the debate, the flywheel, your positioning.
7. **Close** (2m) — "your team's AI already runs on *something*. Right now it's nothing. Here's the smallest thing that changes that."

## 9. Q&A defence — if someone asks…
- *"Isn't this just a wiki?"* → Yes, pointed at agents and standardised for interop. The novelty is convergence, not the format.
- *"Didn't the base model already know most of that?"* → The domain, yes — that's why the ungrounded answer sounds competent. But it's a generic framework that ends by asking *you* for data; grounded, it's a specific diagnosis in your language ending in your runbook's action, and everyone gets the *same* answer. Then run the canary (the escalation codename) — no base model can produce that.
- *"Why not RAG over everything?"* → Everything-buckets return confident answers from stale/contradictory sources. Curated + verified beats retrieved-from-mess. You need both.
- *"Doesn't OKF lock me into Google?"* → Opposite — Apache-2.0, vendor-neutral, plain markdown; serve it over MCP to Claude/Gemini/ChatGPT alike.
- *"Adoption?"* → One month old. Don't over-index on stars. It's the first serious knowledge-layer standard.
- *"Permissions?"* → The honest DIY gap — no per-user ACL. Above ~100 seats or regulated data, that's your trigger to buy.
- *"Beads?"* → Task memory, git-native, now Dolt-backed; adopt the *pattern*, pin the version; unproven outside eng.

## 10. Accuracy flags to respect on stage
- OKF is 3 weeks old — frame as promising, not proven.
- Beads: cite **Dolt**, not SQLite+JSONL.
- Non-eng practitioner star counts / LinkedIn URLs are fast-moving — cite the person, not the metric.
- Northwind numbers are synthetic; say so if asked.
