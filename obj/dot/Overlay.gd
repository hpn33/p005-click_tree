tool
extends Node2D

signal full


export var process := 0.0 setget set_process
export var max_process := 100.0

export var one_shot = true setget set_one_shot
var one_time = true

onready var bar = $bar

func set_process(value):
	process = value
	
	bar.scale.y = process / max_process
	
	var onep = max_process / 100.0
	
	if process == max_process:
		if one_shot and one_time:
			is_full()
			one_time = false
		elif not one_shot:
			is_full()
	else:
		if one_shot and not one_time:
			one_time = true

func set_one_shot(value):
	one_shot = value
	one_time = one_shot

func is_full():
	emit_signal("full")