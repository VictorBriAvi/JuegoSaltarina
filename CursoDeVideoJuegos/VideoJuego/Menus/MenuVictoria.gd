extends Control

func _ready():
	$PanelPuntaje/puntaje.text = "puntaje: {p}".format({"p": DatosPlayer.generalPuntaje()})
	


func _on_BotonMenuPrincipal_pressed():
	get_tree().change_scene("res://VideoJuego/Menus/MenuPrincipal.tscn")
