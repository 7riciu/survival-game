extends Node

const dialogue = {
	"start": {
		"text": "This is beautiful",
		"choices": [
			{ "text": "About", "next": "about" },
			{ "text": "Leave", "action": "leave" }
		]
	},
	"about": {
		"text": "This is the power of fairies",
		"choices": [
			{ "text": "More", "next": "requirements"},
			{ "text": "Leave", "action": "leave"}
		]
	},
	"requirements": {
		"text": "I want 15 dragonflies for a blessing",
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
	var player = get_tree().get_first_node_in_group("player")
	var health_bar = get_tree().get_first_node_in_group("health_bar")
	var hunger_bar = get_tree().get_first_node_in_group("hunger_bar")
	var thirst_bar = get_tree().get_first_node_in_group("thirst_bar")
	var dragonfly_item = preload("res://items/dragonfly.tres")
	var dragonfly_amount = inventory_data.items.get(dragonfly_item, 0)
	
	if dragonfly_amount >= 15:
		inventory_data.remove(dragonfly_item, 15)
		player.health = 100
		health_bar.value = 100
		player.hunger = 100
		hunger_bar.value = 100
		player.thirst = 100
		thirst_bar.value = 100
		queue_free()
