extends Node2D

var status
var mao = ["pedra","papel","tesoura"]
var cpu = 0
var score = 0

func _ready():
	pass

func _physics_process(delta):
	pontuacao()
	cpu = randi()%3
	if Input.is_action_pressed("pedra"):
		timer()
		status = "pedra"
		jokenpo()
	elif Input.is_action_pressed("papel"):
		timer()
		status = "papel"
		jokenpo()
	elif Input.is_action_pressed("tesoura"):
		timer()
		status = "tesoura"
		jokenpo()
		
func timer():
	$Label.set_text("processando...")
	get_tree().paused = true
	yield(get_tree().create_timer(6), "timeout")
	get_tree().paused = false

func jokenpo():
	if status == mao[cpu]:
		$Label.set_text("Voçê ganhou parabens!!!")
		score += 1
		get_tree().paused = true
		yield(get_tree().create_timer(3), "timeout")
		get_tree().paused = false
		$Label.set_text("Qual a sua jogada!")
	else:
		$Label.set_text("Que pena voçê perdeu!!!")
		score -= 1
		get_tree().paused = true
		yield(get_tree().create_timer(3), "timeout")
		get_tree().paused = false
		$Label.set_text("Qual a sua jogada!")

func pontuacao():
	$Label2.set_text(str(score))
