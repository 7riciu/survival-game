extends Button

@onready var player = get_tree().get_first_node_in_group("player")
@onready var wood_ui = get_tree().get_first_node_in_group("wood_ui")
@onready var wood = get_tree().get_first_node_in_group("wood")
@onready var stone = get_tree().get_first_node_in_group("stone_ui")

func _ready() -> void:
	self.visible = false

func _process(_delta: float) -> void:
	if wood_ui.amount >= 10 and stone.stone >= 10:
		self.visible = true
	else:
		self.visible = false

func _on_pressed() -> void:
	if wood_ui.amount >= 10 and stone.stone >= 10:
		wood.amount -= 10
		wood_ui.amount = wood.amount
		wood_ui.text = "Wood: " + str(wood.amount)
		stone.stone -= 10
		stone.text = "Stone: " + str(stone.stone)
		player.pickaxe_power = 20
		print("bought")
