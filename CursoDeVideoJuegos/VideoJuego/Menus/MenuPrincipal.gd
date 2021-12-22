extends Control

func _ready():
	DatosPlayer.reset()

func _on_BotonIniciarJuego_pressed():
	MusicaGlobal.replay()
	get_tree().change_scene("res://VideoJuego/Niveles/Nivel1_v2.tscn")

