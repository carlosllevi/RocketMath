extends CharacterBody2D

# Define a velocidade do foguete em pixels por segundo
const SPEED = 300.0

# Pega a gravidade das configurações do projeto (útil para jogos de plataforma)
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta):
	# Pega a velocidade atual do corpo
	# (velocity é uma propriedade interna do CharacterBody2D)
	var vel = velocity
	# 2. Verifica a entrada do usuário
	# "ui_right" é a ação padrão para a "seta para a direita"
	if Input.is_action_pressed("ui_right"):
		vel.x = SPEED
	else:
		# Se a tecla não estiver pressionada, faz o foguete parar
		# move_toward "move" o valor atual (vel.x) em direção a 0, na velocidade SPEED
		vel.x = move_toward(vel.x, 0, SPEED)
	# 3. Aplica o movimento
	# Atualiza a propriedade 'velocity' e chama move_and_slide()
	velocity = vel
	move_and_slide()

func _ready():
	if Progresso.posicao_foguete.x > 0:
		global_position = Progresso.posicao_foguete
		velocity = Vector2.ZERO
