extends CanvasLayer

func _on_butfacil_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/facil.tscn")
	$Sombotaoiniciar.play()

func _on_butmedio_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/medio.tscn")
	$Sombotaoiniciar.play()

func _on_butdificil_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/dificil.tscn")
	$Sombotaoiniciar.play()
	
func _ready() -> void:
	$MusicaAbertura.play()
