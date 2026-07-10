---
type: Reference
title: Known ASPSP quirks
description: The per-bank oddities that used to live in one person's head — captured so every engineer and agent can triage without paging the Connections lead.
tags: [reference, connections, quirks, on-call]
timestamp: 2026-07-10
---

# Known ASPSP quirks

This file exists because of [runbook step 5](/runbooks/bank-connection-outage.md): *if it's a new quirk, write it up as a concept.* The [Connections team](/ownership/connections-team.md) lead's tacit knowledge, made shared and agent-readable — this is the [team-map's](/ownership/team-map.md) documented single point of failure being mitigated.

**Cortex Building Society — API migration (July 2026).** Migrated their open-banking API; [CSR](/metrics/connection-success-rate.md) dropped 0.95 → ~0.72 from 29 June. Single-ASPSP signature → upstream. Handled per the [outage runbook](/runbooks/bank-connection-outage.md): degraded-mode messaging, **no mass retry**, tracking their status page for the fix.

**Northern Rockford — planned maintenance windows.** Runs platform maintenance on the **third Sunday of each month** (~6h overnight). CSR dips into the 0.6–0.7 range during the window and **self-recovers the same day** (see 21 June in `connection_attempts`). Expected behaviour: **do not page, do not retry-storm.** If a Rockford dip does *not* recover within 24h, treat it as a real incident.

**Haldane Building Soc — flaky SCA redirect on mobile.** Their [SCA](/glossary/sca.md) app hand-off intermittently loses the return redirect on iOS. Effect shows in **[payment conversion](/metrics/payment-conversion-rate.md)** (elevated SCA abandonment, ~79% conversion vs ~90–91.5% elsewhere — see `payment_journeys` sample), **not** in CSR — connections to Haldane succeed fine. Raised with their open-banking team; workaround is the in-app fallback prompt.

**Owner.** [Connections team](/ownership/connections-team.md). Add new quirks here the day you learn them — one paragraph beats one person's memory.
