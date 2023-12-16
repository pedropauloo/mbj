extends Obstacle

func _on_body_entered(body):
	if (body is Player):
		body.hp -= 30
