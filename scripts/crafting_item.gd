extends Button

var item_id
var recipe

@onready var inventory = get_tree().get_first_node_in_group("inventory")
@onready var player = get_tree().get_first_node_in_group("player")
@export var wood_item: ItemData = preload("res://items/wood.tres")
@export var stone_item: ItemData = preload("res://items/stone.tres")
var stone_amount
var wood_amount

func _process(_delta: float) -> void:
	stone_amount = inventory_data.items.get(stone_item, 0)
	wood_amount = inventory_data.items.get(wood_item, 0)

func setup(id, data):
	item_id = id
	recipe = data
	
	$TextureRect.texture = recipe.icon
	$Label.text = recipe.description

func _pressed() -> void:
	match item_id:
		"sword":
			craft_sword()
		"pickaxe":
			craft_pickaxe()
		"axe":
			craft_axe()
		"campfire":
			craft_campfire()

func craft_sword():
	if stone_amount >= 10 and wood_amount >= 10:
		inventory_data.remove(stone_item, 10)
		inventory_data.remove(wood_item, 10)
		player.sword_power = 20
		
func craft_pickaxe():
	if stone_amount >= 10 and wood_amount >= 10:
		inventory_data.remove(stone_item, 10)
		inventory_data.remove(wood_item, 10)
		player.pickaxe_power = 20
		
func craft_axe():
	if stone_amount >= 10 and wood_amount >= 10:
		inventory_data.remove(stone_item, 10)
		inventory_data.remove(wood_item, 10)
		player.axe_power = 20

func craft_campfire():
	if wood_amount >= 10:
		inventory_data.remove(wood_item, 10)
