extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var wood_scene: PackedScene = preload("res://scenes/wood.tscn")
@onready var tree_area = $Area2D

var tree_health = 100

func _process(_delta: float) -> void:
	if tree_area.can_hit and tree_health > 0 and Input.is_action_just_pressed("e"):
		tree_health -= player.axe_power
	elif tree_health <= 0:
		var wood = wood_scene.instantiate()
		wood.global_position = self.global_position + Vector2(0, 10)
		get_tree().current_scene.add_child(wood)
		queue_free()
