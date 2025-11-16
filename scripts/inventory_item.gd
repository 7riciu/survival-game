extends Control
class_name Item

var item_name: String
var icon: Texture2D

func _ready() -> void:
	add_to_group("items")
