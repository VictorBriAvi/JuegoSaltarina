extends Node2D

onready var detectorJugador = $Sprite/RayCast2D
onready var posicionesDisparo = $Sprite/Posiciones
onready var cadenciaDiparo = $Timer
onready var sfx_rayos = $Rayos

export var rayo: PackedScene

var puedeDisparar = true

# warning-ignore:unused_argument
func _process(delta):
	if detectorJugador.is_colliding() and puedeDisparar:
		disparar()
		puedeDisparar = false
		cadenciaDiparo.start()

func disparar():
	
	sfx_rayos.play()
	
	for posicion in posicionesDisparo.get_children():
			var nuevoRayo = rayo.instance()
			nuevoRayo.crear(posicion.global_position)
			add_child(nuevoRayo)
	



func _on_Timer_timeout():
	puedeDisparar = true
