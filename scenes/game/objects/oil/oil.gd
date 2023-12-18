extends Obstacle

var is_entered = false
var direction = 1
var collidedPlayer: Player = null

func _process(_delta):
	if(is_entered):
		var rand_pos = direction * (1.5 + randf_range(2, 3.5))
		collidedPlayer.velocity.z = rand_pos
		if direction > 0:
			collidedPlayer.animation.play("turn_right")
		elif direction < 0:
			collidedPlayer.animation.play("turn_left")
		collidedPlayer.move_and_slide()

func _on_body_entered(body):
	if (body is Player):
		$Timer.start()
		collidedPlayer = body
		direction = 1 if randf_range(-1, 1) > 0.0 else -1
		is_entered = true


func _on_timer_timeout():
	is_entered = false
