extends Button

@onready var wood = get_tree().get_first_node_in_group("wood_ui")
@onready var stone = get_tree().get_first_node_in_group("stone_ui")

func _ready() -> void:
	self.visible = false
	
func _process(_delta: float) -> void:
	if wood.wood >= 10 and stone.stone >= 10:
		self.visible = true
	else:
		self.visible = false

func _on_pressed() -> void:
	if wood.wood >= 10 and stone.stone >= 10:
		wood.wood -= 10
		wood.text = "Wood: " + str(wood.wood)
		stone.stone -= 10
		stone.text = "Stone: " + str(stone.stone)
		print("bought")
	
