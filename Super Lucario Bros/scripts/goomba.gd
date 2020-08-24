extends KinematicBody2D

const GRAVITY = 20
const SPEED = 40
const SKY = Vector2(0,-1)

export var dir = -1 
var motion = Vector2()

func _ready():
	pass
func _physics_process(delta):
	
	motion.y = GRAVITY
	motion.x = dir * SPEED
	move_and_slide(motion , SKY)
	

func morte():
	_physics_process(false)
	dir = 0
	$shape.disabled = true
	$anisprite.play("death")
	$dano/shape.disabled = true
	yield(get_tree().create_timer(0.5), "timeout")
	queue_free()

func _on_dano_area_entered(area):
	morte()
