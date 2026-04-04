extends Node2D

@onready var hole = get_tree().get_first_node_in_group("hole")
@onready var rune_star_ui = get_tree().get_first_node_in_group("rune_star_ui")
@onready var rune_star_area = $Area2D
var e_scene = load("res://scenes/e.tscn")

func _process(_delta: float) -> void:
	if rune_star_area.can_collect_rune_star:
		var e_instance = e_scene.instantiate()
		get_tree().current_scene.add_child(e_instance)
		e_instance.position = self.position + Vector2(0, -70)
		if Input.is_action_just_pressed("e"):
			rune_star_ui.texture = load("res://assets/rune_star.png")
			hole.star_collected = true
			queue_free()
