extends Button

@onready var inventory = get_tree().get_first_node_in_group("inventory")
@onready var player = get_tree().get_first_node_in_group("player")

var wood_data = inventory_data.items.get("res://items/wood.tres", 0)
var stone_data = inventory_data.items.get("res://items/stone.tres", 0)

func _ready() -> void:
	self.visible = false

func _process(_delta: float) -> void:
	if stone_data >= 10 and wood_data >= 10:
		self.visible = true
	else:
		self.visible = false

func _on_pressed() -> void:
	if stone_data >= 10 and wood_data >= 10:
		inventory_data.remove(stone_data, 10)
		inventory_data.remove(wood_data, 10)
		player.pickaxe_power = 20
		print("bought")
