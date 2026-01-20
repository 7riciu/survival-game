extends Node

var dragging: bool = false
var offset: Vector2 = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var mouse_pos = get_viewport().get_global_mouse_position()
				if get_viewport().get_camera_2d():
					mouse_pos = get_viewport().get_camera_2d().get_global_transform().affine_inverse().xform(mouse_pos)
					var item_rect = Rect2(global_position - Vector2(16,16), Vector2(32,32))
					if item_rect.has_point(mouse_pos):
						dragging = true
						offset = global_position - mouse_pos
				else:
					dragging = false
				
func _process(_delta):
	if dragging:
		var mouse_pos = get_viewport().get_mouse_position()
		if get_viewport().get_camera_2d():
			mouse_pos = get_viewport().get_camera_2d().get_global_transform().affine_inverse().xform(mouse_pos)
		global_position = mouse_pos + offset
