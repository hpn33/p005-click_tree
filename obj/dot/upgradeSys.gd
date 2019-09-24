extends Node


var state
var ui

func _ready() -> void:
	yield(owner, 'ready')
	
	state = owner.state
	ui = owner.ui

func _on_state_changed(what) -> void:
	
	var key = what.keys()[0]
	var value = what.values()[0]
	
	match key:
		'coin':
			ui.set_coin()
			
			if state.level == 1 and value == 5:
				owner.upgrade.active = true
		'level':
			ui.set_level()