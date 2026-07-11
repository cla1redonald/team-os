---
type: Reference
title: Manifest — the export contract
description: What this kernel contains, what format it's in, and what leaves with you. Ownership stated as a file, because ownership should be.
tags: [manifest, ownership, portability]
timestamp: 2026-07-11
owner: leadership
---

# Manifest — the export contract

**What this is.** The ownership receipt for the Northwind Money Team OS. Everything the company's agents treat as canonical lives in this folder, in the formats below — and all of it leaves with the company, on demand, with `cp -R`.

**Contents.**
- `index.md` / `log.md` — the map and the change journal (OKF reserved files)
- `metrics/ processes/ runbooks/ ownership/ data-sources/ glossary/` — one concept per markdown file, cross-linked
- `definitions/` — governed metric definitions (MetricFlow-syntax YAML; the portable spec, whatever compiles it)
- Superseded concepts are retained with `status: superseded` + `superseded-by:` — history is part of the asset

**Format guarantee.** Plain markdown and YAML. No proprietary index, no vector store, no export negotiation. Any agent — Claude, Gemini, ChatGPT — reads it as-is; any successor system imports it whole.

**Owner.** Leadership own the manifest; each concept names its own owner. If a tool ever holds a version of this knowledge that this folder doesn't, the folder is stale — fix the folder, because the folder is the asset.
