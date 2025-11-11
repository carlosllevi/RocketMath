extends CanvasLayer

func _on_but_jogar_pressed() -> void:
	# 1. IMPORTANTE: Garante que o jogo saia do modo "pause"
	get_tree().paused = false
	
	# 2. Retorna à tela inicial para reiniciar o jogo
	get_tree().change_scene_to_file("res://Cenas/tela_inicial.tscn")
	
func _ready() -> void:
	$VitoriaCena.play()
