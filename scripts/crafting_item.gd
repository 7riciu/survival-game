extends Button

var item_id
var recipe

@onready var inventory = get_tree().get_first_node_in_group("inventory")
@onready var player = get_tree().get_first_node_in_group("player")
@export var berry_item: ItemData = preload("res://items/berry.tres")
@export var wood_item: ItemData = preload("res://items/wood.tres")
@export var stone_item: ItemData = preload("res://items/stone.tres")
@export var dragonfly_item: ItemData = preload("res://items/dragonfly.tres")
var berry_amount
var stone_amount
var wood_amount
var dragonfly_amount

func _process(_delta: float) -> void:
	berry_amount = inventory_data.items.get(berry_item, 0)
	stone_amount = inventory_data.items.get(stone_item, 0)
	wood_amount = inventory_data.items.get(wood_item, 0)
	dragonfly_amount = inventory_data.items.get(dragonfly_item, 0)

func setup(id, data):
	item_id = id
	recipe = data
	
	$TextureRect.texture = recipe.icon
	$Label.text = recipe.description

func _pressed() -> void:
	match item_id:
		"life_elexir":
			craft_life_elexir()
		"sword":
			craft_sword()
		"pickaxe":
			craft_pickaxe()
		"axe":
			craft_axe()
		"campfire":
			craft_campfire()
		"dragonfly_spade":
			craft_dragonfly_spade()

func craft_life_elexir():
	var item = preload("res://items/life_elexir.tres")
	if berry_amount >= 10:
		inventory_data.remove(berry_item, 10)
		inventory_data.add(item, 1)

func craft_sword():
	var item = preload("res://items/sword.tres")
	if stone_amount >= 10 and wood_amount >= 10:
		inventory_data.remove(stone_item, 10)
		inventory_data.remove(wood_item, 10)
		inventory_data.add(item, 1)
		
func craft_pickaxe():
	var item = preload("res://items/pickaxe.tres")
	if stone_amount >= 10 and wood_amount >= 10:
		inventory_data.remove(stone_item, 10)
		inventory_data.remove(wood_item, 10)
		inventory_data.add(item, 1)
		
func craft_axe():
	var item = preload("res://items/axe.tres")
	if stone_amount >= 10 and wood_amount >= 10:
		inventory_data.remove(stone_item, 10)
		inventory_data.remove(wood_item, 10)
		inventory_data.add(item, 1)

func craft_campfire():
	if wood_amount >= 10:
		inventory_data.remove(wood_item, 10)
		var placer = get_tree().get_first_node_in_group("placement_manager")
		var campfire_scene = load("res://scenes/campfire.tscn")
		var spawn_pos = Vector2(400, 200)
		placer.start_placing(campfire_scene, spawn_pos)

func craft_dragonfly_spade():
	var item = preload("res://items/axe.tres")
	if dragonfly_amount >= 100 and wood_amount >= 10:
		inventory_data.remove(dragonfly_item, 100)
		inventory_data.remove(wood_item, 10)
		inventory_data.add(item, 1)
