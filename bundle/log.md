---
type: Log
title: Change log
description: Chronological history of changes to the Northwind Money Team OS.
tags: [team-os, log]
timestamp: 2026-07-03
---

# Change log

- **2026-07-03** — Bundle created. Initial concepts across metrics, processes, runbooks, ownership, data sources, glossary. Seeded as a worked, forkable demo of the Team OS pattern.
- **2026-07-07** — Field-test learnings incorporated: Taybridge escalation codename added to the bank-connection-outage runbook (grounding canary); inline metric disclaimers consolidated to index.md.
- **2026-07-10** — Demo matured from wiki to boot sequence: governed metric definition added (definitions/connection-success-rate.yml — numbers resolve, don't retrieve), scoped demo views (scripts/build-demo-views.sh — same kernel, per-role permissions), MCP build-vs-buy trichotomy and 2026 packaging-pattern ammunition added to the briefing.
- **2026-07-10** — Depth pack for hands-on play: known-aspsp-quirks reference (closes the runbook's dangling reference; captures the Connections lead's tacit knowledge), payment_journeys sample + governed definition, reauth definition, and a week of backfilled connection history incl. Northern Rockford's planned-maintenance dip (the discrimination test). Scripted demo numbers untouched.
- **2026-07-11** — Point-don't-copy pattern made explicit: enterprise-client-onboarding now records its canonical source (the kernel registers what's canonical; it doesn't duplicate content).
- **2026-07-11** — Change-governance made visible: screen-scraping retained as a superseded concept (`status: superseded` → `superseded-by`), and the manifest added as the kernel's export contract. Inspired by the emerging OKF-governance ecosystem.
- **2026-07-13** — The second register: `processes/skill-promotion.md` added — skills (the procedure register) get the same governance as concepts (the truth register): shared repo, owner per skill, promotion path (draft → proposed → reviewed → team-canonical → superseded), same patrol. Agents propose; owners promote.
