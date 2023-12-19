extends GUI
@onready var animation = $AnimationPlayer

func add_money(money):
	$Label.text = "+" + str(money) + "R$"
	animation.play("add_money")
	$Cash.play()
	
