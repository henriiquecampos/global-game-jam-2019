extends Control

func _on_HSlider_value_changed(value):
	Engine.time_scale = value


func _on_Button_pressed():
	get_tree().change_scene("res://levels/TestLevel.tscn")
