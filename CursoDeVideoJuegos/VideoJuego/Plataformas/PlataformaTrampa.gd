extends StaticBody2D

# warning-ignore:unused_argument
func _on_DetectoPersonaje_body_entered(body):
	$DetectoPersonaje/CollisionShape2D.set_deferred("disable",true)
	$AnimationPlayer.play("caer")


func deshabilitarColisionador():
	$Colisionador.set_deferred("disable",true)
	
