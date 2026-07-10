---
type: Metric
title: Connection success rate (CSR)
description: The percentage of attempted bank/ASPSP connections that successfully return account data.
resource: /data-sources/aggregation-store.md
tags: [metric, connections, north-star]
timestamp: 2026-07-03
---

# Connection success rate (CSR)

**Definition.** Of all attempts to connect a customer's account at an [ASPSP](/glossary/aspsp.md), the share that complete and return data within 60s.

**Formula.** Resolved through the governed definition at [`/definitions/connection-success-rate.yml`](../definitions/connection-success-rate.yml) — `successful_connections / attempted_connections`, rolling 7 days, sliced by ASPSP. Agents should resolve this metric **by name** via the definition (in production: the semantic layer over MCP), not recompute it from raw data; the CSV sample exists so the demo runs without a warehouse.

**Owner.** [Connections team](/ownership/connections-team.md).

**Current.** 94.2% blended. Worst slice: *Cortex Building Society* at 71% after their API migration — see [bank connection outage](/runbooks/bank-connection-outage.md). Data: [aggregation store](/data-sources/aggregation-store.md), table `connection_attempts` (sample in [synthetic-data](../../synthetic-data/connection_attempts.csv)).

**Why it matters.** CSR is the closest thing Northwind has to a north-star for the [AISP](/glossary/aisp.md) business: every failed connection is a customer who can't see their money and a client who sees our product as broken. A CSR dip is almost always an upstream ASPSP change, not our code — that distinction is the first thing an on-call engineer must establish.

Related: [Reauth completion rate](/metrics/reauth-completion-rate.md) · [Monthly active connected users](/metrics/monthly-active-connected-users.md)
