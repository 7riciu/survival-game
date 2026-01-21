extends Area2D

var can_drag = false

func _on_mouse_entered() -> void:
	can_drag = true

func _on_mouse_exited() -> void:
	can_drag = false
