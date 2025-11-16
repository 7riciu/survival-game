extends Control
class_name  Inventory

var inventory_item_scene = preload("res://scenes/inventory_slot.tscn")

var rows: int = 3
var cols: int = 6

var inventory_grid: GridContainer

var inventory_slot_scene: PackedScene
var slots: Array[InventorySlot]

static var selected_item: Item = null

func _ready() -> void:
	inventory_grid.columns = cols
	for i in range(rows * cols):
		var slot = inventory_slot_scene.instantiate()
		slots.append(slot)
		inventory_grid.add_child(slot)
		slot.slot_input.connecnt(self._on_slot_input)
		slot.slot_input(self._on_slot_hovered)

func _on_slot_input(which: InventorySlot, action: InventorySlot.InventorySlotAction):
	print(action)
	if not selected_item:
		if action == InventorySlot.InventorySlotAction.SELECT:
			selected_item = which.select_item()
		elif action == InventorySlot.InventorySlotAction.SPLIT:
			selected_item = which.split_item()
		else:
			selected_item = which.deselect_item.(selected_item)
