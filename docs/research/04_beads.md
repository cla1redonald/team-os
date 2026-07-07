---
type: Research Brief
title: Beads (bd) — Steve Yegge's git-native memory system for coding agents
description: What Beads is, how it works (now Dolt-backed, not SQLite+JSONL), the discourse, and applicability outside engineering.
tags: [team-os, beads, memory, steve-yegge, agents]
timestamp: 2026-07-03
status: research-capture
---

# Beads (bd) — Steve Yegge's git-native memory system for coding agents
*Expert briefing for senior technology leaders · verified July 2026.*

> **Freshness trap (flag this):** most write-ups describe the launch architecture (**SQLite + JSONL**). The backend has since migrated to **Dolt**. Cite the old stack and you out yourself as second-hand.

## What it is & why
- **Current repo tagline:** *"Distributed graph issue tracker for AI agents, powered by Dolt"* / *"A memory upgrade for your coding agent."* — [github.com/steveyegge/beads](https://github.com/steveyegge/beads)
- **Author:** **Steve Yegge** (ex-Google/Amazon, then Sourcegraph; co-author *Vibe Coding*). Beads is his personal OSS project (Go, MIT), **not** a Sourcegraph product.
- **Origin:** a ~40-day vibe-coded project hit 350k LOC and drowned in **605 decaying markdown plan files**; on 8 Oct 2025 he pivoted to a purpose-built tracker — agents' long-horizon planning "dramatically improved" in 15 min. — [Introducing Beads](https://steve-yegge.medium.com/introducing-beads-a-coding-agent-memory-system-637d7d92514a)
- **Problem — "50 First Dates":** agents restart every ~10 min with no memory, announce a 6-phase plan, do phases 1–2, then after a context reset forget and create *nested* 6-phase plans inside phase 3, declaring "done" while ignoring the outer work. Residue = hundreds of abandoned markdown files.
- **Framing:** *external memory for agents with dependency tracking* — persistent, structured, queryable memory that **travels with the code in git** (versioned, branch-aware, offline, no server/SaaS).
- **Adoption:** ~**25k stars**, v1.0.4 (May 2026), installable via npm/Homebrew/PyPI; works across Claude Code, Copilot, Amp.

## How it works
- **Data model:** a **DAG of "beads" (issues)** with dependencies + priorities so agents compute "ready work." Four edge types: **`blocks`, `parent-child`, `related`, `discovered-from`** (last = audit trail of work found mid-task).
- **Storage (now):** backend = **Dolt** (version-controlled SQL DB); **JSONL is now just an export/interchange, not the source of truth** (it *was* the source of truth at launch, with a git-ignored SQLite cache).
- **Collision-free IDs:** hash-based (`bd-a1b2`) to survive parallel multi-agent/branch creation; hierarchical (`bd-a3f8.1`) for epics.
- **Killer primitive:** `bd ready` returns only unblocked, prioritised tasks — *"computes transitive blocking offline in ~10ms"* (a topological ready-queue).
- **Agent interface — CLI-first, no MCP required:** install `bd`, add one line to `AGENTS.md`/`CLAUDE.md`. Commands: `bd prime`, `bd ready --json`, `bd create`, `bd update <id> --claim --assignee` (atomic claim for multi-agent), `bd dep add`, `bd remember "insight"` (persistent memory instead of MEMORY.md), `bd close`.
- **vs markdown TODOs:** markdown isn't queryable, bitrots into competing versions, burns context. Yegge instructs agents: *"Do not use markdown TODO lists for task tracking."*
- **vs GitHub Issues/Jira:** *"GitHub Issues excels for human teams… bd excels for AI agents"* — offline, branch-aware, no network latency, no lock-in. No Jira/Linear migration tool yet.

## Discourse — hype & love/hate
- Launched 13 Oct 2025, viral through Nov; by 6 Nov: 27 external PR contributors, 1,500 commits, "seven major rearchitectures." — [Beads Blows Up](https://steve-yegge.medium.com/beads-blows-up-a0a61bb889b4)
- Biggest HN thread: *"Beads – A memory upgrade for your coding agent"* — 111 pts/68 comments — [HN 46075616](https://news.ycombinator.com/item?id=46075616).
- **"Just use X"** reflex: GitHub Issues, git-bug, git-issue, git notes, Fossil tickets. — [HN 46487580](https://news.ycombinator.com/item?id=46487580)
- **Most-cited counter-build:** *"I replaced Beads with a faster, simpler Markdown-based task tracker"* (84 pts) — author kept the **graph-dependency concept**, dropped the rest: *"you don't need to index everything with SQLite when you have awk"*; complained the **background daemon synced the wrong things at the wrong times.** — [HN 46487580](https://news.ycombinator.com/item?id=46487580)
- **AI-README backlash** + **anthropomorphism skepticism** ("agents enjoy working with Beads" drew pushback).
- **Yegge's candour:** *"100% vibe coded"*; *"pooped out in four or five days… launched without half a day of testing"*; *"a leaky abstraction, and it will remain that way."*
- **Common misunderstanding:** Beads is a **task/dependency coordinator**, not a codebase knowledge base or full Jira replacement. "Confluence vs Jira — Beads is the Jira side."

## Canonical quotes
- Yegge: *"After using Beads, going back to markdown TODOs feels like trying to remember a phone number without writing it down."*
- Ian Bull: *"All they know is what's on disk. If you got competing documents, obsolete documents, conflicting documents… they get dementia."*
- Ian Bull (the model): ***"Beads provides the memory. You provide the discipline to use it."*** — [ianbull.com/posts/beads](https://ianbull.com/posts/beads/)

## Outside engineering
- **Direct non-eng adoption: essentially none found.** Every source frames it for coding agents; the git/CLI/JSONL surface presupposes git literacy.
- The **transferable pattern** is being catalogued as "structured task graphs as external agent memory."
- **Analysis (not sourced):** transfers best to genuinely dependency-shaped work — launch/GTM plans, onboarding runbooks, compliance/audit checklists, RevOps sequences; worst to relationship/judgement work. For non-eng, "Beads for X" is more likely to come from **incumbent PM/CRM platforms** (Linear, Asana, Notion, Jira, Salesforce Agentforce, HubSpot Breeze) exposing their object graph to agents than from a git-native clone.

## 5 talking points
1. **Agent memory is an infrastructure problem, not a prompting problem** — externalise it into a versioned dependency graph so agents resume instead of re-derive.
2. **Git-native = zero infra + branch-aware memory**, survives merges via hash IDs, no SaaS/lock-in.
3. **`bd ready` is the killer primitive** — a ~10ms offline topological query markdown TODOs fundamentally can't do.
4. **Existence proof, not finished product** — 25k stars but "100% vibe coded," seven rearchitectures in three weeks. Adopt the *pattern*; pin the version.
5. **Right altitude:** "what's next this week" for agents — the agent-facing complement to (not replacement for) Jira/GitHub Issues.

## Criticisms to preempt
1. "Just use GitHub Issues/git-bug/git notes." (Counter: latency, lock-in, no offline transitive-dependency query — but marginal for `gh`-native teams.)
2. Overkill/instability for small projects (the daemon-sync complaint).
3. Maturity risk — vibe-coded, untested launch, seven rearchitectures, **backend swapped to Dolt**.
4. Anthropomorphism/vendor hype — strip the "fairy-dust" before presenting.
5. Requires human discipline + explicit prompting — agents don't reach for it unprompted.
6. Unproven outside engineering.

*Flags: Yegge's X launch quote is from the search index (direct fetch 402'd); "Beads Best Practices" not deep-read; non-eng applicability is labelled analysis, not sourced adoption.*
