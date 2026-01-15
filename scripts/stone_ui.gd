extends Label

var amount = 0

func stone_count():
	amount += 2
	self.text = "Stone: " + str(amount)
