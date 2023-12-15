extends Obstacle

var is_entered = false

func _on_body_entered(body):
	if (body is Player):
		is_entered = true
		
		is_entered = false
