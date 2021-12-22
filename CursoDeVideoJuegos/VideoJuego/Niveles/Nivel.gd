extends Node

signal abrirPortal()

export var menuGameOver = "res://VideoJuego/Menus/MenuGameOver.tscn"
export var nivelActual = ""

var numeroLlave = 0
var contenedoLlaves

onready var nubesLejanas = $ParallaxBackground/ParallaxNubesLejanas

func _ready():
# warning-ignore:return_value_discarded
	DatosPlayer.connect("gameOver",self, "gameOver")
	contenedoLlaves = get_node_or_null("zanahoriasLLave")
	if contenedoLlaves != null:
		numeroLLavesNivel()
		
#func _process(delta):
	#nubesLejanas.motion_offset.x -= 5

func numeroLLavesNivel():
	numeroLlave = contenedoLlaves.get_child_count()
	DatosPlayer.contabilizarLLaves(numeroLlave)
	for llave in contenedoLlaves.get_children():
		llave.connect("consumida", self, "llavesRestante")
	
	
func llavesRestante():
	numeroLlave -= 1
	if numeroLlave == 0:
		emit_signal("abrirPortal")


func gameOver():
	DatosPlayer.nivelActual = nivelActual
# warning-ignore:return_value_discarded
	get_tree().change_scene(menuGameOver)
