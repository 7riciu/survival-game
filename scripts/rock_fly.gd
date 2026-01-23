extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var dragonfly_scene: PackedScene = preload("res://scenes/dragonfly.tscn")
@onready var rock_fly_area = $Area2D

var dragonfly_stock = 3
var has_dragonfly = true

func _process(_delta: float) -> void:
	if rock_fly_area.can_collect_dragonfly and dragonfly_stock > 0 and Input.is_action_just_pressed("e"):
		dragonfly_stock -= 1
		var dragonfly = dragonfly_scene.instantiate()
		dragonfly.global_position = self.global_position + Vector2(0, 200)
		get_tree().current_scene.add_child(dragonfly)
	elif dragonfly_stock <= 0:
		has_dragonfly = false
