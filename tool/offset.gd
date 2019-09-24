tool
extends Node


enum V { none, top, center, down }
enum H { none, left, center, right }


export(V) var v_mode := V.none setget set_y_offset
export(H) var h_mode := H.none setget set_x_offset

onready var p :Sprite= get_parent()

func _enter_tree() -> void:
	p = get_parent()

func _ready() -> void:
	p = get_parent()

func set_y_offset(value):
	v_mode = value
	
	if not p:
#		print_stack()
		print('need parent')
		return
	
	if p.centered:
		match v_mode:
			V.top:
				p.offset.y = p.texture.get_height() / 2.0
			V.center:
				p.offset.y = 0
			V.down:
				p.offset.y = -p.texture.get_height() / 2.0
			V.none:
				p.offset.y = 0
	else:
		match v_mode:
			V.top:
				p.offset.y = 0
			V.center:
				p.offset.y = -p.texture.get_height() / 2.0
			V.down:
				p.offset.y = -p.texture.get_height()
			V.none:
				p.offset.y = 0

func set_x_offset(value):
	h_mode = value
	
	if not p:
		print('need parent')
		return
	
	if p.centered:
		match h_mode:
			V.top:
				p.offset.x = p.texture.get_width() / 2.0
			V.center:
				p.offset.x = 0
			V.down:
				p.offset.x = -p.texture.get_width() / 2.0
			V.none:
				p.offset.x = 0
	else:
		match h_mode:
			V.top:
				p.offset.x = 0
			V.center:
				p.offset.x = -p.texture.get_width() / 2.0
			V.down:
				p.offset.x = -p.texture.get_width()
			V.none:
				p.offset.x = 0
