extends Label

var stone = 0

func stone_count():
	stone += 10
	self.text = "Stone: " + str(stone)
