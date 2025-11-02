extends Label

var thirst = 100
 
func thirst_decrease_by_time():
	thirst -= 2
	self.text = "Thirst: " + str(thirst)
	
func thirst_increase_by_lake():
	thirst += 10
	self.text = "Thirst: " + str(thirst)
