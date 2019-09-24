extends Timer

#onready var div =  100.0 / wait_time

var overlay

func _ready() -> void:
	yield(owner, "ready")
	
	wait_time =  owner.state.wait_time
	
	overlay = owner.overlay
	overlay.max_process = wait_time

func _process(delta: float) -> void:
	
	var time_on = wait_time - time_left
	
	overlay.process = time_on