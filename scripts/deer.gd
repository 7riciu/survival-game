extends CharacterBody2D

@onready var deer_area = $Area2D
var dialogue_scene = preload("res://scenes/deer_dialogue.tscn")

func _process(_delta: float) -> void:
	if deer_area.can_interact and Input.is_action_just_pressed("e"):
		var dialogue = dialogue_scene.instantiate()
		get_tree().current_scene.add_child(dialogue)
		dialogue.start_dialogue()
