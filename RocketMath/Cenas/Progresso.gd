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

# VÍRIÁVEL NOVA: Para saber qual fase está ativa
var dificuldade_atual: String = "facil" 

# Chamada no início de uma nova fase (facil, medio, dificil)
func iniciar_novo_jogo(dificuldade: String = "facil"):
	vidas_restantes = MAX_VIDAS
	dificuldade_atual = dificuldade # Armazena a dificuldade
	emit_signal("vidas_mudaram", vidas_restantes)

# Chamada quando o jogador erra uma pergunta
func perder_vida():
	if vidas_restantes > 0:
		vidas_restantes -= 1
		print("Vidas restantes: ", vidas_restantes) # Para debug
		emit_signal("vidas_mudaram", vidas_restantes)
		
		if vidas_restantes <= 0:
			terminar_jogo_derrota()

# Redireciona para a tela de derrota
func terminar_jogo_derrota():
	emit_signal("jogo_derrota")
	get_tree().change_scene_to_file("res://Cenas/tela_de_derrota.tscn")
