---
type: Process
title: Consent lifecycle
description: End-to-end flow of a customer consent from grant through reauth to expiry.
tags: [process, consent, compliance]
timestamp: 2026-07-03
---

# Consent lifecycle

1. **Grant.** Customer authorises Northwind (as [AISP](/glossary/aisp.md)/[PISP](/glossary/pisp.md)) via [SCA](/glossary/sca.md) at their [ASPSP](/glossary/aspsp.md). Recorded in the [consent store](/data-sources/consent-store.md).
2. **Active.** Data flows into the [aggregation store](/data-sources/aggregation-store.md); the customer counts toward [MACU](/metrics/monthly-active-connected-users.md).
3. **Reauth due (~90 days).** Customer prompted to [reauthenticate](/glossary/consent-and-reauth.md). Tracked by [reauth completion rate](/metrics/reauth-completion-rate.md).
4. **Lapse or renew.** Renew → back to Active. Miss the window → connection lapses, data stops, [CSR](/metrics/connection-success-rate.md) unaffected but MACU drops.

**Owner.** Product (Consent) with [Connections](/ownership/connections-team.md). A spike in step-3 drop-off triggers the [reauth drop-off runbook](/runbooks/reauth-dropoff-spike.md).
