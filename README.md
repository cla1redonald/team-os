# Team OS — the shared context layer your team's AI runs on

A worked, forkable example of a **Team OS**: the curated, agent-readable knowledge layer that makes a team's AI stop guessing and start knowing. Built as an [OKF](https://github.com/GoogleCloudPlatform/knowledge-catalog) bundle (Google's Open Knowledge Format) for a synthetic open-finance company, **Northwind Money** — modelled closely on the real UK open-banking sector so the example feels like a real team, not a toy.

## The problem

Every team's AI is a **brilliant amnesiac**. It's fluent, fast, and tireless — but it doesn't know *your* metrics, *your* processes, *your* customers, or *your* decisions. So every conversation starts from zero:

- People re-explain the same context in every chat, and each person explains it slightly differently — so the team gets inconsistent answers to the same question.
- Without your context, the AI gives **generic** answers, or worse, **confidently wrong** ones — it will happily invent a plausible definition of your north-star metric.
- The knowledge that would fix this already exists, but it's scattered across wikis, decks, Slack threads, and people's heads — none of it in a form an agent can reliably read.
- The usual fix, "RAG over everything," retrieves from that same mess: stale docs, contradictory versions, confident answers from the wrong source.

Engineers quietly solved this. They keep curated context in version control next to their work — `CLAUDE.md`, `AGENTS.md`, cursor rules — and their agents read it on every task. **Everyone else didn't**, which is a big part of why AI adoption stalls outside engineering. It's not a model problem. It's a **shared-context problem**.

## The fix: a Team OS

A Team OS is the curated, agent-readable knowledge layer a team's AI runs on: what you measure, how you work, what breaks and what to do about it, who owns what, and the language you use — written down once, in plain markdown, version-controlled, and readable by any agent.

This repo uses **OKF** (Google's Open Knowledge Format): a directory of markdown files, one concept per file, cross-linked into a graph. No vector database, no pipeline, no vendor. A subject-matter expert with a text editor can maintain it — and that's the point.

## What's here

```
bundle/            # THE Team OS — an OKF bundle (25 cross-linked concepts)
  index.md         #   OKF reserved: progressive-disclosure map
  log.md           #   OKF reserved: change history
  metrics/         #   what we measure (CSR, categorisation accuracy, reauth, …)
  processes/       #   how we work (consent lifecycle, client onboarding)
  runbooks/        #   when things break (bank outage, reauth drop-off)
  ownership/       #   who owns what (team map, teams)
  data-sources/    #   systems of record
  glossary/        #   the language (AISP, PISP, SCA, consent/reauth, …)
synthetic-data/    # fake datasets the metrics reference (drive the live demo)
docs/
  EXPERT-BRIEFING.md   # the master synthesis — read this first
  DEMO.md              # the live demo script (before/after/portability)
  SCENARIOS.md         # graded hands-on scenarios + audience participation
  FACILITATION.md      # how to run a 45-min session on this material
  LEARN.md             # learning path to present & defend it cold
  research/            # 4 sourced research briefs (formats, non-eng, vendors, beads)
  _source-substacks/   # the author's published Substack articles (voice/reference)
```

## Try the demo in 60 seconds

Point any agent at this repo:

> "Read `bundle/` and `synthetic-data/`. Northwind's connection success rate dropped this week — what's going on and what should we do?"

Without the bundle, you get a generic answer. With it, a grounded agent will spot the **Cortex Building Society** dip, apply the **bank-outage runbook's "is it us or them?"** logic, and recommend the right action — because it now shares the team's context. Then open any bundle file in a plain text editor, add a fact, and ask again: the agent knows it instantly. No engineer, no deployment, no vector database. Full script: [`docs/DEMO.md`](docs/DEMO.md).

## Fork it for your team

1. Copy `bundle/`.
2. Replace Northwind's concepts with your own — start with 5: your north-star metric, one process, one runbook, your ownership map, five glossary terms.
3. Point your agents at the folder (directly, or serve it over MCP).
4. Keep it current — a weekly sweep beats a perfect one-off.

## Going deeper

- **The argument in full** — [`docs/EXPERT-BRIEFING.md`](docs/EXPERT-BRIEFING.md): the four-layer mental model (instructions / knowledge / memory / tools), where OKF fits, build-vs-buy, and the Q&A defence.
- **The evidence** — [`docs/research/`](docs/research/): sourced briefs on knowledge formats, non-engineering practitioners building this pattern, the vendor landscape, and Beads (the memory layer).
- **Running it as a session** — [`docs/FACILITATION.md`](docs/FACILITATION.md) and [`docs/SCENARIOS.md`](docs/SCENARIOS.md).

*Northwind Money is synthetic; all numbers are illustrative.*

## License

[MIT](LICENSE) — fork it, adapt it, ship it.
