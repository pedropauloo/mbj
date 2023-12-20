extends Obstacle


func _ready():
	super._ready()
	match get_parent().get_parent().id:
		10:
			$Ramp.visible = true
			$Ramp2.visible = false
		20:
			$Ramp.visible = false
			$Ramp2.visible = true
		30:
			$Ramp.visible = false
			$Ramp2.visible = true

func _on_body_entered(body):
	if (body is Player):
		body.jump_force = body.jump_force * 2
		await body.jump()
		body.jump_force = body.jump_force/2
		status = 2
		
