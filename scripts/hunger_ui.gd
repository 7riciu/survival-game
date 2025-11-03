extends Label

@onready var player = get_tree().get_first_node_in_group("player")
 
func hunger_decrease_by_time():
	player.hunger -= 50
	self.text = "Hunger: " + str(player.hunger)
	
func hunger_increase_by_berry():
	player.hunger += 2
	self.text = "Hunger: " + str(player.hunger)
