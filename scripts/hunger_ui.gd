extends Label

@onready var player = get_tree().get_first_node_in_group("player")
 
func hunger_decrease_by_time():
	self.text = "Hunger: " + str(player.hunger)
