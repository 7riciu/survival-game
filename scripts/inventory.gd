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
	tooltip.global_position = get_global_mouse_position() + Vector2.ONE * 8
	if selected_item:
		tooltip.visible = false
		selected_item.global_position = get_global_mouse_position()
			
func _on_slot_hovered(which: InventorySlot, is_hovering: bool):
	if which.item:
		tooltip.set_text(which.item_name)
		tooltip.visible = is_hovering
	elif which.hint_item:
		tooltip.set_text(which.hint_item.item_name)
		tooltip.visible = is_hovering

func add_item_from_world(world_item): 
	var inv_item_scene = preload("res://scenes/inventory_item.tscn")
	var inv_item: InventoryItem = inv_item_scene.instantiate()
	world_item.amount =+ 1
	inv_item.set_data(
		world_item.item_name,
		world_item.icon,
		world_item.is_stackable,
		world_item.amount
	)
	for slot in slots:
		if not world_item.is_in_inv == true :
			slot.item = inv_item
			slot.add_child(inv_item)
			return
		else:
			pass
