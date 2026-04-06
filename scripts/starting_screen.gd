extends Control

func _process(_delta: float) -> void:
	await  get_tree().create_timer(1.0).timeout
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
