extends Button

var coin_item = preload("res://items/coin.tres")

func _on_pressed() -> void:
	var item_name = $"../Name".text
	var sold_item = load("res://items/" + str(item_name) + ".tres")
	inventory_data.remove(sold_item, 1)
	inventory_data.add(coin_item, 1)
