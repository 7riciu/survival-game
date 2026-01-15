extends Control
class_name  Inventory

var inventory_item_scene = preload("res://scenes/inventory_slot.tscn")

var rows: int = 1
var cols: int = 10

var inventory_content = {}

@onready var inv_item_label = get_tree().get_first_node_in_group("inv_item_label")
@onready var inventory_grid: GridContainer = $GridContainer
@onready var tooltip: Tooltip = $Tooltip

var inventory_slot_scene: PackedScene = preload("res://scenes/inventory_slot.tscn")
var slots: Array[InventorySlot] = []

static var selected_item: InventoryItem = null

func _ready() -> void:
	inventory_grid.columns = cols
	for i in range(rows * cols):
		var slot = inventory_slot_scene.instantiate()
		slots.append(slot)
		inventory_grid.add_child(slot)
	tooltip.visible = false

func _process(_delta: float) -> void:
	pass

func add_item_from_world(world_item): 
	var inv_item_scene = preload("res://scenes/inventory_item.tscn")

	if world_item.is_stackable:
		for slot in slots:
			if not slot.is_empty() and slot.item.item_name == world_item.item_name:
				slot.item.amount = world_item.amount
				slot.item.label.text = str(slot.item.amount)
				return
				
	for slot in slots:
		if slot.is_empty():
			var inv_item: InventoryItem = inv_item_scene.instantiate()
			inv_item.set_data(
				world_item.item_name,
				world_item.icon,
				world_item.is_stackable,
				world_item.amount
			)
			slot.item = inv_item
			slot.add_child(inv_item)
			return

func remove_item(item_name: String, amount_to_remove: int):
	for slot in slots:
		if not slot.is_empty() and slot.item.item_name == item_name:
			slot.item.amount -= amount_to_remove

			if slot.item.amount <= 0:
				slot.item.queue_free()
				slot.item = null
			else:
				slot.item.label.text = str(slot.item.amount)

			return
