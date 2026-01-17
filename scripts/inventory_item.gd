extends Control
class_name InventoryItem

var item_name: String
var icon: Texture2D
var is_stackable: bool = true
var amount: int = 0

func set_from_item_data(item: ItemData, amount_value: int):
	item_name = item.display_name
	icon = item.icon
	is_stackable = item.stackable
	amount = amount_value

	$Sprite2D.texture = icon

	$Label.visible = true
	$Label.text = str(amount)
