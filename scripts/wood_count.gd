extends Label

var wood = 0

func tree_wood_count():
	wood += 10
	self.text = "Wood: " + str(wood)
