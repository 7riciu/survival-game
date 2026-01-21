extends Node2D

var can_drag = false
var current_item: Node2D = null

func _process(_delta: float) -> void:
	if current_item:
		var drag_area = get_tree().get_first_node_in_group("drag_area")
		if Input.is_action_just_pressed("e"):
			can_drag = true
		if Input.is_action_just_pressed("r"):
			can_drag = false
		if can_drag:
			current_item.position = get_global_mouse_position()
		if Input.is_action_just_pressed("q"):
			current_item.modulate.a = 1
			current_item = null

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
	
