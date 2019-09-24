extends Area2D

export var active = false

func _on_clickArea_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	
	if event.is_action_pressed('cl') and active:
		owner.state.add_coin()
		owner.back.shake()
		owner.timer.start()
		active = false

func _on_Overlay_full() -> void:
	active = true


func _on_clickArea_mouse_exited() -> void:
	owner.back.normal()


func _on_clickArea_mouse_entered() -> void:
	owner.back.hover()


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == 'shake':
		owner.back.hover()
