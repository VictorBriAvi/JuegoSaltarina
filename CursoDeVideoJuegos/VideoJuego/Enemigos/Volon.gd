extends Area2D

onready var detectorJugador = $DetectorJugador
onready var detectorPisoton = $DetectorPisoton/Colisionador
onready var animacion = $AnimationPlayer

func _on_DetectorPisoton_body_entered(body):
	#get_tree().paused = true
	desactivarColisionadores([detectorJugador,detectorPisoton])
	animacion.stop()
	animacion.play("Morir")
	body.impulsar()


func _on_body_entered(body):
	body.respawn()

func desactivarColisionadores(colisionadores):
	for colision in colisionadores:
		colision.set_deferred("disable",true)
		colision.set_deferred("visible",false)
