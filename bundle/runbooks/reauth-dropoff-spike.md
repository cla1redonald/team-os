---
type: Runbook
title: Reauth drop-off spike
description: What to do when reauth completion rate falls and connections start lapsing.
tags: [runbook, consent, on-call]
timestamp: 2026-07-03
---

# Runbook: reauth drop-off spike

**Trigger.** [Reauth completion rate](/metrics/reauth-completion-rate.md) falls >8 points week-on-week, or a client reports users "losing" their accounts.

**Steps.**
1. Segment by **channel** in `reauth_events` ([consent store](/data-sources/consent-store.md)): in-app vs email. Email-only reauth converts far worse (~44% vs ~81%) — a shift in channel mix alone can cause a "spike".
2. Segment by [ASPSP](/glossary/aspsp.md): a broken [SCA](/glossary/sca.md) redirect at one bank shows up as reauth drop-off, not a [connection](/metrics/connection-success-rate.md) failure.
3. If channel mix: work with the client to move prompts in-app.
4. If ASPSP SCA: same handling as a [bank connection outage](/runbooks/bank-connection-outage.md) — likely upstream.
5. Watch [MACU](/metrics/monthly-active-connected-users.md) for downstream churn.

**Owner.** Product (Consent) with [Connections team](/ownership/connections-team.md).
