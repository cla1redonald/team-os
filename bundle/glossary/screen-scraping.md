---
type: Glossary Term
title: Screen scraping
description: The pre-open-banking method of reading customer accounts by logging in with their credentials. Superseded — kept as history so agents can answer "what was true when."
tags: [glossary, history, superseded]
timestamp: 2026-07-11
status: superseded
superseded-by: /glossary/open-finance.md
owner: connections-team
---

# Screen scraping *(superseded)*

The old way: customers handed over their bank credentials and Northwind's predecessors logged in *as them* to read accounts. Fragile (breaks when the bank changes its UI), risky (credential sharing), and regulatorily doomed.

**Superseded by [open finance](/glossary/open-finance.md)** — consented, API-based access under Open Banking (2018 onwards). Northwind has never screen-scraped; connections run exclusively through [ASPSP](/glossary/aspsp.md) APIs with [SCA](/glossary/sca.md).

**Why this file still exists.** Definitions don't get deleted; they get *superseded* — the `status` and `superseded-by` fields above are the change-governance chain. An agent asked "did we ever screen-scrape?" answers from history instead of guessing, and an agent that finds an old document praising scraping knows it's reading a superseded era.
