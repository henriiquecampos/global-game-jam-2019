extends Node2D

func _on_Timer_timeout():
	$Player/CameraRig.queue_free()
	$Player.set_physics_process(false)
	$Player.set_process_unhandled_input(false)
	$Player.set_process_unhandled_input(false)
	$Camera.interpolate_to($Rocket.global_position)
	yield($Camera, "finished")
	$Rocket.launch()
