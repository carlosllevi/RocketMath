extends Area2D

signal foguete_colodiu



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("foguete"):
		emit_signal("foguete_colodiu", self)
		$CollisionShape2D.disabled = true
		explodir()
		
func explodir():
	$AnimatedSprite2D.play("explodido")
	$AnimatedSprite2D.play("nada")
	
#func _on_animation_terminada():
	#queue_free()
