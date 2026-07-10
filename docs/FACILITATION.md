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
| 0–3 | The brilliant amnesiac (problem) | Talk | Open cold, no throat-clearing. "AI is still the DOS era — everyone hand-loads the printer drivers." |
| 3–8 | Four layers + boot sequence (model) | Whiteboard/slide | Anatomy (four layers), then order of adoption (kernel → syscalls → permissions → indexer → journal → userland). |
| 8–12 | Landscape | Talk | OKF, Beads (Dolt flex), builders-vs-vendors finding. |
| 12–20 | **The core demo — proof, tight** | Demo | Before/after + the canary ([DEMO.md](DEMO.md) Beats 1–2). Narrate the seams (numbers, scoped views, portability) over the proof-beats slide rather than demoing them — the deep beats are for the hands-on block. |
| 20–27 | The map + the thesis | Slides | Command centre payoff, adoption staircase, option space, kernel & drivers, whitespace. |
| 27–33 | Build vs buy | Talk/discussion | Invite the debate — you're armed: packaging pattern, metering lock-in, the MCP trichotomy. |
| 33–42 | **Hands-on — the room plays** | Participation | "Your turn" slide up: everyone forks; fork race → canary → S8 ("draft my first 3 concepts"). See [SCENARIOS.md](SCENARIOS.md) formats. Overruns eat this block, never the argument. |
| 42–45 | Close + the Monday challenge | Talk | The one-liner — said to a room that's already doing it. |

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
- Time overrun → the hands-on block (33–42) flexes first — it degrades gracefully (drop S8, keep the fork race). Then build-vs-buy talk (it resurfaces in Q&A anyway). Never cut the before/after/canary core.

## What "success" looks like
At least three people ask for the repo link, and one says "I'm doing this with my team." If a CTO argues build-vs-buy with you for five minutes, you've won — they're now thinking in your frame.
