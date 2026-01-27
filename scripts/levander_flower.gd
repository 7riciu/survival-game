extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var lev_scene: PackedScene = preload("res://scenes/levander_flower.tscn")
@onready var lev_flower_area = $Area2D
@onready var levander = preload("res://items/levander.tres")

var lev_stock = 1
var has_lev = true

func _process(_delta: float) -> void:
	if lev_flower_area.can_collect_lev and lev_stock > 0 and Input.is_action_just_pressed("click"):
		lev_stock -= 1
		inventory_data.add(levander, 1)
	elif lev_stock <= 0:
		has_lev = false
