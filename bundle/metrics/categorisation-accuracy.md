---
type: Metric
title: Categorisation accuracy
description: The percentage of transactions assigned the correct spending category, measured against a labelled sample.
resource: /data-sources/categorisation-model.md
tags: [metric, data-intelligence, ml]
timestamp: 2026-07-03
---

# Categorisation accuracy

**Definition.** Share of transactions whose [categorisation](/glossary/categorisation.md) matches a human-labelled ground-truth sample.

**Formula.** `correct_labels / sampled_labels`, weekly, on a 5,000-transaction stratified sample. Reported overall and by category.

**Owner.** [Data Intelligence team](/ownership/data-intelligence-team.md); model at [categorisation model](/data-sources/categorisation-model.md).

**Current.** 91.8% overall. Weakest categories: *utilities* (84%) and *transfers* (79%, often confused with income). Sample: [synthetic-data](../../synthetic-data/categorisation_eval.csv).

**Why it matters.** It's the input to every [enrichment](/glossary/enrichment.md) feature and the most common client data-quality complaint. Accuracy figures are **company-reported against our own labelled sample**, not independently audited — state that plainly to clients.

Related: [Enrichment](/glossary/enrichment.md)
