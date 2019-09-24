extends Node



var level := 1 setget set_level
var max_level := 20

var wait_time := 3.0

var coin := 0 setget set_coin
var coin_plus := 1

var addable := 0

signal changed(what)


func set_level(value):
	level = value
	
	emit_signal('changed', {'level': level})

func level_up():
	if level < max_level:
		self.level += 1


func set_coin(value):
	coin = value
	
	emit_signal("changed", {'coin': coin})

func add_coin():
	self.coin += 1