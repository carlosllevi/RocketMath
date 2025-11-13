extends Node

var posicao_foguete: Vector2 = Vector2.ZERO
var asteroides_atingidos: Array = [] 

func registrar_acerto(id: int):
	if !asteroides_atingidos.has(id):
		asteroides_atingidos.append(id)

const MAX_VIDAS = 3
var vidas_restantes: int = MAX_VIDAS

signal vidas_mudaram(vidas_atuais)
signal jogo_derrota

var dificuldade_atual: String = "facil" 

func iniciar_novo_jogo(dificuldade: String = "facil"):
	asteroides_atingidos = []
	posicao_foguete = Vector2.ZERO
	vidas_restantes = MAX_VIDAS
	dificuldade_atual = dificuldade 
	emit_signal("vidas_mudaram", vidas_restantes)

func perder_vida():
	if vidas_restantes > 0:
		vidas_restantes -= 1
		print("Vidas restantes: ", vidas_restantes) 
		emit_signal("vidas_mudaram", vidas_restantes)
		
		
		if vidas_restantes <= 0:
			terminar_jogo_derrota()

func terminar_jogo_derrota():
	asteroides_atingidos = []
	posicao_foguete = Vector2.ZERO
	emit_signal("jogo_derrota")
	get_tree().change_scene_to_file("res://Cenas/tela_de_derrota.tscn")
