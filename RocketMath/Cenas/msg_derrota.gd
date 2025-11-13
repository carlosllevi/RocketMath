extends Label

func _on_but_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/tela_inicial.tscn")
	
func _ready() -> void:
	$"../GameOverLoop".play()
