extends Button

func _on_pressed() -> void:
	$"../..".sell_clear()
	$"../..".queue_free()
