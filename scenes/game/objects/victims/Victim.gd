class_name Victim extends Node3D
var victim_type: int
const SPEED: float = 10
static var speed_factor:= Obstacle.speed_factor
var speed_variation := 0.25
const MIN_FACTOR := 0.5 #50% of original speed
const MAX_FACTOR := 1.0 #100% of original speed
var status := 1
signal robbed(money) 

func _physics_process(delta):
	var new_position = transform.origin
	new_position.x -= SPEED * speed_factor * delta
	transform.origin = new_position

func _process(delta):
	if(position.x < -10):
		queue_free()
		
func _on_area_3d_body_entered(body):
	if(body is Player):
		match victim_type:
			#Poor
			1:
				body.hp += 5
				emit_signal('robbed',5)
				$Robbery.play()
			#Regular
			2:
				body.hp += 10
				emit_signal('robbed',10)
				$Robbery.play()				
			#Rich 
			3:
				body.hp += 25
				emit_signal('robbed',25)
				$Robbery.play()
				

