extends Node



# Called when the node enters the scene tree for the first time.
func _ready():
	var x = randi_range(1, 10)
	var y = randi_range(1, 10)
	
	$VBoxContainer/Label.text = "Clique na resposta correta da operação "+ str(x) +" + "+ str(y) +" :"
	
	$VBoxContainer/HBoxContainer/Button.text = "        "+ str(randi_range(1, 20))  +"        "
	$VBoxContainer/HBoxContainer/Button2.text ="        "+ str(x+y) + "        "
	$VBoxContainer/HBoxContainer/Button3.text = "        "+ str(randi_range(1, 20))  +"        "
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Cenas/facil.tscn")
