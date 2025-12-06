extends Control
class_name InventoryItem

@onready var sprite: Sprite2D = $Sprite2D
@onready var label: Label = $Label

var item_name: String
var icon: Texture2D
var is_stackable: bool = true
var amount: int = 0

func set_data(_name: String, _icon: Texture2D, _is_stackable: bool, _amount: int):
	item_name = _name
	icon = _icon
	is_stackable = _is_stackable
	amount = _amount
	
func _process(_delta: float) -> void:
	if icon:
		sprite.texture = icon
	else:
		sprite.texture = null
	if is_stackable:
		label.text = str(amount)
	else:
		label.visible = false
	
func fade():
	sprite.modulate = Color(1, 1, 1, 0.4)
	label.modulate = Color(1, 1, 1, 0.4)
