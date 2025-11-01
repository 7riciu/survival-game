extends Label

var health = 100

func health_decrese_by_hunger():
	health -= 2
	self.text = "Health: " + str(health)

func health_decrese_by_enemy():
	health -= 10
	self.text = "Health: " + str(health)
