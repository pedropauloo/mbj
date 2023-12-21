extends Obstacle
@onready var spikes = preload("res://assets/sprites/obstacles/spike.png")

func _ready():
	super._ready()
	match get_parent().get_parent().id:
		10:
			$Sprite3D.modulate = Color(0.45,0.35,0.11,1)
		20:
			$Sprite3D.modulate = Color(0.44,0.41,0.42,1)
		30:
			$Sprite3D.texture = spikes
			$Sprite3D.modulate = Color(1,1,1,1)

func _on_body_entered(body):
	if (body is Player):
		body.hp -= 30
		body.hurt.play()
		body.animation.play("hurt")
		if(speed_variation > 0):
			speed_variation = -speed_variation
		status = 2
		get_parent().get_parent().get_node("Police").animation_status = 2
		set_speed_factor(speed_factor + speed_variation)
		
