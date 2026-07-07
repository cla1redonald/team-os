---
type: Metric
title: Reauth completion rate
description: The percentage of customers who complete the ~90-day reauthentication before their consent lapses.
resource: /data-sources/consent-store.md
tags: [metric, consent, retention]
timestamp: 2026-07-03
---

# Reauth completion rate

**Definition.** Of customers prompted to [reauthenticate](/glossary/consent-and-reauth.md) their consent, the share who complete [SCA](/glossary/sca.md) before the connection lapses.

**Formula.** `completed_reauths / due_reauths` over the reauth window, by client and channel.

**Owner.** Product (consent UX) with [Connections team](/ownership/connections-team.md); source [consent store](/data-sources/consent-store.md).

**Current.** 68% blended — a known weak spot. In-app prompts convert far better (81%) than email-only (44%). Sample: [synthetic-data](../../synthetic-data/reauth_events.csv).

**Why it matters.** Every lapsed reauth silently breaks a customer's [aggregated view](/data-sources/aggregation-store.md) and drags [monthly active connected users](/metrics/monthly-active-connected-users.md). Spikes in drop-off are handled by the [reauth drop-off runbook](/runbooks/reauth-dropoff-spike.md).
