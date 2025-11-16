extends Control
class_name InventoryItem

@onready var sprite: Sprite2D = $Sprite2D
@onready var label: Label = $Label

var item_name: String
var icon: Texture2D
var is_stackable: bool = true
var amount: int = 0

func set_data(_name: String, _icon: Texture2D, _is_stackable: bool, _amount: int):
	name = _name
	icon = _icon
	is_stackable = _is_stackable
	amount = _amount
	
func _process(_delta: float) -> void:
	sprite.texture = icon
	if is_stackable:
		label.text = str(amount)
	else:
		label.visible = false

func set_sprite_size_to(sprite: Sprite2D, size: Vector2):
	var texture_size = sprite.texture.get_size()
	var scale_factor = Vector2(size.x / texture_size.x, size.y / texture_size.y)
	sprite.scale = scale_factor
	
func fade():
	sprite.modulate = Color(1, 1, 1, 0.4)
	label.modulate = Color(1, 1, 1, 0.4)
