---
type: Research Brief
title: The Agent Context & Knowledge-Format Landscape
description: The stack of context layers for a team's AI, and where OKF fits — for a senior technical audience.
tags: [team-os, okf, context-engineering, formats]
timestamp: 2026-07-03
status: research-capture
---

# The Agent Context & Knowledge-Format Landscape
*Expert brief for senior technology leaders. As of July 2026. OKF specifics below are confirmed against the published spec (`GoogleCloudPlatform/knowledge-catalog`, v0.1, 12 June 2026).*

## The one-line thesis
There is no single "standard" for giving AI agents context — there is a **stack of layers**, each solving a different problem. Google's **Open Knowledge Format (OKF)** standardises the one layer that was still missing: **durable, curated, cross-linked domain knowledge**. It is not a competitor to AGENTS.md or MCP — it sits *beside* them. Most of these "standards" are conventions (a folder and a filename), not W3C-style specs; their value is coordination, not enforcement. That is true of OKF too.

## The four layers of shared context (the mental model)
1. **Instructions layer** — *how the agent should behave.* → AGENTS.md, CLAUDE.md, `.cursor/rules`, Windsurf rules.
2. **Knowledge layer** — *durable, curated facts about your domain* (metrics, processes, glossary, ownership). → **OKF** (and, web-facing, llms.txt).
3. **Memory layer** — *what happened before / evolving state.* → agent memory features, Mem0, Letta/MemGPT, Zep; and **Steve Yegge's Beads** for task/issue memory.
4. **Tools / retrieval layer** — *live capabilities and data at runtime.* → MCP; Agent Skills straddle knowledge-delivery and tools via progressive disclosure.

**Strategic insight:** the instructions layer is nearly commoditised (converging on AGENTS.md), the tools layer has a clear winner (MCP), the memory layer is a live product battleground — and the **knowledge layer was the standardisation gap OKF is trying to fill.** Outside engineering, teams are usually missing the *knowledge layer* entirely — which is exactly why their AI adoption stalls.

## OKF — the knowledge layer (confirmed spec)
- A **bundle** = a directory tree of markdown files. Each file = one **concept** (metric, table, API, process, runbook, glossary term).
- **Only `type` is required** in YAML frontmatter. Recommended: `title`, `description`, `resource`, `tags`, `timestamp`. Consumers must preserve unknown fields and tolerate unknown types.
- Concepts **link to each other with plain markdown links** (`/path.md`, bundle-relative or relative) → the directory becomes a **knowledge graph** of untyped directed edges.
- Optional reserved files: `index.md` (progressive disclosure) and `log.md` (change history).
- Conformance (v0.1): every non-reserved `.md` has parseable frontmatter with a non-empty `type`; everything else is soft guidance / best-effort.
- Apache-2.0; Google ships `samples/` and a `toolbox/`. **Not** a Google product; vendor-neutral by design.
- **The sceptic's question to pre-empt** ("a standard, or just a folder?"): technically it *is* a folder with rules. Its value isn't expressiveness — it's **convergence**: if every RAG pipeline, IDE and agent can ingest the same folder, the folder becomes an interchange format. One month post-launch, adoption data is thin — don't over-index on GitHub stars.

## The competing / adjacent conventions (mostly the *instructions* layer)
| Format | Backer | Layer / purpose | Adoption (mid-2026) | Relation to OKF |
|---|---|---|---|---|
| **OKF** | Google | Knowledge — curated domain facts as a graph | Brand new (12 Jun 2026); not yet meaningful | The anchor |
| **AGENTS.md** | Open / OpenAI-associated | Instructions — how to work in a repo | Strongest; consolidating the instruction-file mess | Complement (tasks vs knowledge) |
| **llms.txt / llms-full.txt** | Jeremy Howard / Answer.AI | Discovery — expose site content to LLMs | Widely published; real consumption contested | Adjacent (web-facing vs internal bundle) |
| **CLAUDE.md** | Anthropic | Instructions/memory — Claude Code context | De facto in Claude Code; converging on AGENTS.md | Complement |
| **`.cursor/rules` / `.mdc`** | Anysphere (Cursor) | Instructions — scoped behavioural rules | Standard within Cursor | Complement |
| **Windsurf rules** | Windsurf | Instructions — Cascade rules/memories | Standard within Windsurf | Complement |
| **Agent Skills / SKILL.md** | Anthropic | Capabilities — playbooks loaded on demand | Growing since Oct 2025 | Contrast (dynamic vs static; can *carry* OKF) |
| **MCP** | Anthropic-originated, open | Tools/retrieval — runtime tool & data access | Dominant agent interop protocol | Contrast (runtime vs static; can *serve* OKF) |

## Delivery: static vs dynamic
- **OKF is static** — you assemble a curated graph into context ahead of time. "A library on the shelf."
- **MCP is runtime retrieval** — the agent phones a server for exactly what it needs. "A phone line to the librarian."
- **Skills are just-in-time playbooks** — progressive disclosure: the agent only loads the full skill when a task warrants it. "Playbooks grabbed when the task calls for one."
- All three coexist; an OKF bundle could itself be **served over MCP or packaged as a Skill's resource** — the likeliest way OKF reaches production agents.

## Context engineering (the discipline)
The umbrella framing (successor to "prompt engineering"), popularised mid-2025 by Tobi Lütke and Andrej Karpathy, documented by Simon Willison; Anthropic's "Effective context engineering for AI agents" is the canonical lab essay. Core ideas now taken as given: the context window is the scarce resource; **what you retrieve beats what you stuff**; long context degrades ("context rot"); compaction and memory-externalisation are load-bearing. OKF is a bet that **curated, pre-structured knowledge** beats dumping raw docs and hoping RAG retrieves well.

## Explain-it-to-an-exec version
> An AI agent is a new hire on day one.
> - **AGENTS.md / CLAUDE.md = the staff handbook** ("how we do things here").
> - **OKF = the company wiki** (curated facts about our products, metrics, customers, policies — written once, kept current).
> - **Memory = their growing notebook** (what they've learned working with us). Beads is this for *tasks*.
> - **MCP = their access badge and phone** (how they reach live systems).
> - **Skills = playbooks** pulled off the shelf only when a task needs one.
> "Context engineering" is deciding what to put in front of the agent, and when. OKF standardises the *wiki* part so any tool can read the same one — promising, a month old, and a convention, not a law.

## Criticisms to pre-empt in the room
- "OKF just reinvents the wiki with YAML." → True-ish; the point is *convergence/interop*, not novelty.
- "Adoption?" → One month old — don't claim victory; claim it's the first serious attempt to standardise the knowledge layer.
- "Why not just RAG?" → RAG retrieves from messy source docs; OKF is *curated* knowledge authored for agents — higher signal, version-controlled, human-auditable.
