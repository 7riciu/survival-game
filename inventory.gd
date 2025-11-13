extends Control

var max_slots = 10
var items: Array = []

@onready var slots = $HBoxContainer.get_children()

func _ready() -> void:
	self.add_item("bush", preload("res://images/godotwaka2.png"))


func add_item(item_name: String, icon: Texture):
	for i in items:
		if i.name == item_name:
			i.quantity += 1
			update_slots()
			return

	if items.size() < max_slots:
		items.append({
			"name": item_name,
			"icon": icon,
			"quantity": 1
		})
		update_slots()

func update_slots():
	for i in range(max_slots):
		var slot = slots[i]
		var icon = slot.get_node("TextureRect")
		var count_label = slot.get_node("Label")
		
		if i < items.size():
			var item = items[i]
			icon.texture = item["icon"]
			count_label.text = str(item["quantity"])
		else:
			icon.texture = null
			count_label.text = ""
