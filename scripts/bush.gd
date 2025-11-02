extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var bush_area = $Area2D

var berry_on_bush = 20
var has_berry = true

func _process(_delta: float) -> void:
	if berry_on_bush < 1:
		has_berry = false

func berry_collect():
	if has_berry:
		berry_on_bush -= 2
		player.berry_eat()
