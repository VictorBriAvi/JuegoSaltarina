extends Control

var nivelActual = ""

func _ready():
	nivelActual = DatosPlayer.nivelActual
	DatosPlayer.reset()

func _on_BotonMenuPrincipal_pressed():
	get_tree().change_scene("res://VideoJuego/Menus/MenuPrincipal.tscn")


func _on_BotonReiniciar_pressed():
	get_tree().change_scene(nivelActual)
