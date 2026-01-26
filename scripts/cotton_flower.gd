extends CharacterBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var cotton_scene: PackedScene = preload("res://scenes/levander_flower.tscn")
@onready var cotton_flower_area = $Area2D
@onready var cotton = preload("res://items/cotton.tres")

var cotton_stock = 1
var has_cotton = true

func _process(_delta: float) -> void:
	if cotton_flower_area.can_collect_cotton and cotton_stock > 0 and Input.is_action_just_pressed("e"):
		cotton_stock -= 1
		inventory_data.add(cotton, 1)
	elif cotton_stock <= 0:
		has_cotton = false
