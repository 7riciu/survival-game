extends Area2D

@onready var rune_heart = get_tree().get_first_node_in_group("rune_heart")
@onready var rune_heart_small = get_tree().get_first_node_in_group("rune_heart_small")
@onready var rune_star = get_tree().get_first_node_in_group("rune_star")
var dialogue_scene = preload("res://scenes/fairy_ring_dialogue.tscn")
@onready var can_enter = false
@onready var heart_collected = false
@onready var heart_small_collected = false
@onready var star_collected = false

func _ready():
	self.body_entered.connect(_on_body_entered)
	self.body_exited.connect(on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("player"):
		can_enter = true

func on_body_exited(body):
	if body.is_in_group("player"):
		can_enter = false

func _process(_delta: float) -> void:
	if can_enter and heart_collected and heart_small_collected and star_collected and Input.is_action_just_pressed("e"):
		get_tree().change_scene_to_file("res://scenes/velumi_fight.tscn")
