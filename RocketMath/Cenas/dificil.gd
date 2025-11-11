extends Node

func _ready():
	Progresso.iniciar_novo_jogo("dificil")
	$MusicaAbertura.play()
