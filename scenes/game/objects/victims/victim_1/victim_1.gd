extends Victim
const TEXT_1 = preload("res://assets/sprites/pessoas/Customer5BARFF.png")
const TEXT_2 = preload("res://assets/sprites/pessoas/Customer7LF.png")
const TEXT_3 = preload("res://assets/sprites/pessoas/Customer8RF.png")

func _ready():
	victim_type = 1
	match randi_range(1,3):
		1:
			$Sprite3D.texture = TEXT_1
		2:
			$Sprite3D.texture = TEXT_2
		3:
			$Sprite3D.texture = TEXT_3
