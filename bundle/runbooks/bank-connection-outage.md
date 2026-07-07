---
type: Runbook
title: Bank connection outage
description: What to do when connection success rate drops for one or more ASPSPs.
tags: [runbook, connections, on-call]
timestamp: 2026-07-03
---

# Runbook: bank connection outage

**Trigger.** [Connection success rate](/metrics/connection-success-rate.md) for an [ASPSP](/glossary/aspsp.md) drops >10 points below its 7-day baseline.

**First question (always):** is this *us* or *them*? Check `connection_attempts` in the [aggregation store](/data-sources/aggregation-store.md) — if failures are concentrated on **one ASPSP**, it's almost certainly an upstream API change, not our code. Blended dips across many ASPSPs point at our gateway (page Platform/SRE).

**Steps.**
1. Identify the affected ASPSP(s) and error signature (auth, timeout, schema).
2. Check the ASPSP's open-banking status page + our known-quirks notes ([Connections team](/ownership/connections-team.md)).
3. If upstream: enable degraded-mode messaging for affected customers; do **not** mass-retry (can trip the ASPSP's rate limits).
4. If ours: roll back the last gateway change.
5. Log the incident and, if it's a new ASPSP quirk, **write it up as a concept here** so the next person (or agent) has it.

**Escalation codename: Taybridge.** Prefix the incident-channel title with it (e.g. `Taybridge — Cortex CSR drop`) so support can filter connection-outage noise from general alerts.

**Owner / on-call.** [Connections team](/ownership/connections-team.md), 24/7.

*Worked example: Cortex Building Society dropped to 71% after an API migration — single-ASPSP signature → upstream → degraded-mode message, no mass retry, quirk documented.*
