extends Area2D

@onready var tree_health = 100
var can_hit = false

func _ready() -> void:
	self.body_entered.connect(on_body_entered)
	self.body_exited.connect(on_body_exited)
	
func on_body_entered(body):
	if body.is_in_group("player"):
		can_hit = true
		
func on_body_exited(body):
	if body.is_in_group("player"):
		can_hit = false
		
func _process(_delta: float) -> void:
	if can_hit and Input.is_action_just_pressed("click"):
		tree_health -= 10
	
	if tree_health <= 0:
		queue_free()
