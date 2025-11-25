extends Area2D

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
