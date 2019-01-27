extends Area2D

func _on_body_entered(body):
	if body.has_node("Inventory"):
		var i = Node.new()
		body.get_node("Inventory").add_child(i)
		i.name = name
		var p = load("res://objects/Pickup.tscn").instance()
		get_parent().add_child(p)
		p.position = position
		p.play()
		queue_free()
