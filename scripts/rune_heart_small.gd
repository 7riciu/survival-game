extends Node2D

@onready var hole = get_tree().get_first_node_in_group("hole")
@onready var rune_heart_small_ui = get_tree().get_first_node_in_group("rune_heart_small_ui")
@onready var rune_heart_small_area = $Area2D
var e_scene = load("res://scenes/e.tscn")
var e_instance = null

func _process(_delta: float) -> void:
	if rune_heart_small_area.can_collect_rune_heart_small:
		if e_instance == null:
			e_instance = e_scene.instantiate()
			get_tree().current_scene.add_child(e_instance)
			e_instance.position = self.position + Vector2(0, -70)
		if Input.is_action_just_pressed("e"):
			rune_heart_small_ui.texture = load("res://assets/rune_small_heart.png")
			hole.heart_small_collected = true
			e_instance.queue_free()
			e_instance = null
			queue_free()
	else:
		if e_instance != null:
			e_instance.queue_free()
