extends Obstacle
@onready var spikes = preload("res://assets/sprites/obstacles/spike.png")

func _ready():
	match get_parent().get_parent().id:
		10:
			$Sprite2D.modulate = Color(0.45,0.35,0.11,1)
		20:
			$Sprite2D.modulate = Color(0.44,0.41,0.42,1)
		30:
			$Sprite2D.texture = spikes

func _on_body_entered(body):
	if (body is Player):
		body.hp -= 30
		body.hurt.play()
		body.animation.play("hurt")
		speed_variation = -speed_variation
		status = 2
		$Timer.start()
		
		
func _on_timer_timeout():
	set_speed_factor(speed_factor + speed_variation)
