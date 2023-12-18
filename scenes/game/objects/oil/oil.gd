extends Obstacle

var status := 0
var collidedPlayer: Player = null

func _process(_delta):
	match status:
		0: 
			pass
		1: 
			collidedPlayer.velocity.z = 1.5 + randf_range(0, 1)
			collidedPlayer.move_and_slide()
		2:
			collidedPlayer.velocity.z = -(1.5 + randf_range(0, 1))
			collidedPlayer.move_and_slide()

func _on_body_entered(body):
	if (body is Player):
		$Timer.start()
		collidedPlayer = body
		status = 1


func _on_timer_timeout():
	status += 1

	if(status < 3):
		$Timer.start()
