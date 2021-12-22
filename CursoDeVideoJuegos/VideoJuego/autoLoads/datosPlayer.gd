extends Node

signal actualizarDatos()
signal gameOver()

var vidas = 3
var monedasOro = 0
var monedasPlata = 0
var monedasBronce = 0
var llaves = 0
var nivelActual = ""
var puntaje = 0


func reset():
	vidas = 3
	monedasOro = 0
	monedasPlata = 0
	monedasBronce = 0
	puntaje = 0

func generalPuntaje():
	var valorOro = monedasOro * 10
	var valorPlata = monedasPlata * 5
	var valorBronce = monedasBronce * 2
	puntaje = valorOro + valorPlata + valorBronce
	return puntaje

func restarVidas():
	vidas -= 1
	if vidas == 0:
		emit_signal("gameOver")
	emit_signal("actualizarDatos")

func sumarMonedas(moneda):
	match moneda:
		"bronce":
			monedasBronce += 1
		"plata":
			monedasPlata += 1
		"oro":
			monedasOro += 1
		_:
			print("error")
	emit_signal("actualizarDatos")

func restarLLaves():
	llaves -= 1
	emit_signal("actualizarDatos")
	
func contabilizarLLaves(valor):
	llaves = valor
	emit_signal("actualizarDatos")
