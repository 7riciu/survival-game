extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var berry_scene: PackedScene = preload("res://scenes/berry.tscn")
@onready var bush_area = $Area2D

var berry_on_bush = 5
var has_berry = true

func _process(_delta: float) -> void:
	if bush_area.can_collect_berry and berry_on_bush > 0 and Input.is_action_just_pressed("e"):
		berry_on_bush -= 1
		var berry = berry_scene.instantiate()
		berry.global_position = self.global_position + Vector2(0, 100)
		get_tree().current_scene.add_child(berry)
	elif berry_on_bush <= 0:
		$AnimatedSprite2D.animation = "empty"
		$AnimatedSprite2D.play()
		has_berry = false
