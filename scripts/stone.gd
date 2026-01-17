extends Area2D

@onready var stone_ui = get_tree().get_first_node_in_group("stone_ui")

@export var item_name: String = ""
@export var icon: Texture2D
@export var is_stackable: bool = true

@export var item: ItemData
@export var amount := 1

func _ready() -> void:
	add_to_group("items")
	self.body_entered.connect(on_body_entered)

func on_body_entered(body):
	if body.is_in_group("player"):
		inventoryData.add(item, amount)
