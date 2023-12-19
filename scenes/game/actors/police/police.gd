extends Node3D
@onready var animation := $AnimationPlayer
var animation_status := 1
func _process(delta):
	match animation_status:
		# Riding
		1:
			if(animation.get_queue().size() < 1):
				animation.queue("driving")
		# Approaching
		2:
			if(position.x == 0):
				animation.clear_queue()
				animation.play("approach")
				$TimerChase.start()
				animation_status = 1
			else:
				animation.clear_queue()
				animation.play("approach_again")
				animation_status = 1
		# Retreating
		3:
			animation.clear_queue()
			animation.play("retreating")
			animation_status = 1
			
func _on_timer_lights_timeout():
	for l in $Lights.get_children(): 
		if l.color == Color(1, 0, 0):
			l.color = Color(0, 0, 1)
		else:
			l.color = Color(1, 0, 0)


func _on_hit_box_body_entered(body):
	if body is Player:
		body.hp = 0


func _on_timer_chase_timeout():
	animation_status = 3
