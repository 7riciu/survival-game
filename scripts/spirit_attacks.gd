extends Timer

@onready var player = get_tree().get_first_node_in_group("player")
@onready var health_bar = get_tree().get_first_node_in_group("health_bar")

var fire_spirit_scene = load("res://scenes/fire_spirit.tscn")
var ice_spirit_scene = load("res://scenes/ice_spirit.tscn")

func _ready() -> void:
	randomize()
	timeout.connect(_on_timer_timeout)
	start_random_timer()

func start_random_timer():
	wait_time = randf_range(10.0, 20.0)
	start()

func _on_timer_timeout():
	random_attack()
	start_random_timer()

func random_attack():
	randomize()
	var attack = randi_range(1, 3)
	
	match attack:
		1:
			hit()
		2:
			fire()
		3:
			freeze()

func hit():
	player.health -= 10
	health_bar.value = player.health

func fire():
	player.get_node("AnimatedSprite2D").play("on_fire")
	var fire_spirit_instance = fire_spirit_scene.instantiate()
	player.add_child(fire_spirit_instance)
	fire_spirit_instance.position = Vector2(150, -130)
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
	fire_spirit_instance.queue_free()
	player.get_node("AnimatedSprite2D").play("idle")

func freeze():
	player.get_node("AnimatedSprite2D").play("freeze")
	var ice_spirit_instance = ice_spirit_scene.instantiate()
	player.add_child(ice_spirit_instance)
	ice_spirit_instance.position = Vector2(150, -130)
	player.can_move = false
	await get_tree().create_timer(3.0).timeout
	player.can_move = true
	ice_spirit_instance.queue_free()
	player.get_node("AnimatedSprite2D").play("idle")
