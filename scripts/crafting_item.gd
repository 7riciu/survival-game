extends Button

var item_id
var recipe

@onready var image = $TextureRect
@onready var label = $Label

func setup(id, data):
	item_id = id
	recipe = data
	image.texture = data.texture
	
