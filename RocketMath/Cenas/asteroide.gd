extends Area2D
@export var id_asteroide: int = -1
signal foguete_colodiu

func _ready():
	if id_asteroide != -1 and Progresso.asteroides_atingidos.has(id_asteroide):
		$CollisionShape2D.call_deferred("set_disabled", true)
		explodir()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("foguete") and id_asteroide != -1:
		Progresso.registrar_acerto(id_asteroide)
		Progresso.posicao_foguete = body.global_position
		
		emit_signal("foguete_colodiu", self)
		
		$CollisionShape2D.call_deferred("set_disabled", true)
		
		get_tree().change_scene_to_file("res://Cenas/operacoes.tscn")
		
func explodir():
	$AnimatedSprite2D.play("explodido")
	$"../Tiro".play()
	$"../Tiro".play()
	$"../Tiro".play()
