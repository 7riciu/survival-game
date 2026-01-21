extends Node2D

var dragging := false
var offset := Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var mouse_pos := get_global_mouse_position()

			var item_rect := Rect2(global_position - Vector2(16, 16), Vector2(32, 32))

			if item_rect.has_point(mouse_pos):
				dragging = true
				offset = global_position - mouse_pos
		else:
			dragging = false

func _process(_delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() + offset
