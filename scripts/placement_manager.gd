extends Node

var current_item: Node2D = null

func start_placing(scene: PackedScene, position: Vector2):
	if current_item:
		current_item.queue_free()
	current_item = scene.instantiate()
	add_child(current_item)
	current_item.position = position
	current_item.modulate.a = 0.5
	
func confirm_placement():
	if current_item:
		current_item.modulate.a = 1
		current_item = null
	
