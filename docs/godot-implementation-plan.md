# Tower Drop — Godot Implementation Plan

**Design source of truth:** [`game-design.md`](game-design.md) — mechanics, scope, and feel defer to that doc.

This plan assumes **Godot 4.x** (GDScript). Adjust versions if you standardize on a specific release.

## Phase 0 — Project setup

- Create a Godot 4 project in this repo (e.g. `game/` or project root).
- Configure **display:** base resolution, stretch mode (canvas_items or viewport), and safe area for notched phones.
- Define **input map** actions: `move_left`, `move_right`, `ui_accept` (restart), and touch equivalents bound to the same actions.
- Add folders: `scenes/`, `scripts/`, `assets/`, `autoload/` (if needed).

**Exit criteria:** Empty scene runs on desktop; export presets exist for Windows/macOS/Linux and Android/iOS (placeholders OK).

## Phase 1 — Vertical slice (no polish)

### Player

- **CharacterBody2D** (or RigidBody2D if you want pure physics—CharacterBody2D is easier for tight arcade control).
- Horizontal movement with acceleration and max speed; gravity for fall.
- **Coyote time** and **jump buffer** optional for feel; double jump only when power-up active.
- Collision layers: `player`, `platform`, `hazard`, `collectible`.

### Camera and crush

- **Camera2D** with smooth follow on Y (and slight lag optional).
- Implement **crush zone:** a rising kill boundary (Area2D or Y threshold vs camera top). If player crosses it, game over.
- Match crush speed to design doc: must sync with “tower scroll” feel.

### Chunked tower

- **Scene chunks** (PackedScene rows): platforms, gaps, hazard placeholders.
- **Spawner** at bottom of screen instantiates next chunk, despawns old chunks above crush line to save memory.
- Seed-based RNG optional for daily runs later.

### Minimal UI

- Score (coins), timer, game over overlay with retry.

**Exit criteria:** You can fall forever (within reason), die to crush or spikes, collect coins, restart in one click.

## Phase 2 — Hazards and power-ups

- **Spikes:** Static body or Area2D damage on body entered.
- **Lasers:** AnimationPlayer or Timer + visible beam; damage only when “on.”
- **Collapsing floors:** Timer after step; disable collision or swap to “broken” sprite.
- **Power-ups:** Pickup Area2D → apply buff to autoload **GameState** or player component:
  - Slow motion: `Engine.time_scale` or custom multiplier (watch audio pitch).
  - Double jump: flag on player until timeout or landing.
  - Shield: hit counter on player; ignore next damage event.

**Exit criteria:** All three hazards and all three power-ups work in at least one authored chunk each.

## Phase 3 — Difficulty ramp

- **Run timer** in GameState; every **30 seconds**, increase:
  - crush / scroll speed, and/or
  - hazard density in chunk weights, and/or
  - coin scarcity (optional).
- UI pulse or sound on tier change so players notice.

**Exit criteria:** Difficulty clearly ramps over a 3+ minute run without soft-locking impossible gaps.

## Phase 4 — Feel and readability

- Particles for coins, landings, laser, collapse.
- **SFX** for jump, land, coin, hurt, game over, tier up.
- **Music:** short loop; duck under SFX if needed.
- Screen shake (Camera2D offset) on hit and game over.

**Exit criteria:** Playtesters understand hazard states without reading a manual.

## Phase 5 — Menus and persistence

- Main menu: Play, (optional) Settings, Quit.
- **Save high score** with `ConfigFile` or small JSON in `user://`.
- Settings: volume sliders, fullscreen, touch dead zones if needed.

**Exit criteria:** High score survives app restart; settings persist.

## Phase 6 — Mobile and performance

- **Touch zones:** full-width left/right; avoid UI overlap with HUD.
- **Battery / FPS:** cap particles; pool coins if you spawn hundreds.
- Test on a real mid-range phone.

**Exit criteria:** Stable 60 FPS (or your chosen cap) on target hardware; no accidental touches breaking runs.

## Phase 7 — Export hardening

- **Icons** and splash screens per store guidelines.
- **Unique package name** and versioning scheme.
- **Release build:** export templates installed; remote debug off; logging stripped or gated.
- Legal: **privacy policy** if you add analytics or ads; **credits** for fonts/audio.

**Exit criteria:** Store-ready builds with version codes bumped per submission.

## Recommended Godot nodes (reference)

| System        | Suggested approach                          |
| ------------- | ------------------------------------------- |
| Player        | CharacterBody2D + CollisionShape2D        |
| Platforms     | StaticBody2D or AnimatableBody2D            |
| Crush         | Area2D + CollisionShape2D (top boundary)    |
| Chunks        | Node2D root per chunk; instanced by spawner |
| Global state  | Autoload singleton (score, time, difficulty) |

## Risk list (mitigate early)

- **Crush vs level generation:** If chunks are too sparse at high speed, runs feel unfair—tune minimum platform width and max gap by difficulty tier.
- **Time scale:** Global slow motion affects UI timers unless you use unscaled deltas—decide early.
- **Scope:** Ship one endless mode before boss levels or meta progression.
