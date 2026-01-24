extends Node

const dialogue = {
	"start": {
		"text": "Hello! I'm the merchant.",
		"choices": [
			{ "text": "Next",
			"next": "start2" }
		]
	},
	"start2": {
		"text": "How can I help you?",
		"choices": [
			{ "text": "Shop",
			"action": "shop"},
			{ "text": "Back",
			"action": "start"}
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
		"shop":
			pass
		"back":
			pass
