extends CenterContainer
class_name InventorySlot

var inventory_item_scene: PackedScene = preload("res://scenes/inventory_item.tscn")
var item: InventoryItem
var hint_item: InventoryItem = null

func _ready() -> void:
	add_to_group("inventory_slots")

func is_respecting_hint(new_item: InventoryItem, in_amount_as_well: bool = true) -> bool:
	if not hint_item:
		return true
	if in_amount_as_well:
		return (
			new_item.item_name == self.hint_item.item_name
			and new_item.amount >= self.hint_item.amount
		)
	else:
		return new_item.item_name == self.hint_item.item_name

func is_empty():
	return self.item == null

func has_same_item(_item: InventoryItem):
	return _item.item_name == self.item.item_name
