extends CharacterBody2D

@export var item_name: String = ""
@export var icon: Texture2D
@export var is_stackable: bool = true

@onready var hunger_ui = get_tree().get_first_node_in_group("hunger_ui")
@onready var berry_ui = get_tree().get_first_node_in_group("berry_ui")
@onready var player = get_tree().get_first_node_in_group("player")
@onready var berry_scene: PackedScene = preload("res://scenes/berry.tscn")
@onready var bush_area = $Area2D

var berry_on_bush = 20
var has_berry = true

func _process(_delta: float) -> void:
	if bush_area.can_collect_berry and berry_on_bush > 0 and Input.is_action_just_pressed("e"):
		berry_on_bush -= 10
		var berry = berry_scene.instantiate()
		berry.global_position = self.global_position + Vector2(0, 10)
		get_tree().current_scene.add_child(berry)
	elif berry_on_bush <= 0:
		has_berry = false
