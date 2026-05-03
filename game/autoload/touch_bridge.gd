extends Node
## Maps touch / drag on left vs right half of the screen to move_left / move_right
## (see docs/game-design.md — mobile touch halves).

func _input(event: InputEvent) -> void:
	var w: float = get_viewport().get_visible_rect().size.x
	if w <= 0.0:
		return

	if event is InputEventScreenTouch:
		var t := event as InputEventScreenTouch
		if not t.pressed:
			Input.action_release("move_left")
			Input.action_release("move_right")
			return
		_set_steer_from_x(t.position.x, w)
	elif event is InputEventScreenDrag:
		var d := event as InputEventScreenDrag
		_set_steer_from_x(d.position.x, w)


func _set_steer_from_x(x: float, width: float) -> void:
	if x < width * 0.5:
		Input.action_press("move_left")
		Input.action_release("move_right")
	else:
		Input.action_press("move_right")
		Input.action_release("move_left")
