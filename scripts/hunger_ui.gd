extends Label

var hunger = 100
 
func hunger_decrease_by_time():
	hunger -= 50
	self.text = "Hunger: " + str(hunger)
