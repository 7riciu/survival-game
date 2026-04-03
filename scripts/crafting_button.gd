extends Control

@onready var crafting_menu_scene = preload("res://scenes/crafting_menu.tscn")
var crafting_menu_instance = null
var crafting_opened = 1

func _ready() -> void:
	crafting_menu_instance = crafting_menu_scene.instantiate()
	crafting_menu_instance.position = Vector2(150, 40)
	add_child(crafting_menu_instance)
	crafting_menu_instance.visible = false

func _on_pressed() -> void:
	crafting_opened += 1
	if (crafting_opened % 2) == 0:
		crafting_menu_instance.visible = true
	else:
		crafting_menu_instance.visible = false
