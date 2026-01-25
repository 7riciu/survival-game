extends Control

func setup(id):
	var item_name = id.id
	var item = load("res://items/" + str(item_name) + ".tres")
	$Panel/TextureRect.texture = item.icon
	$Panel/Name.text = item.display_name
	$Panel/Amount.text = "Amount: " + str(inventory_data.items[id])
	$Panel/Price.text = "Price: " + str(item.sell_price)
