extends Control

func setup(id):
	
	var item = load("res://items/" + str(id) + ".tres")
	$Button/TextureRect.texture = item.icon
	$Button/Name.text = item.display_name
	$Button/Price.text = item.sell_price
