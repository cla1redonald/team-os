---
type: Metric
title: Payment conversion rate
description: The percentage of initiated open-banking payments that complete successfully.
resource: /data-sources/consent-store.md
tags: [metric, payments]
timestamp: 2026-07-03
---

# Payment conversion rate

**Definition.** Of [PISP](/glossary/pisp.md) payment journeys started, the share that reach settled status.

**Formula.** `settled_payments / initiated_payments`, by ASPSP and payment type.

**Owner.** Payments team.

**Current.** 87.5% blended. Main drop-off is [SCA](/glossary/sca.md) abandonment at the bank's app hand-off, worst on a few [ASPSPs](/glossary/aspsp.md) with clunky redirects — see [known ASPSP quirks](/runbooks/known-aspsp-quirks.md). Governed definition: [`/definitions/payment-conversion-rate.yml`](../definitions/payment-conversion-rate.yml). Sample: [synthetic-data](../../synthetic-data/payment_journeys.csv).

**Why it matters.** Payments is the newer, higher-margin line; conversion is the headline number clients benchmark against card rails. The bottleneck is usually the ASPSP's SCA UX, which we don't control — so improvements come from smart ASPSP selection and retry logic, not our checkout.
