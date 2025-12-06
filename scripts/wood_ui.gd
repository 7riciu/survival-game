extends Label

@onready var player = get_tree().get_first_node_in_group("player")
@onready var wood = get_tree().get_first_node_in_group("wood")
var amount: int

func _ready() -> void:
	amount = 0

func tree_wood_count():
	amount += 10
	self.text = "Wood: " + str(amount)
