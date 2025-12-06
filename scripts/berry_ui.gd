extends Label

var berry = 0
 
func berry_collect():
	berry += 1
	self.text = "Berries: " + str(berry)
	
func berry_eat():
	berry -= 1
	self.text = "Berries: " + str(berry)
