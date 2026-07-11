---
type: Data Source
title: Consent store
description: The system of record for customer consents, their status, and reauthentication events.
resource: postgres://northwind/consent
tags: [data-source, consent, compliance]
timestamp: 2026-07-03
---

# Consent store

**Owner.** Product (consent) with [Connections team](/ownership/connections-team.md).

System of record for [consent & reauth](/glossary/consent-and-reauth.md): every consent grant, its expiry, [SCA](/glossary/sca.md) events, and reauth outcomes. Owned by Platform/SRE, used by Product (consent UX) and [Connections](/ownership/connections-team.md).

**Key tables.** `consents`, `reauth_events` (drives [reauth completion rate](/metrics/reauth-completion-rate.md); extract: [synthetic-data/reauth_events.csv](../../synthetic-data/reauth_events.csv)), `payment_journeys` (drives [payment conversion](/metrics/payment-conversion-rate.md)). This is compliance-sensitive: consent is the legal basis for all data access, so retention and audit rules are strict.
