extends Control


onready var level = $status/level
onready var coin = $status/coin
onready var time = $status/time

var state

func _ready() -> void:
	yield(owner, 'ready')
	
	state = owner.state
	
	set_level()

func set_level():
	level.text = 'L ' + str(state.level)

func set_coin():
	coin.text = 'L ' + str(state.coin)

func set_time():
	time.text = 'L ' + str(state.wait_time)