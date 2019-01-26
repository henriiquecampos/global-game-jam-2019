extends Area2D

func _on_body_entered(body):
	if body.has_node("Inventory"):
		var i = Node.new()
		body.get_node("Inventory").add_child(i)
		i.name = name
		queue_free()
