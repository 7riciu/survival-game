extends Node
class_name InventoryItems

signal changed
var items := {}

func add(item: ItemData, amount):
	items[item] = items.get(item, 0) + amount
	emit_signal("changed")

func remove(item: ItemData, amount):
	if not items.has(item):
		return

	items[item] = items.get(item, 0) - amount
	if items[item] <= 0:
		items.erase(item)

	emit_signal("changed")
