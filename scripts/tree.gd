extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var wood_ui = get_tree().get_first_node_in_group("wood_ui")
@onready var hitable = $Area2D
@onready var tree_health = 100

func _process(_delta: float) -> void:
	if hitable.can_hit and tree_health > 0 and Input.is_action_just_pressed("click"):
		tree_health -= player.axe_power
	elif tree_health <= 0:
		wood_ui.tree_wood_count()
		queue_free()
