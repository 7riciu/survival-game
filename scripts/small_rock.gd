extends Area2D
class_name Item

var item_name: String = ""
var icon: Texture2D
var is_stackable: bool = true

func _ready() -> void:
	add_to_group("items")
