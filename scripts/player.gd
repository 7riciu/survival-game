extends CharacterBody2D

@onready var tree = get_tree().get_nodes_in_group("tree")
@onready var health_ui = get_tree().get_first_node_in_group("health_ui")
@onready var hunger_ui = get_tree().get_first_node_in_group("hunger_ui")
@onready var thirst_ui = get_tree().get_first_node_in_group("thirst_ui")
@onready var berry_ui = get_tree().get_first_node_in_group("berry_ui")
@onready var lake = get_tree().get_first_node_in_group("lake_area")

@onready var anim = $AnimatedSprite2D

var speed = 300.0
var hunger = 100
var thirst = 100

var axe_power = 10

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
	update_animation(direction)

func update_animation(direction):
	if direction == Vector2.ZERO:
		match anim.animation:
			"walk_right": anim.animation = "idle_right"
			"walk_left": anim.animation = "idle_left"
			"walk_up": anim.animation = "idle_up"
			"walk_down": anim.animation = "idle_down"
		return
	
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			anim.animation = "walk_right"
		else:
			anim.animation = "walk_left"
	else:
		if direction.y > 0:
			anim.animation = "walk_down"
		else:
			anim.animation = "walk_up"

func hunger_decrese():
	while hunger <= 100 and hunger > 0:
		await get_tree().create_timer(2).timeout
		hunger -= 2
		hunger_ui.hunger_decrease_by_time()

func thirst_decrease_by_time():
	while  thirst > 0:
		await get_tree().create_timer(2).timeout
		thirst -= 2
		
		if not lake.can_drink:
			thirst_ui.thirst_decrease_by_time()
		elif lake.can_drink and thirst < 100:
			thirst_increase_by_lake()

func thirst_increase_by_lake():
	if thirst > 100:
		thirst = 100
	if thirst < 100:
		thirst += 2
		thirst_ui.thirst_decrease_by_time()

func pick_up_item(item):
	var inv = get_tree().get_first_node_in_group("inventory")
	inv.add_item_from_world(item)
