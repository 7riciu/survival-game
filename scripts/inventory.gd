extends Control
class_name Inventory

var rows: int = 1
var cols: int = 10

@onready var inventory_grid: GridContainer = $GridContainer
var inventory_slot_scene: PackedScene = preload("res://scenes/inventory_slot.tscn")
var slots: Array = []

@export var berry_item: ItemData = preload("res://items/berry.tres")
@onready var hunger_bar = get_tree().get_first_node_in_group("hunger_bar")
@onready var player = get_tree().get_first_node_in_group("player")

@onready var player_hand =  get_tree().get_first_node_in_group("player_hand")
@onready var held_item = null

func _ready() -> void:
	inventory_grid.columns = cols

	for i in range(rows * cols):
		var slot = inventory_slot_scene.instantiate()
		slots.append(slot)
		inventory_grid.add_child(slot)

	inventory_data.changed.connect(refresh)
	
	refresh()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("slot 1"):
		select(slots[0].item)
	if Input.is_action_just_pressed("slot 2"):
		select(slots[1].item)
	if Input.is_action_just_pressed("slot 3"):
		select(slots[2].item)
	if Input.is_action_just_pressed("slot 4"):
		select(slots[3].item)
	if Input.is_action_just_pressed("slot 5"):
		select(slots[4].item)
	if Input.is_action_just_pressed("slot 6"):
		select(slots[5].item)
	if Input.is_action_just_pressed("slot 7"):
		select(slots[6].item)
	if Input.is_action_just_pressed("slot 8"):
		select(slots[7].item)
	if Input.is_action_just_pressed("slot 9"):
		select(slots[8].item)
	if Input.is_action_just_pressed("slot 10"):
		select(slots[9].item)

func refresh():
	var inv_item_scene = preload("res://scenes/inventory_item.tscn")
	
	for slot in slots:
		if slot.item:
			slot.item.queue_free()
			slot.item = null
	
	var index = 0

	for item_data in inventory_data.items.keys():
		if index >= slots.size():
			break

		var inv_item: InventoryItem = inv_item_scene.instantiate()
		inv_item.set_from_item_data(item_data, inventory_data.items[item_data])

		slots[index].item = inv_item
		slots[index].add_child(inv_item)
		index += 1

func select(itm):
	if itm == null:
		return
	
	if held_item != null:
		held_item.queue_free()
		player.pickaxe_power = 1
		player.axe_power = 1
		player.sword_power = 5
		held_item = null

	if itm.is_holdable:
		var holdable_item_name = itm.item_name
		var scene: PackedScene = load("res://scenes/" + holdable_item_name + ".tscn")

		if scene == null:
			push_error("Scene not found for item: " + holdable_item_name)
			return
			
		var item_resource = load("res://items/" + str(holdable_item_name) + ".tres")
		if holdable_item_name == "sword" or holdable_item_name == "spade":
			player.sword_power = item_resource.power
		elif holdable_item_name == "pickaxe":
			player.pickaxe_power = item_resource.power
		elif holdable_item_name == "axe":
			player.axe_power = item_resource.power

		var instance = scene.instantiate()
		player_hand.add_child(instance)
		instance.position = Vector2.ZERO
		held_item = instance
		
	if itm.is_edible:
		var holdable_item_name = itm.item_name.to_lower()
		var scene: PackedScene = load("res://scenes/" + holdable_item_name + ".tscn")

		if scene == null:
			push_error("Scene not found for item: " + holdable_item_name)
			return

		player.hunger += 10
		if player.hunger > 100:
			player.hunger = 100
		hunger_bar.value = player.hunger
		inventory_data.remove(berry_item, 1)
