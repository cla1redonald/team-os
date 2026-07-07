---
type: Team
title: Connections team
description: Owns bank/ASPSP integrations and the aggregation store; the front line for connection quality.
tags: [ownership, team, connections]
timestamp: 2026-07-03
---

# Connections team

Owns every [ASPSP](/glossary/aspsp.md) integration, the [aggregation store](/data-sources/aggregation-store.md), and the health of [connection success rate](/metrics/connection-success-rate.md). Runs a 24/7 on-call. First responders for [bank connection outages](/runbooks/bank-connection-outage.md).

**What they know that's hard to write down:** the per-bank quirks — which ASPSPs silently change their APIs, which need specific retry backoffs, which have flaky SCA redirects. Capturing this tacit knowledge as concepts here is exactly the Team OS value: it turns one lead's memory into shared, agent-readable context.
