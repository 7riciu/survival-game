extends Area2D

@onready var rune_heart = get_tree().get_first_node_in_group("rune_heart")
@onready var rune_heart_small = get_tree().get_first_node_in_group("rune_heart_small")
@onready var rune_star = get_tree().get_first_node_in_group("rune_star")
var e_scene = preload("res://scenes/e.tscn")
var e_instance = null

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
	if can_enter:
		if e_instance == null:
			e_instance = e_scene.instantiate()
			get_tree().current_scene.add_child(e_instance)
			e_instance.position = self.position + Vector2(0, -150)
		if can_enter and heart_collected and heart_small_collected and star_collected and Input.is_action_just_pressed("e"):
			get_tree().change_scene_to_file("res://scenes/velumi_fight.tscn")
	else:
		if e_instance != null:
			e_instance.queue_free()
