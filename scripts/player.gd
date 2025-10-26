extends CharacterBody2D

var speed = 300.0

func _physics_process(_delta: float) -> void:
	
	var direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)
	
	velocity = direction * speed
	
	move_and_slide()
