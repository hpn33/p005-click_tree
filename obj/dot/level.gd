extends Label




func _on_state_level_changed(level: int) -> void:
	text = 'L ' + str(level)
