extends Victim
const TEXT_1 = preload("res://assets/sprites/pessoas/Customer1FF.png")
const TEXT_2 = preload("res://assets/sprites/pessoas/Customer6RF.png")
const TEXT_3 = preload("res://assets/sprites/pessoas/stand_down.png")

func _ready():
	victim_type = 3
	match randi_range(1,3):
		1:
			$Sprite2D.texture = TEXT_1
		2:
			$Sprite2D.texture = TEXT_2
		3:
			$Sprite2D.texture = TEXT_3
