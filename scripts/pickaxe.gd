extends Button

@onready var inventory = get_tree().get_first_node_in_group("inventory")
@onready var player = get_tree().get_first_node_in_group("player")
@onready var wood_ui = get_tree().get_first_node_in_group("wood_ui")
@onready var wood = get_tree().get_first_node_in_group("wood")
@onready var stone_ui = get_tree().get_first_node_in_group("stone_ui")
@onready var stone = get_tree().get_first_node_in_group("stone")

func _ready() -> void:
	self.visible = false

func _process(_delta: float) -> void:
	if wood_ui.amount >= 10 and stone_ui.amount >= 10:
		self.visible = true
	else:
		self.visible = false

func _on_pressed() -> void:
	if wood_ui.amount >= 10 and stone_ui.amount >= 10:
		wood_ui.amount -= 10
		wood_ui.text = "Wood: " + str(wood_ui.amount)
		inventory.remove_item("wood", 10)
		stone_ui.amount -= 10
		stone_ui.text = "Stone: " + str(stone_ui.amount)
		inventory.remove_item("stone", 10)
		player.pickaxe_power = 20
		print("bought")
