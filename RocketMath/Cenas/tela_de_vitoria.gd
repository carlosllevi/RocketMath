extends CanvasLayer

func _on_but_jogar_pressed() -> void:
	# Retorna à tela inicial para reiniciar o jogo
	get_tree().change_scene_to_file("res://Cenas/tela_inicial.tscn")
