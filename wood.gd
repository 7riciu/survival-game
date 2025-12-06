extends Area2D

@onready var wood_ui = get_tree().get_first_node_in_group("wood_ui")

@export var item_name: String = ""
@export var icon: Texture2D
@export var is_stackable: bool = true

var amount = 0

func _ready() -> void:
	add_to_group("items")
	self.body_entered.connect(on_body_entered)
	
func on_body_entered(body):
	if body.is_in_group("player"):
		wood_ui.tree_wood_count()
		amount = wood_ui.amount
		body.pick_up_item(self)
		queue_free()
