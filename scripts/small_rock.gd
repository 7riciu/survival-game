extends Area2D
class_name Item

@export var item_name: String = ""
@export var icon: Texture2D
@export var is_stackable: bool = true

func _ready() -> void:
	add_to_group("items")
	self.body_entered.connect(on_body_entered)

func on_body_entered(body):
	if body.is_in_group("player"):
		body.pick_up_item(self)
		queue_free()
