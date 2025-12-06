extends Label

@onready var player = get_tree().get_first_node_in_group("player")
var stone = 0

func stone_count():
	stone += player.pickaxe_power
	self.text = "Stone: " + str(stone)
