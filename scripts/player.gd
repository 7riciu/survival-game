extends CharacterBody2D

@onready var tree = get_tree().get_nodes_in_group("tree")
@onready var health_ui = get_tree().get_first_node_in_group("health_ui")
@onready var hunger_ui = get_tree().get_first_node_in_group("hunger_ui")
@onready var thirst_ui = get_tree().get_first_node_in_group("thirst_ui")
@onready var berry_ui = get_tree().get_first_node_in_group("berry_ui")
@onready var lake = get_tree().get_first_node_in_group("lake_area")

var speed = 300.0

func _ready() -> void:
	hunger_decrese()
	thirst_decrease()
	thirst_increase_by_lake()
	health_decrease_by_needs()

func _physics_process(_delta: float) -> void:

	var direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)

	velocity = direction * speed
	move_and_slide()

func hunger_decrese():
	while hunger_ui.hunger > 0:
		await get_tree().create_timer(2).timeout
		hunger_ui.hunger_decrease_by_time()
	health_decrease_by_needs()

func thirst_decrease():
	while thirst_ui.thirst > 0 and not lake.can_drink:
		await get_tree().create_timer(2).timeout
		thirst_ui.thirst_decrease_by_time()
	health_decrease_by_needs()

func thirst_increase_by_lake():
	while thirst_ui.thirst < 100 and lake.can_drink:
		await get_tree().create_timer(2).timeout
		thirst_ui.thirst_increase_by_lake()

func health_decrease_by_needs():
	while hunger_ui.hunger <= 0 and health_ui.health >= 20 or thirst_ui.thirst <= 0 and health_ui.health >= 20:
		await get_tree().create_timer(1).timeout
		health_ui.health_decrese_by_hunger()
