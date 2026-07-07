---
type: Metric
title: Monthly active connected users (MACU)
description: Customers with at least one live, non-lapsed account connection returning data in the last 30 days.
resource: /data-sources/aggregation-store.md
tags: [metric, engagement, north-star]
timestamp: 2026-07-03
---

# Monthly active connected users (MACU)

**Definition.** Distinct end-customers with ≥1 live [connection](/metrics/connection-success-rate.md) (not lapsed on [reauth](/glossary/consent-and-reauth.md)) that returned data in the last 30 days.

**Formula.** `distinct(customer_id WHERE last_data_at > now-30d AND consent_status='active')`.

**Owner.** [Data Intelligence team](/ownership/data-intelligence-team.md) reports it; every team affects it.

**Current.** 1.42M, +3% MoM. The Mercer-style white-label deployments drive most growth; churn is dominated by lapsed [reauth](/metrics/reauth-completion-rate.md), not opt-out.

**Why it matters.** MACU is the business's compounding asset and what most client contracts bill against. It's downstream of *both* [connection success](/metrics/connection-success-rate.md) and [reauth completion](/metrics/reauth-completion-rate.md) — which is why those two operational metrics get board attention.
