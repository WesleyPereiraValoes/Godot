extends KinematicBody2D
const GRAVITY = 20
const JUMP = -400
const UP = Vector2(0,-1)
var vel = Vector2()
var speed = 200
var state_machine
func _ready():
	state_machine = $anitree.get("parameters/playback")
	pass

func _physics_process(delta):
	vel.y += GRAVITY
	if Input.is_action_pressed("left"):
		vel.x = -speed
		$sprite.flip_h = true
		state_machine.travel("run")
	elif Input.is_action_pressed("right"):
		vel.x = speed
		$sprite.flip_h = false
		state_machine.travel("run")
	else:
		vel.x = 0
		state_machine.travel("idle")
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			vel.y = JUMP
	else:
		state_machine.travel("jump")
		
	vel = move_and_slide(vel,UP)
	
	if Input.is_action_just_pressed("action"):
		speed = 0
		state_machine.travel("punch")
		
func estatus():
	speed = 200
