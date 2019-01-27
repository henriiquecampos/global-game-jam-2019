extends Node

func _on_Timer_timeout():
	$Level/Player.set_physics_process(false)
	$Level/Player.set_process_unhandled_input(false)
	$Level/Player.set_process_unhandled_input(false)
	$Interface/GameScreen/DialogueContainer/DialogueBox.pop_in()
	yield($Interface/GameScreen/DialogueContainer/DialogueBox, "finished")
	$Interface/GameScreen/AnimationPlayer.play("sunset")
	$Level/Player.set_physics_process(true)
	$Level/Player.set_process_unhandled_input(true)
	$Level/Player.set_process_unhandled_input(true)

func _on_Time_animation_finished(anim_name):
	$Level/Player.set_physics_process(false)
	$Level/Player.set_process_unhandled_input(false)
	$Level/Player.set_process_unhandled_input(false)
	$Level/Camera.interpolate_to($Level/Rocket.global_position)
	yield($Level/Camera, "finished")
	if $Level/Player/Inventory.get_children().size() > 0:
		if $Level/Player in $Level/Rocket.get_overlapping_bodies():
			$Level/Player.hide()
			$Interface/GameScreen/DialogueContainer/Rocket.pop_in()
			yield($Interface/GameScreen/DialogueContainer/Rocket, "finished")
			$Level/Rocket.launch()
			yield($Level/Rocket/AnimationPlayer, "animation_finished")
			$Interface/GameScreen/AnimationPlayer.play("fade")
			yield($Interface/GameScreen/AnimationPlayer, "animation_finished")
			get_tree().reload_current_scene()
		else:
			$Interface/GameScreen/DialogueContainer/Lose.pop_in()
			yield($Interface/GameScreen/DialogueContainer/Lose, "finished")
			$Level/Rocket.launch()
			yield($Level/Rocket/AnimationPlayer, "animation_finished")
			$Interface/GameScreen/AnimationPlayer.play("fade")
			yield($Interface/GameScreen/AnimationPlayer, "animation_finished")
			get_tree().reload_current_scene()
	elif not $Level/Player in $Level/Rocket.get_overlapping_bodies():
		$Interface/GameScreen/DialogueContainer/Nothing.pop_in()
		yield($Interface/GameScreen/DialogueContainer/Nothing, "finished")
		$Level/Rocket.launch()
		yield($Level/Rocket/AnimationPlayer, "animation_finished")
		$Interface/GameScreen/AnimationPlayer.play("fade")
		yield($Interface/GameScreen/AnimationPlayer, "animation_finished")
		get_tree().reload_current_scene()
