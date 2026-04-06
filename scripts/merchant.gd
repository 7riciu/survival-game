extends CharacterBody2D

@onready var merchant_area = $Area2D
var e_scene = preload("res://scenes/e.tscn")
var dialogue_scene = preload("res://scenes/merchant_dialogue.tscn")
var e_instance = null
var dialogue = null

func _process(_delta: float) -> void:
	if merchant_area.can_interact:
		if e_instance == null:
			e_instance = e_scene.instantiate()
			get_tree().current_scene.add_child(e_instance)
			e_instance.position = self.position + Vector2(0, -150)
		if Input.is_action_just_pressed("e"):
			if dialogue == null:
				dialogue = dialogue_scene.instantiate()
				get_tree().current_scene.add_child(dialogue)
				dialogue.start_dialogue()
	else:
		if e_instance != null:
			e_instance.queue_free()
