---
type: Glossary Term
title: ASPSP & TPP (the two sides of open banking)
description: ASPSP = the bank/account provider holding the account; TPP = the third party (like Northwind) accessing it with consent.
tags: [glossary, regulation, roles]
timestamp: 2026-07-03
---

# ASPSP & TPP

- **ASPSP — Account Servicing Payment Service Provider:** the institution that holds the customer's account (a bank, building society, pension or investment provider). ASPSPs expose the APIs that [AISPs](/glossary/aisp.md) and [PISPs](/glossary/pisp.md) connect to.
- **TPP — Third Party Provider:** the regulated party accessing the account on the customer's behalf. **Northwind is a TPP** (both an AISP and a PISP).

ASPSP API quality directly drives our [connection success rate](/metrics/connection-success-rate.md); when an ASPSP's API degrades, see [bank connection outage](/runbooks/bank-connection-outage.md).
