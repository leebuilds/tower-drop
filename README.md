# Tower Drop

Fast arcade game: fall down an endless tower, dodge traps, collect coins, and survive the rising crush. Built with **Godot 4**.

**Author:** Harrison Lee — [github.com/leebuilds](https://github.com/leebuilds)

## Design (source of truth)

All product intent—loop, controls, hazards, power-ups, difficulty, art bar, platforms, and scope—lives in **[`docs/game-design.md`](docs/game-design.md)**. When implementation or docs disagree, **update the code or the other doc to match `game-design.md`**.

## Docs

| Doc | Purpose |
| --- | --- |
| [`docs/game-design.md`](docs/game-design.md) | **Canonical** gameplay and feel |
| [`docs/godot-implementation-plan.md`](docs/godot-implementation-plan.md) | Phased Godot build plan |
| [`docs/publishing-roadmap.md`](docs/publishing-roadmap.md) | Release and store checklist |

## Run the game (Phase 0)

1. Install [Godot 4.5+](https://godotengine.org/download) (project targets **4.5**).
2. In Godot: **Import** → choose [`game/project.godot`](game/project.godot) (or open the `game` folder as the project root).
3. Press **F5** (main scene: `game/scenes/main.tscn`).

**Controls (see game-design):** `move_left` / `move_right` — arrow keys and **A** / **D**; **touch** left/right half of the screen is wired via autoload `TouchBridge`. `ui_accept` — **Space** / **Enter** (for future restart menus).

**Regenerate input map** (if you edit actions in a fresh clone):

```bash
godot --headless --path game --script res://scripts/bootstrap_phase0.gd
```

**Exports:** [`game/export_presets.cfg`](game/export_presets.cfg) lists Linux, Windows, macOS, Android, and iOS placeholders. Install export templates (**Editor → Manage Export Templates**), then open **Project → Export** to validate signing IDs, icons, and paths before shipping.

## Repo layout

- `docs/` — design and planning
- `game/` — Godot project (`project.godot`, `scenes/`, `scripts/`, `assets/`, `autoload/`)

## License

See [`LICENSE`](LICENSE). Game content and third-party assets may have their own terms when you add them.
