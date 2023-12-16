class_name Victim extends Node2D
var victim_type: int
@export var speed = 20

func _physics_process(delta):
	var new_position = transform.origin
	new_position.x -= speed * delta
	transform.origin = new_position

func _process(delta):
	if(position.x < -10):
		queue_free()
		
func _on_area_2d_body_entered(body):
	if(body is Player):
		match victim_type:
			#Poor
			1:
				body.hp += 5
			#Regular
			2:
				body.hp += 10
			#Rich 
			3:
				body.hp += 25
