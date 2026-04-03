extends Node2D

@onready var rune_heart_area = $Area2D
var e_scene = load("res://scenes/e.tscn")

func _process(_delta: float) -> void:
	if rune_heart_area.can_collect_rune_heart_small:
		var e_instance = e_scene.instantiate()
		get_tree().current_scene.add_child(e_instance)
		e_instance.position = self.position + Vector2(0, -70)
		if Input.is_action_just_pressed("e"):
			queue_free()
