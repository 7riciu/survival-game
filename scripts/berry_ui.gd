extends Label

var amount = 0
 
func berry_collect():
	amount += 1
	self.text = "Berries: " + str(amount)
	
func berry_eat():
	amount -= 1
	self.text = "Berries: " + str(amount)
