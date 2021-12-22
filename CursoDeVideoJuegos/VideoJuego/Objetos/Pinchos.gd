extends Area2D

export var esTrampa = false

onready var detectorPersonaje = $detectoPersonaje

var coloTrampa = Color.purple

func _ready():
	if esTrampa:
		$Sprite.modulate = coloTrampa
		detectorPersonaje.enabled = true
		


# warning-ignore:unused_argument
func _process(delta):
	
	if detectorPersonaje.is_colliding():
		detectorPersonaje.set_deferred("enabled", false)
		$AnimationPlayer.play("caer")
	
func _on_body_entered(body):
	body.respawn()
