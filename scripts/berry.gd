extends Area2D

@onready var berry_ui = get_tree().get_first_node_in_group("berry_ui")
@onready var inventory = get_tree().get_first_node_in_group("inventory")

@export var item_name: String = ""
@export var icon: Texture2D
@export var is_stackable: bool = true

var amount = 0
var is_in_inv

func _ready() -> void:
	add_to_group("items")
	self.body_entered.connect(on_body_entered)
	amount = berry_ui.berry
	if amount > 0:
		is_in_inv = true
	else:
		is_in_inv = false
		
func _process(_delta: float) -> void:
	amount = berry_ui.berry
	if amount > 0:
		is_in_inv = true
	else:
		is_in_inv = false
	
func on_body_entered(body):
	if body.is_in_group("player"):
		berry_ui.berry_collect()
		body.pick_up_item(self)
		is_in_inv = true
		queue_free()
