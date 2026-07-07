---
type: Data Source
title: Categorisation model
description: The ML model that assigns spending categories to transactions.
resource: internal://models/categorisation
tags: [data-source, ml, data-intelligence]
timestamp: 2026-07-03
---

# Categorisation model

The model behind [categorisation](/glossary/categorisation.md), owned by the [Data Intelligence team](/ownership/data-intelligence-team.md). Consumes `transactions_raw` from the [aggregation store](/data-sources/aggregation-store.md); outputs a category + confidence per transaction, which then feeds [enrichment](/glossary/enrichment.md).

**Evaluation.** Weekly against a stratified labelled sample — see [categorisation accuracy](/metrics/categorisation-accuracy.md) and [synthetic-data/categorisation_eval.csv](../../synthetic-data/categorisation_eval.csv). Retrained monthly; low-confidence transactions abstain rather than guess.
