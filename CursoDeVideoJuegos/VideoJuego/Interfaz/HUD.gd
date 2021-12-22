extends Control

onready var etiquetaVidas = $contenedorVidas/Cantidad

onready var etiquedaMonedaOro = $contenedorMonedaOro/Cantidad
onready var etiquetaMonedaPlata = $contenedorMonedaPlata/Cantidad
onready var etiquetaMonedaBronce = $contenedorMonedasBronce/Cantidad

onready var etiquetaLlaves = $contenedorLlaves/Cantidad


func _ready():
# warning-ignore:return_value_discarded
	DatosPlayer.connect("actualizarDatos", self, "actualizarHUD")
	actualizarHUD()

func actualizarHUD():
	etiquetaVidas.text = "%s" % DatosPlayer.vidas
	
	etiquetaMonedaBronce.text = "%s" % DatosPlayer.monedasBronce
	etiquetaMonedaPlata.text = "%s" % DatosPlayer.monedasPlata
	etiquedaMonedaOro.text = "%s" % DatosPlayer.monedasOro
	
	etiquetaLlaves.text = "%s" % DatosPlayer.llaves
