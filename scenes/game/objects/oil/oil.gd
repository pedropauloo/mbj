extends Obstacle
var player : Player

func _ready():
	match get_parent().get_parent().id:
		10:
			$Sprite2D.modulate = Color(0.77,0.36,0,1)
		20:
			$Sprite2D.modulate = Color(1,1,1,1)
		30:
			pass
			
func _on_body_entered(body):
	if (body is Player):
		player = body
		player.oiled = true
		speed_variation = -speed_variation
		status = 2
		$Oiled.play()
		$Timer.start()
		
func _on_timer_timeout():
	set_speed_factor(speed_factor + speed_variation)
