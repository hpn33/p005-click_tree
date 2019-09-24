extends Node2D

const dot = preload("res://obj/dot/dot.tscn")
const line = preload("res://obj/line/Line.tscn")

onready var lines = $lines

var next_point = false
var inss:Line2D


func _on_dot_action(obj, action_name) -> void:
	if action_name == 'add':
		yield(get_tree().create_timer(0.2), 'timeout')
		add_line_dot(obj)


func add_line_dot(obj:Node2D):
	inss = line.instance()
	
	lines.add_child(inss)
	
	inss.add_point(obj.position)
	inss.add_point(get_global_mouse_position())
	
	next_point = true




func _process(delta: float) -> void:
	
	if not inss:
		return
	
	var gmouse = get_global_mouse_position()
	
	inss.remove_point(inss.points.size() - 1)
	inss.add_point(gmouse)
	
	if Input.is_action_just_pressed("cl") and next_point:
		next_point = false
		
		inss.remove_point(inss.points.size() -1)
		inss.add_point(gmouse)
		inss = null
		
		add_dot(gmouse)

func add_dot(pos):
	var ins = dot.instance()
	add_child(ins)
	
	ins.position = pos
	
	ins.connect("action", self, '_on_dot_action')