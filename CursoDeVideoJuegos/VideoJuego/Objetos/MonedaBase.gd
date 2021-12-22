extends Area2D

export(String, "oro", "plata", "bronce") var tipoMoneda

onready var animacion = $AnimatedSprite
onready var animacionConsumir = $AnimationPlayer
onready var ColisionPersonaje= $ColisionPersonaje



func _ready():
	animacion.play()


# warning-ignore:unused_argument
func _on_body_entered(body):
	DatosPlayer.sumarMonedas(tipoMoneda)
	ColisionPersonaje.set_deferred("disabled",true)
	animacionConsumir.play("Consumir")
