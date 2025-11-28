extends Label

@onready var player = get_tree().get_first_node_in_group("player")

func health_update():
	self.text = "Health: " + str(player.health)
