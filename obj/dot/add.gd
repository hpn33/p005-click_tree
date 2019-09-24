tool
extends Node2D

export var active := false setget set_active

func set_active(value):
	active = value
	
	visible = active

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("cl") and active:
		owner.emit_signal('action', owner, 'add')
