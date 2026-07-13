---
type: Process
title: Skill promotion — governing the procedure register
description: How an agent skill goes from someone's home folder to team-canonical, and who owns it at every step.
tags: [process, skills, agents, governance]
timestamp: 2026-07-13
---

# Skill promotion — governing the procedure register

This bundle is Northwind's **truth register** — what things mean, what's decided, who owns what. The team also authors a second register: the **procedure register**, the library of agent skills (`SKILL.md` files) that define how our agents *act*. A rotten concept makes an agent answer wrong; a rotten skill makes it **act** wrong — so skills get the same governance, not less.

**Where skills live.** In a shared git repo (`northwind/agent-skills`), one folder per skill, exactly like code — never on individual laptops. A skill that isn't in the repo doesn't exist as far as the team is concerned.

**The promotion path.**

1. **Draft.** Anyone (including an agent) writes a skill in their own space. It runs for its author only.
2. **Proposed.** Author opens a PR to the skills repo. Agents can propose; agents never merge.
3. **Reviewed.** The owning team checks it does what it declares — scope, tools touched, failure behaviour — the same way [enterprise client onboarding](/processes/enterprise-client-onboarding.md) gates a go-live.
4. **Team-canonical.** Merged with a named **owner** in frontmatter. It now syncs to every team member's agent setup.
5. **Superseded.** Replaced skills are marked and kept as history, like [screen scraping](/glossary/screen-scraping.md) in this register — the chain shows *why* the new way won.

**Patrol.** The same affirm-or-amend patrol that walks this bundle walks the skills repo: dangling references, no owner, stale since last affirmation, declared behaviour drifting from actual behaviour.

**Owner.** [Data & Intelligence](/ownership/data-intelligence-team.md) run the registrar; each skill names its own owning team in the [team map](/ownership/team-map.md).
