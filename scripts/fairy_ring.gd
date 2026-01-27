extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var health_bar = get_tree().get_first_node_in_group("health_bar")
@onready var hunger_bar = get_tree().get_first_node_in_group("hunger_bar")
@onready var thirst_bar = get_tree().get_first_node_in_group("thirst_bar")
@onready var dragonfly_item = preload("res://items/dragonfly.tres")
var dragonfly_amount
var can_bless = false

func _ready():
	self.body_entered.connect(_on_body_entered)
	self.body_exited.connect(on_body_exited)

func _on_body_entered(body):
	if body.is_in_group("player"):
		can_bless = true

func on_body_exited(body):
	if body.is_in_group("player"):
		can_bless = false

func _process(_delta: float) -> void:
	dragonfly_amount = inventory_data.items.get(dragonfly_item, 0)
	if can_bless and dragonfly_amount >= 15 and Input.is_action_just_pressed("e"):
		inventory_data.remove(dragonfly_item, 15)
		player.health = 100
		health_bar.value = 100
		player.hunger = 100
		hunger_bar.value = 100
		player.thirst = 100
		thirst_bar.value = 100
