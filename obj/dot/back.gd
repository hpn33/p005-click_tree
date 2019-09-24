extends Node2D

onready var anim = $AnimationPlayer
onready var tw = $Tween


func shake():
	anim.play('shake')

func _on_Timer_timeout() -> void:
	pass
#	anim.play("shake")

func hover():
	tw.interpolate_property(self, 'scale', scale, Vector2(0.98, 0.98), 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tw.start()

func normal():
	tw.interpolate_property(self, 'scale', scale, Vector2.ONE, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tw.start()


