---
type: Data Source
title: Aggregation store
description: The system of record for connected accounts, connection attempts and returned transaction data.
resource: postgres://northwind/aggregation
tags: [data-source, connections]
timestamp: 2026-07-03
---

# Aggregation store

**Owner.** [Connections team](/ownership/connections-team.md).

The system of record for [connections](/metrics/connection-success-rate.md): connected accounts, connection attempts, and the raw transaction data pulled from [ASPSPs](/glossary/aspsp.md). Owned by the [Connections team](/ownership/connections-team.md).

**Key tables.** `connections`, `connection_attempts` (drives [CSR](/metrics/connection-success-rate.md)), `transactions_raw` (feeds [categorisation](/glossary/categorisation.md)). Sample extract: [synthetic-data/connection_attempts.csv](../../synthetic-data/connection_attempts.csv).

Consent status lives separately in the [consent store](/data-sources/consent-store.md); a connection is only "live" if its consent is active.
