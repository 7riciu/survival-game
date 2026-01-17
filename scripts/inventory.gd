extends Control
class_name Inventory

var rows: int = 1
var cols: int = 10

@onready var inventory_grid: GridContainer = $GridContainer
var inventory_slot_scene: PackedScene = preload("res://scenes/inventory_slot.tscn")
var slots: Array = []

func _ready() -> void:
	inventory_grid.columns = cols

	for i in range(rows * cols):
		var slot = inventory_slot_scene.instantiate()
		slots.append(slot)
		inventory_grid.add_child(slot)

	inventory_data.changed.connect(refresh)
	
	refresh()

func refresh():
	var inv_item_scene = preload("res://scenes/inventory_item.tscn")
	var index = 0

	for item_data in inventory_data.items.keys():
		if item_data == null:
			continue

		if index >= slots.size():
			break

		var inv_item: InventoryItem = inv_item_scene.instantiate()

		inv_item.set_from_item_data(item_data, inventory_data.items[item_data])

		slots[index].item = inv_item
		slots[index].add_child(inv_item)
		index += 1
