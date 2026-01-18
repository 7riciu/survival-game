extends Button

var item_id
var recipe

func setup(id, data):
	item_id = id
	recipe = data
	print(item_id)
	
	$TextureRect.texture = recipe.icon
	$Label.text = recipe.description

func _pressed() -> void:
	match item_id:
		"pickaxe":
			buy_pickaxe()

func buy_pickaxe():
	print("pickaxe")
