extends Node
class_name InventoryData

signal changed

var items := {}

func add(item: ItemData, amount := 1):
	items[item] = items.get(item, 0) + amount
	emit_signal("changed")

func remove(item: ItemData, amount := 1):
	if not items.has(item):
		return

	items[item] -= amount
	if items[item] <= 0:
		items.erase(item)

	emit_signal("changed")
