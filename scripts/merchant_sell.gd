extends Control

@onready var grid = $ColorRect/ScrollContainer/GridContainer
@onready var sell_item_scene = preload("res://scenes/merchant_sell_item.tscn")
var item

func sell_items():
	
	for item_id in inventory_data.items:
		item = sell_item_scene.instantiate()
		item.setup(item_id)
		grid.add_child(item)
