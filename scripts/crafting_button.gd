extends Control

var crafting_open = false
@onready var crafting_menu_scene = preload("res://scenes/crafting_menu.tscn")
var crafting_menu_instance = null

func _ready() -> void:
	crafting_menu_instance = crafting_menu_scene.instantiate()
	crafting_menu_instance.position = Vector2(150, 40)
	add_child(crafting_menu_instance)
	crafting_menu_instance.visible = false

func _on_pressed() -> void:
	crafting_menu_instance.visible = true
