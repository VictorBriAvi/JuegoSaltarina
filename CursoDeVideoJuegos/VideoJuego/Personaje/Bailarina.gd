extends KinematicBody2D


#func _process(delta):
	#Va a ejecurtar siempre y cuando tengamos presionado la tecla
#	if Input.is_action_pressed("salto"):
#		print("saltando")
		#Ejecuta una vez cuando se presione la tecla
#	elif Input.is_action_just_pressed("movimientoDerechar"):
#		print("Derecha")
		#se ejecuta cuado se suelta la tecla
#	elif Input.is_action_just_released("movimientoIzquierda"):
#		print("Izquierda")

export var velocidad = Vector2(150.0,150.0)
export var aceleracionCaida = 400
export var fuerzaSalto = 3000
export var fuerzaRebote = 350
export var impulso = -3800 

var movimiento = Vector2.ZERO
var FuerzadeSaltoOriginar
var aceleracionCaidaOriginar
var puedeMoverse = true

onready var animaion = $Animacion
onready var audioSalto = $AudioSalto
onready var camara = $Camera2D
onready var enfriamentoPowerUp = $PowerUpSalto
onready var enfriamentoVolar = $PowerUpVolar
onready var animacionPersonaje = $AnimationPlayer

func _ready():
	animacionPersonaje.play("aclarar")
	FuerzadeSaltoOriginar = fuerzaSalto
	aceleracionCaidaOriginar = aceleracionCaida


func _physics_process(_delta):
	movimiento.x = velocidad.x * tomar_direccion()

	caer()
	saltars()
	colisionTecho()
	caidaAlVacio()
# warning-ignore:return_value_discarded
	move_and_slide(movimiento, Vector2.UP)

func tomar_direccion():
	var direccion = 0
	if puedeMoverse:
		direccion = Input.get_action_strength("movimientoDerechar") - Input.get_action_strength("movimientoIzquierda")
		if direccion == 0:
			animaion.play("Idle")
		else:
			animaion.play("Correr")
			if direccion < 0:
				animaion.flip_h = true
			else:
				animaion.flip_h = false
	return direccion
	
func caer():
	if not is_on_floor():
		animaion.play("Saltar")
		movimiento.y += aceleracionCaida
		movimiento.y = clamp(movimiento.y, impulso,velocidad.y)
		
	
func saltars():
	if Input.is_action_just_pressed("salto") and is_on_floor() and puedeMoverse:
		audioSalto.play()
		animaion.play("Saltar")
		saltaMovimiento()
		
		
func saltaMovimiento():
	movimiento.y = 0
	movimiento.y -= fuerzaSalto
	
		
func colisionTecho():
	if is_on_ceiling():
		movimiento.y = fuerzaRebote

func impulsar():
	movimiento.y = impulso
	
func cambiarFuerzaDeSalto():
	enfriamentoPowerUp.start()
	FuerzadeSaltoOriginar = -impulso * 0.9

func volar():
	enfriamentoVolar.start()
	aceleracionCaida = 60
	animacionPersonaje.play("Volar")
	saltaMovimiento()
	

func caidaAlVacio():
	if position.y > camara.limit_bottom:
		respawn()
	
func respawn():
	DatosPlayer.restarVidas()
	animacionPersonaje.play("Oscurecer")
	if DatosPlayer.vidas >= 1:
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()




func _on_PowerUpSalto_timeout():
	fuerzaSalto = FuerzadeSaltoOriginar


func _on_PowerUpVolar_timeout():
	animacionPersonaje.play("default")
	aceleracionCaida = aceleracionCaidaOriginar

func playEntrarPortal(posicionPortal):
	puedeMoverse = false
	animacionPersonaje.play("EntrarPortal")
	$Tween.interpolate_property(
		self,
		"global_position",
		global_position,
		posicionPortal,
		0.8,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT
	)
	$Tween.start()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "EntrarPortal":
		animacionPersonaje.play("Oscurecer")
