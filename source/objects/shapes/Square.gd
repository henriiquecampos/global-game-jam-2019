extends "res://objects/shapes/Shape.gd"

export (float) var size

func _draw():
	var rect = Rect2(Vector2(0, 0), Vector2(size, size))
	draw_rect(rect, color)
