extends Area2D

var dialogue_scene = preload("res://scenes/fairy_ring_dialogue.tscn")
var can_enter = false

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
	if can_enter and Input.is_action_just_pressed("e"):
		get_tree().change_scene_to_file("res://scenes/velumi_fight.tscn")
