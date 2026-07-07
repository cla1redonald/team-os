---
type: Ownership Map
title: Team map — who owns what
description: The teams at Northwind Money and the concepts, metrics and systems each owns.
tags: [ownership, org]
timestamp: 2026-07-03
---

# Team map

| Team | Owns | Key metric | On-call |
|---|---|---|---|
| [Connections](/ownership/connections-team.md) | ASPSP integrations, [aggregation store](/data-sources/aggregation-store.md) | [Connection success rate](/metrics/connection-success-rate.md) | Yes (24/7) |
| [Data Intelligence](/ownership/data-intelligence-team.md) | [Categorisation](/glossary/categorisation.md) & [enrichment](/glossary/enrichment.md), the [model](/data-sources/categorisation-model.md) | [Categorisation accuracy](/metrics/categorisation-accuracy.md) | Business hours |
| Payments | [PISP](/glossary/pisp.md) flows | [Payment conversion](/metrics/payment-conversion-rate.md) | Yes |
| Product (Consent) | Consent UX, [reauth](/glossary/consent-and-reauth.md) | [Reauth completion](/metrics/reauth-completion-rate.md) | No |
| Platform / SRE | API gateway, uptime, [consent store](/data-sources/consent-store.md) | API uptime | Yes (24/7) |
| Client Success | Activation, share-of-wallet | Client activation | No |

**Key-person note.** Deep ASPSP-quirk knowledge is concentrated in the [Connections team](/ownership/connections-team.md) lead — a documented single point of failure the [runbooks](/runbooks/bank-connection-outage.md) are meant to mitigate.
