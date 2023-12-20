extends Obstacle
var player : Player
@onready var spikes = preload("res://assets/sprites/obstacles/spike.png")
#@onready var water_hole = preload("res://assets/sprites/obstacles/water hole.png")

func _ready():
	super._ready()
	match get_parent().get_parent().id:
		10:
			$Sprite3D.modulate = Color(0.28,0.11,0.1,1)
		20:
			$Sprite3D.modulate = Color(0.15,0.01,0.08,1)
		30:
			#$Sprite3D.texture = water_hole
			$Sprite3D.modulate = Color(0.24,0.29,0.44,1)
			
func _on_body_entered(body):
	if (body is Player):
		player = body
		player.oiled = true
		if(speed_variation > 0):
			speed_variation = -speed_variation
		status = 2
		$Oiled.play()
		get_parent().get_parent().get_node("Police").animation_status = 2		
		set_speed_factor(speed_factor + speed_variation)
