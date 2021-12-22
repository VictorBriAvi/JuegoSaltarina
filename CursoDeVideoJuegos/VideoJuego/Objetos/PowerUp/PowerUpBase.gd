extends Area2D

onready var animacion = $AnimationPlayer
onready var detectoPersonaje = $CollisionShape2D


func _on_body_entered(body):
	aplicarPowerUp(body)
	detectoPersonaje.set_deferred("disable",true)
	animacion.play("Consumir")

# warning-ignore:unused_argument
func aplicarPowerUp(body):
	pass
