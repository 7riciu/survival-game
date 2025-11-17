extends CharacterBody2D

@onready var tree = get_tree().get_nodes_in_group("tree")
@onready var health_ui = get_tree().get_first_node_in_group("health_ui")
@onready var hunger_ui = get_tree().get_first_node_in_group("hunger_ui")
@onready var thirst_ui = get_tree().get_first_node_in_group("thirst_ui")
@onready var berry_ui = get_tree().get_first_node_in_group("berry_ui")
@onready var lake = get_tree().get_first_node_in_group("lake_area")

var speed = 300.0
var hunger = 100
var thirst = 100

func _ready() -> void:
	thirst_decrease_by_time()
	hunger_decrese()

func _physics_process(_delta: float) -> void:
	var direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)

	velocity = direction * speed
	move_and_slide()

func hunger_decrese():
	while hunger <= 100 and hunger > 0:
		await get_tree().create_timer(2).timeout
		hunger -= 2
		hunger_ui.hunger_decrease_by_time()

func thirst_decrease_by_time():
	while thirst <= 100 and thirst > 0:
		await get_tree().create_timer(2).timeout
		thirst -= 2
		thirst_ui.thirst_decrease_by_time()
		
func pick_up_item(item: Item):
	var inv = get_tree().get_first_node_in_group("inventory")
	inv.add_item_from_world(item)
