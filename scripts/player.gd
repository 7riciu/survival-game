extends CharacterBody2D

@onready var player_health = 100
@onready var player_hunger = 100
@onready var player_thirst = 100
var speed = 300.0

func _ready() -> void:
	hunger_decrese()

func _physics_process(_delta: float) -> void:
	
	var direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)
	
	velocity = direction * speed
	move_and_slide()

func hunger_decrese():
	while player_hunger > 0:
		await get_tree().create_timer(2).timeout
		player_hunger -= 2
		print(player_hunger)
	
func hungry_health_decrease():
	await get_tree().create_timer(1).timeout
	player_health -= 2
