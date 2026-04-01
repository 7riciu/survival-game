extends Node

const dialogue = {
	"start": {
		"text": "Hello! I'm the magical deer.",
		"choices": [
			{ "text": "About", "next": "about1" },
			{ "text": "Leave", "action": "leave" }
		]
	},
	"about1": {
		"text": "I look for beautiful items",
		"choices": [
			{ "text": "Help", "next": "requirements"},
			{ "text": "More", "next": "about2"},
			{ "text": "Leave", "action": "leave"}
		]
	},
	"about2": {
		"text": "Dragonflies lay around rocks. You can gather flowers. There is a fairy ring arounf here that heals you.",
		"choices": [
			{ "text": "Leave", "action": "leave"}
		]
	},
	"requirements": {
		"text": "I want 1 dragonfly, 1 lavender and 1 cotton flower. I will give you a cute reward!",
		"choices": [
			{ "text": "Trade", "action": "trade"},
			{ "text": "Leave", "action": "leave"}
		]
	}
}

@onready var text_label = $Panel/Label
@onready var choices = $Panel/VBoxContainer
var current_id = "start"

func start_dialogue():
	show_dialogue("start")

func show_dialogue(id: String):
	current_id = id
	var node = dialogue[id]
	text_label.text = node["text"]
	
	for child in choices.get_children():
		child.queue_free()
		
	for choice in node["choices"]:
		var button = Button.new()
		button.text = choice["text"]
		
		if choice.has("next"):
			button.pressed.connect(
				func(): show_dialogue(choice["next"])
			)
		elif choice.has("action"):
			button.pressed.connect(
				func(): handle_action(choice["action"])
			)
		
		choices.add_child(button)

func handle_action(action):
	match action:
		"trade":
			trade()
		"leave":
			queue_free()

func trade():
	var dragonfly_item = preload("res://items/dragonfly.tres")
	var lavender_item = preload("res://items/levander.tres")
	var cotton_item = preload("res://items/cotton.tres")
	var spade = preload("res://items/spade.tres")
	
	var dragonfly_amount = inventory_data.items.get(dragonfly_item, 0)
	var lavender_amount = inventory_data.items.get(lavender_item, 0)
	var cotton_amount = inventory_data.items.get(cotton_item, 0)
	
	if dragonfly_amount >= 1 and lavender_amount >= 1 and cotton_amount >= 1:
		inventory_data.remove(dragonfly_item, 1)
		inventory_data.remove(lavender_item, 1)
		inventory_data.remove(cotton_item, 1)
		inventory_data.add(spade, 1)
		queue_free()
