extends CanvasLayer

@onready var vida_1: Sprite2D =$Sprite2D
@onready var vida_2: Sprite2D =$Sprite2D2
@onready var vida_3: Sprite2D =$Sprite2D3

var sprites_vidas: Array

func _ready():
	# Armazena as sprites em ordem para fácil iteração
	sprites_vidas = [vida_1, vida_2, vida_3]
	
	# Conecta ao sinal do Autoload
	Progresso.vidas_mudaram.connect(_on_vidas_mudaram)
	
	# Inicializa a exibição (útil ao carregar a cena)
	_on_vidas_mudaram(Progresso.vidas_restantes)

# Função chamada quando a contagem de vidas muda
func _on_vidas_mudaram(vidas_atuais: int):
	# Itera sobre as sprites para mostrar/esconder
	for i in range(Progresso.MAX_VIDAS):
		var sprite_vida = sprites_vidas[i]
		
		if i < vidas_atuais:
			sprite_vida.visible = true
		else:
			sprite_vida.visible = false
