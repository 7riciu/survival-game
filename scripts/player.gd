extends CharacterBody2D

@onready var tree = get_tree().get_nodes_in_group("tree")
@onready var berry_ui = get_tree().get_first_node_in_group("berry_ui")
@onready var lake = get_tree().get_first_node_in_group("lake_area")
@onready var health_bar = get_tree().get_first_node_in_group("health_bar")
@onready var hunger_bar = get_tree().get_first_node_in_group("hunger_bar")
@onready var thirst_bar = get_tree().get_first_node_in_group("thirst_bar")

@onready var anim = $AnimatedSprite2D

var health = 100
var speed = 500.0
var hunger = 100
var thirst = 100

var axe_power = 10
var pickaxe_power = 2
var sword_power = 10

func _ready() -> void:
	print(get_tree().get_nodes_in_group("inventory"))
	thirst_decrease_by_time()
	hunger_decrese()

func _physics_process(_delta: float) -> void:
	var direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)

	if direction != Vector2.ZERO:
		direction = direction.normalized()

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

func thirst_decrease_by_time():
	while  thirst > 0:
		await get_tree().create_timer(2).timeout
		thirst -= 2
		thirst_bar.value = thirst
		
		if not lake.can_drink:
			pass
		elif lake.can_drink and thirst < 100:
			thirst += 12
			thirst_bar.value = thirst
			if thirst >= 100:
				thirst = 100
				thirst_bar.value = thirst

func health_decrese_by_wolf():
	if  health > 0:
		health -= 10
		health_bar.value = health
