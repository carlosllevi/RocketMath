extends CharacterBody2D

const SPEED = 300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta):
	var vel = velocity
	if Input.is_action_pressed("ui_right"):
		vel.x = SPEED
	else:
		vel.x = move_toward(vel.x, 0, SPEED)
	velocity = vel
	move_and_slide()

func _ready():
	if Progresso.posicao_foguete.x > 0:
		global_position = Progresso.posicao_foguete
		velocity = Vector2.ZERO
