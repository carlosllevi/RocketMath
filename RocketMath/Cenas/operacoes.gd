extends Node

# Armazena o resultado correto da operação para verificar a resposta
var resultado_correto: int = 0
# Variáveis para referenciar os botões, facilitando a manipulação
@onready var label_operacao = $VBoxContainer/Label
@onready var button_1 = $VBoxContainer/HBoxContainer/Button
@onready var button_2 = $VBoxContainer/HBoxContainer/Button2
@onready var button_3 = $VBoxContainer/HBoxContainer/Button3

# ===============================================
# 🚀 FUNÇÕES PRINCIPAIS
# ===============================================

func _ready():
	# 1. GARANTE A INSTANCIAÇÃO DA HUD (Importante para a vida atualizar)
	var hud_cena = load("res://Cenas/hud.tscn") 
	
	if get_tree().get_first_node_in_group("hud_group") == null:
		var hud_instance = hud_cena.instantiate()
		add_child(hud_instance)
		hud_instance.add_to_group("hud_group")
		
	# 2. Conecta a função de resposta
	button_1.pressed.connect(func(): _on_resposta_pressionada(button_1.text.strip_edges().to_int()))
	button_2.pressed.connect(func(): _on_resposta_pressionada(button_2.text.strip_edges().to_int()))
	button_3.pressed.connect(func(): _on_resposta_pressionada(button_3.text.strip_edges().to_int()))
	
	# 3. Inicia a primeira operação
	gerar_nova_operacao()

# Escolhe e gera a operação baseada na dificuldade (Progresso.dificuldade_atual)
func gerar_nova_operacao():
	_set_botoes_habilitados(true)
	
	var x: int
	var y: int
	var operador: String
	
	match Progresso.dificuldade_atual:
		"facil":
			# SOMA: Números menores, resultado sempre positivo
			x = randi_range(3, 15)
			y = randi_range(3, 15)
			resultado_correto = x + y
			operador = "+"
		
		"medio":
			# SUBTRAÇÃO: Garante que o resultado não seja negativo
			x = randi_range(10, 20)
			y = randi_range(3, 9)
			if y > x:
				var temp = x
				x = y
				y = temp
			resultado_correto = x - y
			operador = "-"
			
		"dificil":
			# MULTIPLICAÇÃO: Números até 9 para tabelas básicas
			x = randi_range(2, 9)
			y = randi_range(2, 9)
			resultado_correto = x * y
			operador = "x"
			
		_:
			# Padrão: Soma
			x = randi_range(1, 10)
			y = randi_range(1, 10)
			resultado_correto = x + y
			operador = "+"
			
	# 1. Atualiza a Label com a nova pergunta
	label_operacao.text = "Clique na resposta correta da operação "+ str(x) +" "+ operador +" "+ str(y) +" :"
	
	# 2. Gera e distribui as respostas nos botões
	var respostas_disponiveis = [
		resultado_correto,
		gerar_resposta_incorreta(resultado_correto),
		gerar_resposta_incorreta(resultado_correto)
	]
	
	while respostas_disponiveis[1] == respostas_disponiveis[2]:
		respostas_disponiveis[2] = gerar_resposta_incorreta(resultado_correto)
		
	respostas_disponiveis.shuffle()
	
	button_1.text = "        "+ str(respostas_disponiveis[0]) +"        "
	button_2.text = "        "+ str(respostas_disponiveis[1]) +"        "
	button_3.text = "        "+ str(respostas_disponiveis[2]) +"        "

# Gera um número incorreto (diferente da resposta correta)
func gerar_resposta_incorreta(correta: int) -> int:
	var margem = 3
	if Progresso.dificuldade_atual == "dificil":
		margem = 8 
	
	var incorreta = randi_range(correta - margem, correta + margem)
	
	while incorreta == correta or incorreta < 1:
		incorreta = randi_range(correta - margem, correta + margem)
		
	return incorreta

func _set_botoes_habilitados(habilitado: bool):
	button_1.disabled = !habilitado
	button_2.disabled = !habilitado
	button_3.disabled = !habilitado

# ===============================================
# 🎯 FUNÇÃO DE VERIFICAÇÃO DE RESPOSTA
# ===============================================

func _on_resposta_pressionada(resposta_usuario: int):
	_set_botoes_habilitados(false)
	
	if resposta_usuario == resultado_correto:
		# --- RESPOSTA CORRETA ---
		# Redireciona para a cena da fase correta
		match Progresso.dificuldade_atual:
			"facil":
				get_tree().change_scene_to_file("res://Cenas/facil.tscn")
			"medio":
				get_tree().change_scene_to_file("res://Cenas/medio.tscn")
			"dificil":
				get_tree().change_scene_to_file("res://Cenas/dificil.tscn")
			_:
				get_tree().change_scene_to_file("res://Cenas/facil.tscn")

	else:
		# --- RESPOSTA INCORRETA ---
		Progresso.perder_vida()
		
		if is_inside_tree():
			await get_tree().create_timer(0.1).timeout
		else:
			return
		
		if Progresso.vidas_restantes > 0:
			gerar_nova_operacao()
