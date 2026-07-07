---
type: Glossary Term
title: Consent & reauthentication
description: The customer's permission for a TPP to access their data, and the mandatory ~90-day renewal.
tags: [glossary, regulation, consent]
timestamp: 2026-07-03
---

# Consent & reauthentication

A customer grants **consent** for Northwind (as an [AISP](/glossary/aisp.md)) to access their account data. Under PSD2 that consent must be **reauthenticated roughly every 90 days** via [SCA](/glossary/sca.md), or the connection goes stale and data stops flowing.

Reauth is a major operational concern: a lapsed reauth silently breaks the customer's [aggregated view](/data-sources/aggregation-store.md). We track [reauth completion rate](/metrics/reauth-completion-rate.md) and escalate spikes via the [reauth drop-off runbook](/runbooks/reauth-dropoff-spike.md).

Full flow: [consent lifecycle](/processes/consent-lifecycle.md).
