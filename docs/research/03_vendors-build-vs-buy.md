---
type: Research Brief
title: The Shared Knowledge/Context Layer — Vendors & Build-vs-Buy
description: How Glean/Copilot/Rovo/Notion/Dust etc. productise the context layer, the Google stack, memory products, and when to build (OKF) vs buy.
tags: [team-os, vendors, build-vs-buy, glean, copilot, rovo, memory]
timestamp: 2026-07-03
status: research-capture
---

# The Shared Knowledge/Context Layer — Vendors & Build-vs-Buy
*Expert briefing for senior technology leaders, July 2026. Pricing/branding changes quarterly — items marked [VERIFY] need a live check before public use.*

## Thesis
Every major platform is racing to own "the context layer" — the thing that grounds an agent in *your* org's truth, not the model's generic training. A hand-curated markdown **Team OS** (OKF + a lightweight tracker like Beads) does by hand, for a small team, what Glean/Copilot/Rovo productise at enterprise scale. **DIY wins on portability, cost, curation quality for small teams; enterprise platforms win on connector breadth, permission-aware retrieval at scale, governance/compliance.** The 2026 wrinkle: **MCP** lets any markdown base be exposed to any agent, so "you must buy a platform to make knowledge agent-accessible" is a weaker argument than 18 months ago.

## Enterprise knowledge / RAG-for-work platforms
| Product | Role | Grounding | OKF/DIY beats / loses | 
|---|---|---|---|
| **Glean** | Company-wide work AI + agents | Permissions-aware hybrid retrieval over a knowledge graph, 100+ connectors, ACLs at query time | Loses on connectors/permissions; OKF wins cost/portability/curation for <50-person teams |
| **M365 Copilot + Semantic Index + Copilot Studio** | Suite AI + agent builder | Permission-trimmed vector index over Microsoft Graph | Loses if you live in M365; OKF wins for non-MS shops, avoids per-seat+consumption metering |
| **Atlassian Rovo** | Search + agents in Atlassian | Teamwork Graph, permission-aware, connectors | Loses for Jira/Confluence-heavy orgs; OKF wins off-Atlassian |
| **Notion AI / Q&A** | Workspace + agents | RAG over pages/DBs, workspace perms | OKF ≈ Notion-lite in markdown; OKF wins git portability; Notion wins collab editing/DB views |
| **Box AI** | Content-cloud AI | RAG over Box content | OKF wins for text you author vs docs you store |
| **Dust.tt** | Agent-building + RAG (mid-market) | Connectors → managed retrieval, model-agnostic | Closest commercial analog to a Team OS but hosted; OKF wins cost/portability |
| **Sana AI** | Enterprise assistant | RAG across connected apps | OKF wins small-team cost; Sana wins UX/connectors |
| **Guru** | Verified knowledge + AI | AI answers over **human-verified** cards (verifiers + expiry) | Guru's verification ≈ OKF curation-by-hand; Guru wins non-technical authoring |

**Key gap:** *permission-aware retrieval* is the enterprise moat — results trimmed to what the asking user may see. A DIY OKF has **no per-user ACL** (repo access = see everything). That's the single biggest capability gap and the most common trigger to buy. Pricing tell: "contact sales" (Glean, Sana) = enterprise-only; transparent self-serve (Guru, Dust, Notion) = reachable by small teams. [all pricing VERIFY]

## Google's own stack around OKF
- **Dataplex Universal Catalog** — governs/describes structured *data* assets (poor fit for prose markdown). 
- **Agentspace → Gemini Enterprise** [VERIFY rename/date] — enterprise agent platform: unified search + orchestration + NotebookLM over company data; Google's Glean/Copilot answer (~$21/$30 per-user tiers [VERIFY]).
- **BigQuery data canvas** — analyst-facing NL exploration, not an agent context layer.
- **How OKF plugs in:** markdown-in-Drive is ingestible as documents by Gemini Enterprise; native local-file/Obsidian connector unconfirmed [VERIFY]. Cleaner 2026 path: expose the OKF via an **MCP server** so Gemini, Claude and ChatGPT can all read it, rather than committing to one vendor's pipeline.

## Memory ≠ curated knowledge (the load-bearing distinction)
| Product | What | Architecture |
|---|---|---|
| **Mem0** | Memory-layer SDK | Extracts/consolidates facts from conversations → vector(+graph) |
| **Letta (ex-MemGPT)** | Agent framework w/ tiered memory | Core (in-context, self-edited) vs archival (retrieved) |
| **Zep / Graphiti** | Memory layer | **Temporal (bi-temporal) knowledge graph** — tracks how facts change over time |
| **Cognee** | KG+memory from unstructured | extract-cognify-load → graph+vector |
| **MS GraphRAG** | Technique | LLM entity graph + community summaries; beats flat RAG on global sensemaking |

**The distinction:** *Agent memory* = auto-extracted, evolving, per-user recall (derived, mutable, personalisation). *Curated knowledge* = maintained, human-reviewed org truth (authored, governed, correctness). **Complementary, not substitutes.** A DIY Team OS is *curated knowledge*; for cross-session user recall you still bolt on a memory layer (Mem0/Letta/Zep). Conflating them is the most common architecture mistake — and where **Beads** sits (task memory, not knowledge).

## Build vs buy — the decision
**Build (hand-curate an OKF/Team OS) when:** team < ~30–50, technical, git/markdown-comfortable. Startups pre-Series-B, agencies, solo-CTO shops, portfolios.
- *Wins:* portability / zero lock-in (plain text in git, exportable by definition — enterprise indexes/embeddings are proprietary, often non-exportable; you *rent* retrieval, not own it); ~$0 marginal cost vs $30–50/user/mo; curation quality (signal not drowned in stale docs); agent-neutral via MCP.
- *Loses:* no per-user permissions; no connector breadth (only knows what you write down); maintenance tax (rots when discipline lapses); no governance (audit/SSO/SCIM/residency).

**Buy (enterprise platform) when:** ~100+ seats.
- *Wins:* connectors, permission-aware retrieval at scale, governance, indexes live systems of record.
- *Loses:* cost at scale, lock-in, everything-bucket answers only as good as stale sources, procurement drag.

**What actually forces build→buy (in order):** (1) permission-aware retrieval becomes mandatory — #1 trigger; (2) governance/compliance (SSO/SCIM, SOC2/ISO27001, residency, legal hold); (3) connector-breadth need; (4) scale past ~100. **Buy when you need enforced permissions and live-system reach — not merely when you can afford it.**

**MCP wildcard:** a DIY OKF fronted by a small MCP server is readable by any MCP-capable agent — the same interface the big platforms now expose. MCP lowers the DIY barrier but does **not** close the permissions/governance gap, so the buy triggers stay valid for regulated/large orgs.

## 3 debates a CTO room will want
1. **Does agentic RAG over live systems make hand-curation obsolete?** Everything-buckets return confident answers from stale/contradictory sources; curated+verified knowledge is higher-trust. You need both — curation is where trust lives.
2. **Lock-in — are we renting our organisational memory?** Enterprise indexes/embeddings are proprietary and largely non-exportable; leave the vendor and the *retrieval intelligence* doesn't follow. Markdown-in-git is portable forever. MCP softens but doesn't remove this.
3. **Where's the line between memory and knowledge, and who owns each?** Session memory (Mem0/Letta/Zep/Beads) is derived/mutable; curated knowledge is authored/governed. Conflating them makes agents treat a half-remembered chat as ground truth.

## Verification ledger (confirm before public use)
Glean pricing • M365 Copilot 2026 price + Studio consumption • Rovo inclusion tiers • Notion AI bundling • Agentspace→Gemini Enterprise rename/date/pricing • Dataplex 2026 branding • GraphRAG productisation • Mem0/Letta/Zep funding+tiers • MCP adopters (Glean/MS/Atlassian/Google) • current Gartner/Forrester categorisation. **Note:** "OKF"/"Beads"/"Team OS" are niche/emerging terms, not established industry categories — don't present them as recognised labels.
