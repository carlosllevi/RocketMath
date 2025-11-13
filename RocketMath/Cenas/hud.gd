extends CanvasLayer

@onready var vida_1: Sprite2D =$Sprite2D
@onready var vida_2: Sprite2D =$Sprite2D2
@onready var vida_3: Sprite2D =$Sprite2D3

var sprites_vidas: Array

func _ready():
	sprites_vidas = [vida_1, vida_2, vida_3]
	
	Progresso.vidas_mudaram.connect(_on_vidas_mudaram)
	
	_on_vidas_mudaram(Progresso.vidas_restantes)

func _on_vidas_mudaram(vidas_atuais: int):
	for i in range(Progresso.MAX_VIDAS):
		var sprite_vida = sprites_vidas[i]
		
		if i < vidas_atuais:
			sprite_vida.visible = true
		else:
			sprite_vida.visible = false
			$PerdeVida.play()
