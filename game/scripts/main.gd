extends Control
## Placeholder main scene — Phase 0 exit: project runs on desktop (game-design.md).

func _process(_delta: float) -> void:
	var left := Input.is_action_pressed("move_left")
	var right := Input.is_action_pressed("move_right")
	if left or right:
		%Hint.text = "Steer: " + ("LEFT " if left else "") + ("RIGHT" if right else "")
	else:
		%Hint.text = "Phase 0 — project boots. ←/→ or A/D; touch left/right half."
