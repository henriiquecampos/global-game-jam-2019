extends Panel

signal finished
export (PoolStringArray) var dialogues

func pop_in():
	$Tween.interpolate_property(self, "rect_scale", Vector2(0.0, 0.0),
			Vector2(1.0, 1.0), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	play_dialogue()
	$Button.grab_focus()

func play_dialogue():
	for i in dialogues.size():
		$Label.text = dialogues[i]
		$AnimationPlayer.play("show_text")
		yield($AnimationPlayer, "animation_finished")
		$Button.text = "Next"
		yield($Button, "button_up")
		$AnimationPlayer.play_backwards("show_text")
		yield($AnimationPlayer, "animation_finished")
	emit_signal("finished")
	pop_out()
	
func pop_out():
	$Tween.interpolate_property(self, "rect_scale", rect_scale,
			Vector2(0.0, 0.0), 0.5, Tween.TRANS_BACK, Tween.EASE_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")
	$Button.release_focus()
