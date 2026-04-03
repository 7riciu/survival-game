extends Timer

@onready var player = get_tree().get_first_node_in_group("player")
@onready var health_bar = get_tree().get_first_node_in_group("health_bar")

func _ready() -> void:
	randomize()
	timeout.connect(_on_timer_timeout)
	start_random_timer()

func start_random_timer():
	wait_time = randf_range(10.0, 11.0)
	start()

func _on_timer_timeout():
	random_attack()
	start_random_timer()

func random_attack():
	randomize()
	var attack = 3
	
	match attack:
		1:
			hit()
		2:
			fire()
		3:
			freeze()

func hit():
	print("Hit!")
	player.health -= 10
	health_bar.value = player.health

func fire():
	print("Fire")
	player.health -= 3
	health_bar.value = player.health
	await get_tree().create_timer(2.0).timeout
	player.health -= 3
	health_bar.value = player.health
	await get_tree().create_timer(2.0).timeout
	player.health -= 3
	health_bar.value = player.health
	await get_tree().create_timer(2.0).timeout
	player.health -= 3
	health_bar.value = player.health

func freeze():
	print("Freeze")
	player.can_move = false
	await get_tree().create_timer(3.0).timeout
	player.can_move = true
