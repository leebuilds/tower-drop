# Tower Drop

Fast arcade game: fall down an endless tower, dodge traps, collect coins, and survive the rising crush. Built with **Godot 4**.

## Design (source of truth)

All product intent—loop, controls, hazards, power-ups, difficulty, art bar, platforms, and scope—lives in **[`docs/game-design.md`](docs/game-design.md)**. When implementation or docs disagree, **update the code or the other doc to match `game-design.md`**.

## Docs

| Doc | Purpose |
| --- | --- |
| [`docs/game-design.md`](docs/game-design.md) | **Canonical** gameplay and feel |
| [`docs/godot-implementation-plan.md`](docs/godot-implementation-plan.md) | Phased Godot build plan |
| [`docs/publishing-roadmap.md`](docs/publishing-roadmap.md) | Release and store checklist |

## Repo layout (target)

Godot project files are not committed yet. Planned layout:

- `docs/` — design and planning (see above)
- `game/` *(optional)* — `project.godot`, `scenes/`, `scripts/`, `assets/` per [`docs/godot-implementation-plan.md`](docs/godot-implementation-plan.md) Phase 0

Create the Godot project in the editor (**Project → Project Settings**) in `game/` or the repo root, then open this folder in Godot.

## Requirements

- [Godot 4.x](https://godotengine.org/download) (GDScript)

## License

See [`LICENSE`](LICENSE). Game content and third-party assets may have their own terms when you add them.
