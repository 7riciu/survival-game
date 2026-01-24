extends Control

@onready var grid = $Panel/ScrollContainer/GridContainer
@onready var sell_item_scene = preload("res://scenes/merchant_sell_item.tscn")

func sell_items():
	for item_id in inventory_data.items:
		var item = sell_item_scene.instantiate()
		item.setup(item_id)
		grid.add_child(item)
