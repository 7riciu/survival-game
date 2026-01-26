extends Control

@onready var grid = $TextureRect/ScrollContainer/GridContainer
var crafting_item_scene = preload("res://scenes/crafting_item.tscn")
var item

func _ready():
	for item_id in recipes.RECIPES:
		item = crafting_item_scene.instantiate()
		item.setup(item_id, recipes.RECIPES[item_id])
		grid.add_child(item)
