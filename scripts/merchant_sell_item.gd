extends Control

func setup(id):
	var item_name = id.id
	var item = load("res://items/" + str(item_name) + ".tres")
	$Panel/TextureRect.texture = item.icon
	$Panel/Amount.text = str(inventory_data.items[id])
	$Panel/Name.text = item.display_name
	$Panel/Price.text = str(item.sell_price)
