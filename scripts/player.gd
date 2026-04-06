extends CharacterBody2D

@onready var berry_ui = get_tree().get_first_node_in_group("berry_ui")
@onready var health_bar = get_tree().get_first_node_in_group("health_bar")
@onready var hunger_bar = get_tree().get_first_node_in_group("hunger_bar")
@onready var thirst_bar = get_tree().get_first_node_in_group("thirst_bar")

@onready var walk_particles = $GPUParticles2D
@onready var anim = $AnimatedSprite2D

@onready var can_move = true
@onready var can_drink = false
var health = 100
var speed = 500.0
var hunger = 100
var thirst = 100

var axe_power = 1
var pickaxe_power = 1
var sword_power = 5

func _ready() -> void:
	print(get_tree().get_nodes_in_group("inventory"))
	thirst_system()
	hunger_decrese()

func _process(_delta: float) -> void:
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")

func _physics_process(_delta: float) -> void:
	if can_move:
		var direction = Vector2(
			Input.get_axis("left", "right"),
			Input.get_axis("up", "down")
		)

		if direction != Vector2.ZERO:
			walk_particles.emitting = true
			direction = direction.normalized()
		else:
			walk_particles.emitting = false

		velocity = direction * speed
		move_and_slide()
		
		var mouse_pos = get_global_mouse_position()
		var dir = mouse_pos - global_position
		
		self.rotation = dir.angle() + deg_to_rad(-90)

func hunger_decrese():
	while hunger <= 100 and hunger > 0:
		await get_tree().create_timer(2).timeout
		hunger -= 2
		hunger_bar.value = hunger

func thirst_system():
	while  thirst > 1:
		if not can_drink:
			await get_tree().create_timer(2).timeout
			thirst -= 2
			thirst_bar.value = thirst
		elif can_drink:
			await get_tree().create_timer(2).timeout
			thirst += 20
			thirst_bar.value = thirst
			if thirst >= 100:
				thirst = 100
				thirst_bar.value = thirst

func health_decrese_by_wolf():
	if  health > 0:
		health -= 10
		health_bar.value = health
