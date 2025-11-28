extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var health_ui = get_tree().get_first_node_in_group("health_ui")
@onready var wolf_area = $Area2D
@onready var fur_scene: PackedScene = preload("res://scenes/wolf_fur.tscn")
@onready var meat_scene: PackedScene = preload("res://scenes/meat.tscn")

var health = 100
var speed = 50
var timer = 0
var wander_change_time = 2
var wander_radius = 150
var wander_direction:Vector2 = Vector2.ZERO
var home_position: Vector2

var is_attacking = false
var target_player = null

func _ready() -> void:
	home_position = global_position
	
func _process(_delta: float) -> void:
	if target_player:
		chase_player()
	else:
		wander(_delta)
	if wolf_area.can_attack and Input.is_action_just_pressed("click"):
		health -= player.sword_power
	if health <= 0:
		var fur = fur_scene.instantiate()
		var meat = meat_scene.instantiate()
		fur.global_position = self.global_position
		meat.global_position = self.global_position + Vector2(10, 0)
		get_tree().current_scene.add_child(fur)
		get_tree().current_scene.add_child(meat)
		queue_free()

func chase_player():
	if target_player == null:
		return
	var direction = (target_player.global_position - global_position).normalized()
	velocity = direction * speed * 1.3
	self.rotation = direction.angle() + deg_to_rad(-90)
	move_and_slide()
	attack()
	
func attack():
	if is_attacking:
		return
	is_attacking = true
	if wolf_area.can_attack:
		await get_tree().create_timer(2).timeout
		player.health_decrese_by_wolf()
	is_attacking = false

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
