extends Node

var posicao_foguete = Vector2(-1, 0)
var asteroides_atingidos = {}

func registrar_acerto(id):
	asteroides_atingidos[id] = true
