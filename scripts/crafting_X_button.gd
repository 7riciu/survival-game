extends Button

@onready var crafting_button = get_tree().get_first_node_in_group("crafting_button")
@onready var crafting_menu_scene = preload("res://scenes/crafting_menu.tscn")
var crafting_menu_instance = null

func _on_pressed() -> void:
	crafting_button.crafting_menu_instance.visible = false
