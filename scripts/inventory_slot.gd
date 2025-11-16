extends CenterContainer
class_name InventorySlot

var inventory_item_scene: PackedScene = preload("res://scenes/inventory_item.tscn")
var item: InventoryItem
var hint_item: InventoryItem = null

enum InventorySlotAction {
	SELECT, SPLIT,
}

signal slot_input(which: InventorySlot, action: InventorySlotAction)
signal slot_hovered(which: InventorySlot, is_hovering: bool)

func _ready() -> void:
	add_to_group("inventory_slots")
	
func _on_texture_button_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_text == MOUSE_BUTTON_LEFT:
			slot_input.emit(
				self, InventorySlotAction.SELECT
			)
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			slot_input.emit(
				self, InventorySlotAction.SPLIT
			)
			
func _on_texture_button_mouse_entered():
	slot_hovered.emit(self, true)

func _on_texture_button_mouse_exited():
	slot_hovered.emit(self, false)
	
