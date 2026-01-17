extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var stone_scene: PackedScene = preload("res://scenes/stone.tscn")
@onready var rock_area = $Area2D

var stone_stock = 20
var has_stone = true

func _process(_delta: float) -> void:
	if rock_area.can_collect_stone and stone_stock > 0 and Input.is_action_just_pressed("e"):
		stone_stock -= player.pickaxe_power
		var stone = stone_scene.instantiate()
		stone.global_position = self.global_position + Vector2(0, 90)
		get_tree().current_scene.add_child(stone)
	elif stone_stock <= 0:
		has_stone = false
