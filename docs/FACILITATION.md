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
| 0–3 | The brilliant amnesiac (problem) | Talk | Open cold, no throat-clearing. One story. |
| 3–7 | Four layers (model) | Whiteboard/slide | Draw it live; land the *knowledge-layer gap*. |
| 7–13 | Landscape | Talk | OKF (3 wks), Beads (Dolt flex), builders-vs-vendors finding. |
| 13–28 | **Live build + the wow** | Demo | The [DEMO.md](DEMO.md) arc. This is the session. |
| 28–34 | Build vs buy | Talk/discussion | Invite the debate — this room *will* engage. |
| 34–42 | Why it matters + your positioning | Talk | Flywheel; diagnostics + Team OS; your own proof points. |
| 42–45 | Close + the Monday challenge | Talk | The one-liner; hand out the repo link. |

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
- Time overrun → the cuttable segment is build-vs-buy (28–34); never cut the live demo.

## What "success" looks like
At least three people ask for the repo link, and one says "I'm doing this with my team." If a CTO argues build-vs-buy with you for five minutes, you've won — they're now thinking in your frame.
