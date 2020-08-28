extends KinematicBody2D

const GRAVITY = 20
const SKY = Vector2(0,-1)
const SPEED = 40

var motion = Vector2()
var dir = 1
var pos_ini

func _ready():
	pass

func _physics_process(delta):
	motion.y = GRAVITY
	motion.x = dir * SPEED
	$anisprite.play("walk")
	if $rayD.is_colliding() == true:
		$anisprite.flip_h = true
		dir = -1
	if $rayE.is_colliding() == true:
		$anisprite.flip_h = false
		dir = 1
	
	move_and_slide(motion,SKY)
	pass


func morte():
	_physics_process(false)
	dir = 0
	$shape.disabled = true
	$dano/shape.disabled = true
	yield(get_tree().create_timer(0.5), "timeout")
	queue_free()

func _on_dano_area_entered(area):
	morte()
