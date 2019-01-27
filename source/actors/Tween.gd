extends Tween

func squash(object, target_scale, initial_scale):
	interpolate_property(object, "scale", initial_scale, target_scale,
			0.12, Tween.TRANS_BACK, Tween.EASE_OUT)
	start()
	yield(self, "tween_completed")
	
	interpolate_property(object, "scale", object.scale, initial_scale,
			0.12, Tween.TRANS_BACK, Tween.EASE_OUT)
	start()

func stretch(object, target_scale, initial_scale):
	interpolate_property(object, "scale", initial_scale, target_scale,
			0.12, Tween.TRANS_BACK, Tween.EASE_OUT)
	start()
	