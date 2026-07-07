---
type: Research Brief
title: Team OS / Shared AI Context Outside Engineering
description: Named practitioners building the shared context layer in marketing, sales, recruitment, HR and finance — plus the foundational canon and Pawel Huryn.
tags: [team-os, non-engineering, practitioners, marketing, sales, recruitment, hr, finance]
timestamp: 2026-07-03
status: research-capture
---

# Team OS / Shared AI Context Layer — Outside Engineering
*Expert briefing, current as of July 2026.*

**Thesis:** *AI adoption stalls outside engineering because there's no shared context layer.* Engineers have git + `CLAUDE.md`/`AGENTS.md` as durable, agent-readable team infrastructure. Non-engineering functions mostly don't — so AI stays a personal, ad-hoc tool instead of team infrastructure. The research both supports this and shows the gap being closed in 2026, function by function.

## A. The foundational canon (pattern-setters)
- **Hannah Stulberg (DoorDash)** — shared **GitHub repo as "team OS"**: call summaries, metric definitions, PRDs, competitive research checked in by product, design, analytics AND eng, so any coding agent can help any team member; per-project `CLAUDE.md`. Explicit *"no technical background required."* [LinkedIn (via Aakash Gupta)](https://www.linkedin.com/posts/hannah-stulberg_last-week-i-sat-down-with-aakash-gupta-to-activity-7450537072228028417-zdmg)
- **Teresa Torres (Product Talk)** — personal **Claude Code agent architecture** (identity files, schedulers, task folders; macOS LaunchAgent + `run_agent.sh`). Argues engineering-only AI adoption "misses 60%+ of the value." [LinkedIn](https://www.linkedin.com/posts/teresatorres_i-listened-to-claire-vo-s-episode-on-lenny-activity-7445884223120486400-rr0Q) · [How to share your AI context and skills](https://www.producttalk.org/how-to-share-your-ai-context-and-skills/)
- **David Wascha** — **personal operating system on Claude Code** (email triage, scheduling, meeting prep); "deterministic logic in code, judgment in LLM." *"The markdown files aren't documentation about the system. They ARE the system."* [LinkedIn (Ed Biden)](https://www.linkedin.com/posts/edbiden_david-wascha-has-spent-months-building-a-activity-7451200359680659456-pvKw)
- **Product Talk** — evaluated **Git vs Dropbox vs iCloud vs Obsidian Sync** for sharing context/skills; principle: *"match tool complexity to team technical capability"*; brittle machine-specific paths are the #1 non-eng blocker. [producttalk.org](https://www.producttalk.org/how-to-share-your-ai-context-and-skills/)

## B. Flagship non-eng example: Paweł Huryn (product)
AI PM coach; **The Product Compass** newsletter (~131k+ subs). GitHub `github.com/phuryn`.
- **`pm-brain`** — *"The Second Brain for PMs, Made of Markdown."* Folder of plain markdown in git; agent **reads before answering, writes after, sweeps weekly**. Explicitly **no vector DB, no embeddings**. Commands `/ingest /prep /review /ideate /risk /plan`; folders `knowledge/ hypotheses/ decisions/ stakeholders/`. MIT. [repo](https://github.com/phuryn/pm-brain) · [write-up](https://www.productcompass.pm/p/pm-brain-os)
- **`pm-skills`** — *"100+ agentic skills… discovery to growth."* Thousands of stars (fast-moving — verify live). [repo](https://github.com/phuryn/pm-skills)
- **`swarm-protocol`** — *"coordination for agent-first teams — no UI, no sprints, no Jira, just state sync."* The most explicitly *team-OS* of the three. (Verify repo/name before quoting.)
- **Why he lands:** memory (`pm-brain`) + workflow (`pm-skills`) + coordination (`swarm-protocol`) = a full three-layer Team OS for a **non-engineering** function, in markdown, open-source, at scale. The closest thing to a codified, forkable Team OS in public.

## C. The five functions — named examples

### 1. Marketing (well-populated with named builders)
- **Emily Kramer (MKT1)** — packaged B2B frameworks as Claude Code skills + shipped an **MKT1 MCP Server** so subscribers pull the same shared context. [MKT1](https://newsletter.mkt1.co/p/real-marketers-claude-code-builds)
- **Elaine Zelby (Tofu)** — the canonical triplet as skills: **"ICP, personas, messaging"** shared across the team, then a `/customer-lookalike-outbound` agent on top. [MKT1](https://newsletter.mkt1.co/p/real-marketers-claude-code-builds)
- **Aditya Vempaty (MoEngage), Kamil Rextin (42 Agency)** — `/humanizer` voice-baseline skill; `/LinkedIn-ad-intel` competitive-intel agent. [MKT1](https://newsletter.mkt1.co/p/real-marketers-claude-code-builds)
- **Animalz** — Claude Code workflow enforcing a **brand style guide** via 8 parallel agents (one per guide section); the style guide *is* the shared context. [The Workflow](https://www.theworkflow.digital/p/claude-code-style-guide-animalz)
- Pattern: brand/ICP/personas/messaging as **structured markdown skills**, not repeated prompts. *"One great markdown file is worth more than 50 random uploads."*

### 2. Sales / RevOps (vendor-led narrative)
- **"Context layer" as the emerging RevOps primitive** — ICP, positioning, messaging live once, stay current, reach every agent in real time; "most of the time that context is scattered, stale, or missing." [Warmly](https://www.warmly.ai/p/blog/ai-for-revops)
- **MCP as shared sales memory** — "agents operate as a team with shared memory and rules." [Warmly MCP](https://www.warmly.ai/p/blog/mcp-sales-teams-revenue-model)
- **Context engineering as GTM thesis** — "every GTM motion eventually runs on a context graph that compounds"; RevOps gains a fourth responsibility: governing the context layer. [GTM Strategist](https://knowledge.gtmstrategist.com/p/the-2026-state-of-ai-for-gtm-workflows) · [Glean](https://www.glean.com/blog/ai-in-revenue-operations)

### 3. Recruitment / Talent
- **Guillermo Flor (Product Market Fit)** — **"Claude Agent for HR"**: full pipeline in Claude Code — JD via guided interview → CV scoring against a **rubric/scorecard** → stage comms → interview kit → offer → **onboarding plan derived from the same scorecard that hired them.** [productmarketfit.tech](https://www.productmarketfit.tech/p/claude-agent-for-hr)
- **Recruiter Claude Code pattern** — score candidates 1–10 with justification (>7 auto-outreach, 5–7 review, <5 dropped with reason), pipeline reporting via MCP into the ATS. [Hire Truffle](https://www.hiretruffle.com/blog/how-recruiters-can-use-claude-code) · [Metaview](https://www.metaview.ai/resources/blog/claude-for-recruiters)
- ⚠️ The **anonymisation** node (strip names/demographics before scoring) is an emerging pattern but no named hero example yet.

### 4. People / HR (vendor/analyst-led)
- **Onboarding-scoped retrieval agent** — read access to role + policy docs, write access to plan docs, walled off from comp/performance; personalised 30/60/90 in ~30 min. [Digital Applied](https://www.digitalapplied.com/blog/agentic-ai-hr-team-playbook-recruiting-onboarding-2026) · [Kore.ai](https://www.kore.ai/blog/ai-agents-for-human-resources-10-proven-use-cases-and-examples)
- **Competency frameworks as shared context** — agents build role-specific L&D from a **rubric**, track scores, surface gaps. [AIHR](https://www.aihr.com/blog/ai-in-hr/)
- **Governance gap = the barrier** — most orgs lack formal AI policy. [SHRM 2026](https://www.shrm.org/topics-tools/research/state-of-ai-hr-2026/full-report) · [HBR](https://hbr.org/2026/03/create-an-onboarding-plan-for-ai-agents)
- Most transferable idea: the **read/write permission scoping** (onboarding agent can read policy, can't read comp).

### 5. Finance / FP&A (most vendor-mediated)
- **The "knowledge layer" = governed metric definitions** — *"governed metric definitions, business rules, calculation logic, terminology, hierarchies, fiscal calendars"* so analysis is grounded in org truth, "not generic AI guessing." Near-perfect statement of the thesis for finance. [Tellius](https://www.tellius.com/resources/blog/best-ai-analytics-platforms-in-2026-12-tools-compared-by-capability-governance-and-depth-of-insight)
- **Board-pack prep** auto-generated from the governed layer (Mosaic). [ChatFin](https://chatfin.ai/blog/finance-ai-stack-2026-tools-cfos-close-ap-ar-fpa-reporting/)
- **Month-end close** grounded in a shared definitions layer. [Zenskar](https://www.zenskar.com/blog/finance-teams-using-ai-close)

## D. Convergent patterns
1. **Markdown-as-infrastructure** — everyone independently lands on *plain markdown files the agent reads before acting and writes after.* No vector DB (Huryn explicit).
2. **Emerging three-layer stack:** memory/context → workflow/skills → coordination. Engineering had it implicitly; other functions are now naming it.
3. **The unlock: context upfront as structured files, not prompts you repeat.**
4. **MCP as the cross-function "shared memory" bus.**
5. **Independent convergence = real signal** (Torres/Wascha built near-identical systems uncoordinated; Huryn productised it; RevOps/finance vendors describe the identical layer).

## E. Failure modes
1. **Brittle machine-specific file paths** — #1 non-eng blocker; sharing/sync is where non-engineers fall off.
2. **Tool complexity mismatched to team capability** — git wins for eng, loses for non-eng; Obsidian Sync wins on "no training."
3. **Personal, not shared** — the jump from "my agent" to "our team's agent" is where adoption stalls (the thesis).
4. **Governance vacuum (HR/Finance)** — no policy on what an agent may read/write blocks rollout more than tooling.
5. **Stale/scattered context** — decays without a "weekly sweep" discipline (Huryn's answer).

## F. Five examples that will land
1. **DoorDash's shared repo — "no technical background required."** Brand-name proof it scales beyond hobbyists.
2. **Huryn's `pm-brain` + `pm-skills` + `swarm-protocol`** — a full open-source three-layer Team OS for a non-eng function, "made of markdown."
3. **"The markdown files ARE the system" (Wascha)** — one line that reframes the thesis.
4. **Zelby's "ICP, personas, messaging" as three shared skills (Tofu)** — the exact three files a marketing team needs first.
5. **Flor's hiring OS where onboarding comes from the same scorecard that hired the person** — one shared context object threading the whole lifecycle.

## The sharp finding for the talk
Eng, **PM and marketing** have named individual builders hand-rolling markdown Team OSes in the open. **Sales, HR and finance** have *vendors* selling "the context layer," not named DIY practitioners. That imbalance is itself the argument: **the shared-context layer is furthest along exactly where individuals can hand-roll markdown, and stalls where governance and non-technical users dominate.** Your OKF Team OS demo is the bridge — it hands the hand-rollable, markdown-native pattern to the functions currently stuck waiting for a vendor.

## Accuracy flags
- LinkedIn activity URLs (Stulberg, Torres, Wascha) carried as-captured; cite the person + Product Talk article rather than the raw activity ID.
- Huryn star counts fast-moving; `swarm-protocol` repo not independently opened — verify before quoting.
- Recruitment anonymisation + HR/Finance individual practitioners: pattern-real, hero-example-thin in public.
