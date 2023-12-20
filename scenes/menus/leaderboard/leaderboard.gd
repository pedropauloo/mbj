extends GUI
@onready var id = 2
signal back_menu()
var data = []

func _set_scores(saves_json):
	for json_string in saves_json:
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		data.append(node_data)
	data.sort_custom(sort_scores)
	
	for n in data:
		$Name.text = $Name.text + n.username + '\n'
		$Score.text = $Score.text + str(n.score) + '\n'

func sort_scores(a, b):
	if a["score"] > b["score"]:
		return true
	return false

func _on_back_to_menu_pressed():
		emit_signal("back_menu")
