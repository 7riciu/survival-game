extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var wolf_area = $Area2D
@onready var fur_scene: PackedScene = preload("res://scenes/wolf_fur.tscn")
@onready var meat_scene: PackedScene = preload("res://scenes/meat.tscn")

var health = 10
var speed = 2000
var timer = 0
var wander_change_time = 6
var wander_radius = 400
var wander_direction:Vector2 = Vector2.ZERO
var home_position: Vector2

var is_attacking = false

func _ready() -> void:
	home_position = global_position
	
func _process(_delta: float) -> void:
	wander(_delta)
	if wolf_area.can_attack and Input.is_action_just_pressed("click"):
		health -= player.sword_power
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/win_screen.tscn")

func wander(delta):
	timer -= delta
	if timer <= 0:
		timer = wander_change_time
		wander_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	if global_position.distance_to(home_position) > wander_radius:
		wander_direction = (home_position - global_position).normalized()
	velocity = wander_direction * speed
	move_and_slide()
	self.rotation = wander_direction.angle() + deg_to_rad(-90)
