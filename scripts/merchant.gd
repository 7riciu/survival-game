extends CharacterBody2D

@onready var merchant_area = $Area2D
var dialogue_scene = preload("res://scenes/merchant_dialogue.tscn")

var stone_stock = 20
var has_stone = true

func _process(_delta: float) -> void:
	if merchant_area.can_interact and Input.is_action_just_pressed("e"):
		var dialogue = dialogue_scene.instantiate()
		get_tree().current_scene.add_child(dialogue)
		dialogue.start_dialogue()
