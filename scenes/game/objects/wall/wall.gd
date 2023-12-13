extends Obstacle

func _init():
	super._init(20)

func _on_body_entered(body):
	if (body is Player):
		body.hp = 0
