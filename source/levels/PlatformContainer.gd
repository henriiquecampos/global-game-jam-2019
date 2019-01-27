extends Node2D

func _on_Timer_timeout():
	for c in get_children():
		if c.has_node("AnimationPlayer"):
			c.get_node("AnimationPlayer").stop()

