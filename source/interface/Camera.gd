extends Node2D

signal finished

export (float) var interpolation_time = 2.0

func interpolate_to(target_position):
	$Tween.interpolate_property(self, "global_position", global_position,
			target_position, interpolation_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	emit_signal("finished")
