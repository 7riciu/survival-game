extends Control

@onready var grid = $ColorRect/ScrollContainer/GridContainer
var crafting_item_scene = preload("res://scripts/crafting_item.gd")

func _ready():
	for item_id in recipes.RECIPES:
		var button = crafting_item_scene.instantiate()
		button.setup(item_id, recipes.RECIPES[item_id])
		grid.add_child(button)
