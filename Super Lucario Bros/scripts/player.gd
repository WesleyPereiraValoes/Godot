extends KinematicBody2D
#constantes
const JUMP = -2500
const GRAVITY = 80
const SKY = Vector2(0,-1)
const SPEED = 180
#variaveis
var dir = 1
var motion = Vector2()
var status = true
var direita = true

func _ready():
	pass

func _physics_process(delta):
	#gravidade
	motion.y = GRAVITY
	#movimento e parado
	if Input.is_action_pressed("ui_right"):
		if is_on_floor() and status != false:
			motion.x = dir * SPEED
			$sprite.flip_h = false
			$aniplay.play("run")
			direita = true
	elif Input.is_action_pressed("ui_left"):
		if is_on_floor() and status != false:
			motion.x = -dir * SPEED
			$sprite.flip_h = true
			$aniplay.play("run")
			direita = false
	else:
		if is_on_floor() and status != false:
			motion.x = 0 * SPEED
			$aniplay.play("idle")
	#pulo		
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			motion.y = JUMP	
			$aniplay.play("jump")
		else:
			$aniplay.play("jump")
	#ataque do personagem		
	if Input.is_action_just_pressed("action"):
		if is_on_floor():
			status = false
			motion.x = 0
			Input.is_action_just_released("ui_right")
			Input.is_action_just_released("ui_left")
			if direita == true:
				$aniplay.play("punch")
			if direita == false:
				$aniplay.play("punchL")			
	motion = move_and_slide(motion,SKY)
#serve apenas para ativar o movimento depois do ataque
func velo():
	status = true
