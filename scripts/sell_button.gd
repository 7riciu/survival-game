extends Button

@onready var merchant_sell_menu_scene = preload("res://scenes/merchant_sell_menu.tscn")
var coin_item = preload("res://items/coin.tres")

func _on_pressed() -> void:
	var item_name = $"../Name".text
	var sold_item = load("res://items/" + str(item_name) + ".tres")
	inventory_data.remove(sold_item, 1)
	inventory_data.add(coin_item, sold_item.sell_price)
	get_tree().current_scene.get_node("UI").get_node("MerchantSellMenu").sell_clear()
	get_tree().current_scene.get_node("UI").get_node("MerchantSellMenu").sell_items()
