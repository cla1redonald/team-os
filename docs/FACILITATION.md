---
type: Runbook
title: Facilitation guide — 45-minute session
description: How to run the session: timings, materials, room management, and fallbacks.
tags: [facilitation, presenting]
timestamp: 2026-07-03
---

# Facilitation guide — 45-minute session

**Audience:** senior technology leaders (CTOs, VPs of Engineering). Technical, senior, sceptical, seen-it-all. They reward *new* and punish *hype*. **Goal:** wow the room and leave them able to build a Team OS themselves.

## Run of show (45 min)
| Time | Segment | Mode | Notes |
|---|---|---|---|
| 0–3 | **Act 1 · The problem** | Talk | The amnesiac. "AI is still the DOS era — everyone hand-loads the printer drivers." |
| 3–9 | **Act 2 · What's out there** | Talk | Landscape (OKF), whitespace (layers exist, uncomposed), the 2026 packaging pattern. Vendors sell drivers; the kernel can't be bought — it has to be authored. |
| 9–16 | **Act 3 · The proposal** | Whiteboard/slides | Four layers (anatomy) → boot sequence (order) → kernel & drivers (the thesis): own the kernel, rent the drivers, attach in boot order. |
| 16–18 | **Act 4 · Today's focus** | Slide | One-box bounding, then the five-step "how it works" summary — which doubles as the full fallback if the live demo can't run. |
| 18–28 | **Act 4 · The demo** | Demo | [DEMO.md](DEMO.md) Beats 1–2 + canary tight; narrate the seams; baseline + break-then-catch patrol; command centre payoff. Optional Beat 7b (the Scribe drafts the fix, ~2 min, needs API key + empty proposals dir) only if the block is running ahead — it eats hands-on time, never the argument. |
| 28–35 | **Act 5 · What this means for you** | Slides, fast | Staircase (where your people are) → option space (which failure you have) → the traps → MCP trichotomy → sector wedges → two registers (skills get the same governance — see `bundle/processes/skill-promotion.md`) → dogfood receipts (the presenter's own estate, patrolled — and mined: 14 drafted proposals, 13 elected, 10 amended before signing; if challenged on the amendment rate: amend ≠ reject — the drafts stood, the judge changed words not truths) → why it matters. ~1 min each. |
| 35–42 | **Hands-on** | Participation | "Your turn" slide up: fork race → canary → S8. Overruns eat this block, never the argument. |
| 42–45 | Close | Talk | The one-liner — said to a room already doing it. |

## Materials
- The `team-os` repo (share the URL / let them fork).
- Terminal + agent pre-warmed; **screenshots of each demo beat as fallback**.
- One slide per demo question so the room can follow the agent's reasoning.
- Optional: print the four-layer model as a one-pager handout.

## Room management
- **Pre-empt the sceptics** (§9 of [EXPERT-BRIEFING.md](EXPERT-BRIEFING.md)) *before* they raise it — "you're probably thinking, isn't this just a wiki?" Owning the objection buys credibility.
- **Invite the build-vs-buy debate** rather than defending — this is a room that wants to argue Glean vs DIY. Let them; you steer.
- If a demo beat fails live, cut to the screenshot and keep talking — never debug on stage.

## Fallbacks
- No wifi → run the agent fully local (bundle is offline markdown) or use screenshots.
- Agent gives a weak grounded answer → you have the CSV open; narrate the diagnosis yourself. The *bundle* is the star, not the model.
- Time overrun → the hands-on block (35–42) flexes first — it degrades gracefully (drop S8, keep the fork race). Then build-vs-buy talk (it resurfaces in Q&A anyway). Never cut the before/after/canary core.

## What "success" looks like
At least three people ask for the repo link, and one says "I'm doing this with my team." If a CTO argues build-vs-buy with you for five minutes, you've won — they're now thinking in your frame.
