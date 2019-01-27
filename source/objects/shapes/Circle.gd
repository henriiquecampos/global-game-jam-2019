extends "res://objects/shapes/Shape.gd"

export (float) var radius

func _ready():
	update()

func _draw():
	draw_circle(position, radius, color)
