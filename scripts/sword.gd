extends Button

@onready var inventory = get_tree().get_first_node_in_group("inventory")
@onready var player = get_tree().get_first_node_in_group("player")

@export var wood_item: ItemData = preload("res://items/wood.tres")
@export var stone_item: ItemData = preload("res://items/stone.tres")
var stone_amount
var wood_amount

func _ready() -> void:
	self.visible = false

func _process(_delta: float) -> void:
	stone_amount = inventory_data.items.get(stone_item, 0)
	wood_amount = inventory_data.items.get(wood_item, 0)
	
	if stone_amount >= 10 and wood_amount >= 10:
		self.visible = true
	else:
		self.visible = false

func _on_pressed() -> void:
	if stone_amount >= 10 and wood_amount >= 10:
		inventory_data.remove(stone_item, 10)
		inventory_data.remove(wood_item, 10)
		player.sword_power = 20
		print("bought")
