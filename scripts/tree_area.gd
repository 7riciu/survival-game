extends Area2D

var can_hit = false

func _ready():
	self.body_entered.connect(on_body_entered)
	self.body_exited.connect(on_body_exited)
	
func on_body_entered(body):
	if body.is_in_group("player"):
		can_hit = true
		
func on_body_exited(body):
	if body.is_in_group("player"):
		can_hit = false
