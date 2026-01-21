extends Node2D

var can_drag = false
var current_item: Node2D = null
var coll_shape = null

func _process(_delta: float) -> void:
	if current_item:
		if Input.is_action_just_pressed("e"):
			can_drag = true
		if Input.is_action_just_pressed("r"):
			can_drag = false
		if can_drag:
			current_item.position = get_global_mouse_position()
		if Input.is_action_just_pressed("q"):
			current_item.modulate.a = 1
			coll_shape.disabled = false
			coll_shape = null
			current_item = null

func start_placing(scene: PackedScene, pos: Vector2):
	if current_item:
		current_item.queue_free()
	current_item = scene.instantiate()
	add_child(current_item)
	current_item.position = pos
	coll_shape = current_item.get_node_or_null("CollisionShape2D")
	if coll_shape:
		coll_shape.disabled = true
	current_item.modulate.a = 0.5
	
