extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var health_ui = get_tree().get_first_node_in_group("health_ui")

var can_attack = false

func _ready() -> void:
	self.body_entered.connect(on_body_entered)
	self.body_exited.connect(on_body_exited)
	
func on_body_entered(body):
	if body.is_in_group("player"):
		get_parent().target_player = body
		can_attack = true

func on_body_exited(body):
	if body.is_in_group("player"):
		get_parent().target_player = null
		can_attack = false
