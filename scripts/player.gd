extends CharacterBody2D

@onready var tree = get_tree().get_nodes_in_group("tree")
@onready var health_ui = get_tree().get_first_node_in_group("health_ui")
@onready var hunger_ui = get_tree().get_first_node_in_group("hunger_ui")

@onready var player_thirst = 100
var speed = 300.0

func _ready() -> void:
	hunger_decrese()
	hungry_health_decrease()

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
	hungry_health_decrease()

func hungry_health_decrease():
	while hunger_ui.hunger <= 0 and health_ui.health >= 20:
		await get_tree().create_timer(1).timeout
		health_ui.health_decrese_by_hunger()
