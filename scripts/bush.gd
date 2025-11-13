extends CharacterBody2D

@onready var hunger_ui = get_tree().get_first_node_in_group("hunger_ui")
@onready var berry_ui = get_tree().get_first_node_in_group("berry_ui")
@onready var bush_area = $Area2D

var berry_on_bush = 20
var has_berry = true

func _process(_delta: float) -> void:
	if bush_area.can_collect_berry and berry_on_bush > 0 and Input.is_action_just_pressed("e"):
		berry_on_bush -= 10
		berry_ui.berry_collect()
	elif berry_on_bush <= 0:
		queue_free()
