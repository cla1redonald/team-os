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
| 8–13 | Landscape | Talk | OKF, Beads (Dolt flex), builders-vs-vendors finding. |
| 13–31 | **Live build + the wow** | Demo | The [DEMO.md](DEMO.md) arc incl. canary, driver seam, scoped views. This is the session. |
| 31–37 | Build vs buy | Talk/discussion | Invite the debate — you're armed: packaging pattern, metering lock-in, the MCP trichotomy. |
| 37–42 | Why it matters + your positioning | Talk | Flywheel; diagnostics + Team OS; your own proof points. |
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
- Time overrun → cut in this order: scoped-views beat (Beat 4, say the line over a screenshot), then build-vs-buy talk (31–37, it resurfaces in Q&A anyway); never cut the before/after/canary core.

## What "success" looks like
At least three people ask for the repo link, and one says "I'm doing this with my team." If a CTO argues build-vs-buy with you for five minutes, you've won — they're now thinking in your frame.
