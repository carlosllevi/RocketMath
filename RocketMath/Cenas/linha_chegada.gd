extends Area2D


# Called when the node enters the scene tree for the first time.
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("foguete"):
		
		emit_signal("foguete_colodiu", self)
		
		$CollisionShape2D.call_deferred("set_disabled", true)
		
		get_tree().change_scene_to_file("res://Cenas/tela_de_vitoria.tscn")
		
