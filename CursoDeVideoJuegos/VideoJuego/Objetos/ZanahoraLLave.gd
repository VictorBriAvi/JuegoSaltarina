extends Area2D

signal consumida()

# warning-ignore:unused_argument
func _on_body_entered(body):
	DatosPlayer.restarLLaves()
	emit_signal("consumida")
	$DetectorPersonaje.set_deferred("disable",true)
	$AnimationPlayer.play("consumir")
