# Tower Drop — Game Design

This file is the **single source of truth** for gameplay, scope, and feel. Other docs in `docs/` defer here when anything conflicts.

## Elevator pitch

**Tower Drop** is a fast arcade game where the player falls down an endless tower while avoiding traps. Move left or right to land on safe platforms, dodge hazards, collect coins, and survive as long as possible while the tower scrolls upward—forcing you to keep descending or get crushed.

## Core loop

1. Fall and steer horizontally onto safe ground.
2. Read upcoming platforms and hazards at speed.
3. Collect coins and grab power-ups when safe.
4. Survive until the next difficulty tick; chase the high score.

## Controls

- **PC:** Arrow keys (or A/D) for left/right.
- **Mobile:** Touch left / touch right halves of the screen (or on-screen buttons—decide in implementation).

Keep input latency low; one-tap responsiveness matters for arcade feel.

## World rules

- **Endless tower:** Procedural or chunked vertical layout that extends downward indefinitely.
- **Camera / scroll:** The tower scrolls **upward** (or the camera follows the player with a crush zone at the top). The player must **keep descending** faster than the rising “death line” or lose the run.
- **Difficulty:** Every **30 seconds**, global speed (scroll rate, hazard timing, or spawn density) **increases** in a predictable step so players can learn the rhythm.

## Hazards

| Hazard            | Behavior (design intent)                          |
| ----------------- | ------------------------------------------------- |
| **Spikes**        | Instant damage or one-hit kill on contact.        |
| **Lasers**        | Timed on/off or sweeping beams; telegraph clearly. |
| **Collapsing floors** | Stand briefly, then break; player must keep moving. |

Add clear **telegraphs** (color, animation, sound) before lethal states where possible.

## Collectibles & scoring

- **Coins:** Primary score source; optional combo or streak bonus later.
- **High score:** Local first; cloud leaderboards optional for a publishable build.

## Power-ups

| Power-up       | Effect                                      |
| -------------- | ------------------------------------------- |
| **Slow motion** | Temporarily reduces scroll / game speed.   |
| **Double jump** | One mid-air extra jump until used or timed out. |
| **Shield**     | Absorbs one hit or one lethal contact.      |

Duration, stacking rules, and UI feedback (icon + timer) should be defined in implementation.

## Visual style

- **Simple geometry:** Colored blocks, circles, basic particles.
- **Readable contrast:** Hazards vs safe platforms must be obvious at a glance.
- **Juice:** Screen shake, brief freeze on big events, coin pop—lightweight, not noisy.

## Platforms

- **Primary targets:** Mobile and PC from one Godot project (responsive UI, touch + keyboard).

## Success criteria

- **Easy to learn** in one run; deaths feel fair.
- **Addictive** short sessions (1–3 minutes) with “one more try” clarity.
- **Publishable** scope: single mode is enough for v1; expand after ship.

## Note

This should be a free game, just for experience.