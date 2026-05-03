extends SceneTree
## Regenerates input actions in project.godot (Phase 0). Matches docs/game-design.md (arrows + A/D; ui_accept for restart).
## Run: godot --headless --path game --script res://scripts/bootstrap_phase0.gd

func _init() -> void:
	call_deferred("_bootstrap")


func _bootstrap() -> void:
	_set_action("move_left", 0.2, _keys([KEY_LEFT, KEY_A]))
	_set_action("move_right", 0.2, _keys([KEY_RIGHT, KEY_D]))
	_set_action("ui_accept", 0.2, _keys([KEY_SPACE, KEY_ENTER]))
	ProjectSettings.save()
	print("bootstrap_phase0: input actions saved.")
	quit(0)


func _keys(codes: Array) -> Array:
	var out: Array = []
	for c in codes:
		var e := InputEventKey.new()
		e.physical_keycode = c as int
		out.append(e)
	return out


func _set_action(action: String, deadzone: float, events: Array) -> void:
	ProjectSettings.set_setting("input/%s" % action, {"deadzone": deadzone, "events": events})
