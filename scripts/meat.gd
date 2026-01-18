extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
@export var item: ItemData
@export var amount := 1

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		if item != null:
			inventory_data.add(item, player.pickaxe_power)
			queue_free()
		else:
			print("Warning: Pickup has no ItemData assigned!")
