extends Label

@onready var player = get_tree().get_first_node_in_group("player")
@onready var lake = get_tree().get_first_node_in_group("lake_area")
 
func thirst_decrease_by_time():
	self.text = "Thirst: " + str(player.thirst)
