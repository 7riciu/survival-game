extends Label

var amount = 0

func tree_wood_count():
	amount += 10
	self.text = "Wood: " + str(amount)
