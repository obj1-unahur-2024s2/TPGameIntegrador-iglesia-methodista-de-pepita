import wollok.game.*
import interfaz.*
import zarek.*
import level.*
import mapa.*


object ogro {
    var property position = game.at(16, 2)
    var property image = "ogro.png"
    var property esColisionable = true

	method iniciar(){
		game.addVisual(self)
		position = game.at(16, 2)
		image = "ogro.png"
	}

    method morir(){
        position = game.at(17, 3)
        image = "ogroMuerto.png"
		game.sound("MuerteOgro.mp3").play()
    }

    method interaccion(){
        if (zarek.tieneEspada()){
            self.morir()
            game.removeVisual(triggerOgro)
			zarek.tieneEspada(false)
        } else {
            zarek.moverIzq()
        }
    }
}

object triggerOgro {
    var property position = game.at(15, 2)
    var property image = "noImg.png"
    var property esColisionable = false

    method msg(){
        var texto = "                                                                         Necesitas una espada para derrotar al Ogro."
        if (zarek.tieneEspada()){
            texto = "                                                                       Derrota al Ogro ! ! !"
			ogro.interaccion()
        }
        const mensaje = new Mensaje(text = texto)
        game.addVisual(mensaje)
        game.schedule(5000, {game.removeVisual(mensaje)})
    }
}


object principe {
    var property position = game.at(21, 4)
    var property image = "principe2.png"
	var property esColisionable = false

	method interaccion(){
		if (zarek.tieneCorazon()){
			gameEnd.init()
		} else {
			zarek.moverAbajo()
		}
	}
}

object triggerPrincipe1{
	var property position = game.at(21, 3)
	var property image = "noImg.png"
	var property esColisionable = false

	method msg(){
		var texto = "                                                                             Necesitas el corazón para conquistar al principe ♥."

		if (zarek.tieneCorazon()){
			texto = "                                                                       ♥ Conquistaste al principe ♥"
		}

		const mensaje = new Mensaje(text = texto)
        game.addVisual(mensaje)
        game.schedule(5000, {game.removeVisual(mensaje)})
	}
}

object triggerPrincipe2{
	var property position = game.at(20, 4)
	var property image = "noImg.png"
	var property esColisionable = false

	method msg(){
		var texto = "                                                                             Necesitas el corazón para conquistar al principe ♥."

		if (zarek.tieneEspada()){
			texto = "                                                                       ♥ Conquistaste al principe ♥"
		}

		const mensaje = new Mensaje(text = texto)
        game.addVisual(mensaje)
        game.schedule(5000, {game.removeVisual(mensaje)})
	}
}

object duende {
	var property position = game.at(2, 1)
	var property image = "duende.png"
	var property esColisionable = true

	method iniciar(){
		position = game.at(2, 1)
	}
}

object triggerDuende {
	var property position = game.at(3, 1)
	var property image = "noImg.png"
	var property esColisionable = false

	method iniciar(){
		position = game.at(3, 1)
		image = "noImg.png"
	}

	method msg(){
    	var texto = "                                                                         Decime los primeros 3 decimales de π (pi)."
    	const mensaje = new Mensaje(text = texto)

		game.addVisual(mensaje)
		game.schedule(4000, {game.removeVisual(mensaje)})

		game.addVisual(input)
		input.init()
	}
}

object input{
	var property position = game.at(8, 4)
	var property image = "noNum.png"
	var property esColisionable = false

	method init(){		
		image = "noNum.png"
		
		keyboard.num1().onPressDo({
			image = "1.png"
			keyboard.num4().onPressDo({
				image = "14.png"
				keyboard.num1().onPressDo({
					image = "141.png"
					game.removeVisual(duende)
					image = "noImg.png"
				})
			})
		})
	}
}
object corazon {
    var property position = game.at(12, 9)
    var property image = "corazon.png"
	var property esColisionable = false

	method remover(){
		game.removeVisual(self)
	}
}

object espada {
	var property position = game.at(4, 10)
	var property image = "espada.png"
	var property esColisionable = false

	method remover(){
		game.removeVisual(self)
	}
}

object hacha {
	var property position = game.at(1, 1)
	var property image = "hacha.png"
	var property esColisionable = false

	method remover(){
		game.removeVisual(self)
	}
}

object puerta{
	var property position = game.at(2, 8)
	var property image = "cerreada.png"
	var property esColisionable = true
	var property estado = "cerrada"

	method iniciar(){
		position = game.at(2, 8)
		image = "cerreada.png"
		//nombre = "puerta"
		estado = "cerrada"
		esColisionable = true
		game.removeVisual(puertaAbierta)
	}

	method interaccion(){
		if (zarek.tieneLlave()){ 
			self.abrirPuerta() // Arreglado. Puerta abierta suena en cada interaccion.
			game.removeVisual(triggerPuerta)
		} else {
			zarek.moverAbajo()
		}
	}

	method abrirPuerta(){
		if (estado == "cerrada"){
			estado = "abierta"
			game.removeVisual(self)
			game.addVisual(puertaAbierta)
			game.sound("Puerta.mp3").play()
			esColisionable = false
		}
		
	}
}

object puertaAbierta{
	var property position = game.at(2, 8)
	var property image = "abierta.png"
	var property esColisionable = false
}

object triggerPuerta{
	var property position = game.at(2, 7)
	var property image = "noImg.png"
	var property esColisionable = false

	method msg(){
    	var texto = "                                                                       Necesitas la llave para abrir la puerta."
    	if (zarek.tieneLlave()){
    	    texto = "                                                                       Puede Avanzar"
			puerta.interaccion()
    	}
    	const mensaje = new Mensaje(text = texto)
    	game.addVisual(mensaje)
    	game.schedule(3500, {game.removeVisual(mensaje)})
	}
}

object llave{
	var property position = game.at(23, 9)
	var property image = "llave.png"
	var property esColisionable = false

	method remover(){
		game.removeVisual(self)
	}
}

object arbolRio{ // Se cambio el nombre.
	var property position = game.at(20, 9)
	var property image = "arbol.png"
	var property esColisionable = true

	method iniciar(){
		position = game.at(20, 9)
	  	image = "arbol.png"
	}

	method interaccion(){
		if (zarek.tieneHacha()){	
			game.sound("HachaCortaArbol.mp3").play() // Sonido agregado.
			game.removeVisual(self)
			game.addVisual(arbolCaido) // Se agrega el visual del Objeto Arbol caido.
			game.removeVisual(rioCollide)
			zarek.tieneHacha(false)
		} else {
			zarek.moverAbajo()
		}
	}
}

object arbolCaido{ // Agregado para evitar traspaso de paredes. 25/11/2024
	var property position = game.at(20, 9)
	var property image = "arbolCaido.png"
	var property esColisionable = false
}

object triggerArbol1{   // Cuando vuelve de agarrar la llave, hace un movimiento en diagonal al pasar por el arbol. Arreglar!!!
	var property position = game.at(20, 8)
	var property image = "noImg.png"
	var property esColisionable = false

	method msg(){
		var texto = "                                                                       Necesito un hacha para cortar el arbol."

		if (zarek.tieneHacha()){
			texto = "                                                                       Corta el arbol ! ! !"
			game.removeVisual(self)
			game.removeVisual(triggerArbol2)
			arbolRio.interaccion()
		}

		const mensaje = new Mensaje(text = texto)
        game.addVisual(mensaje)
        game.schedule(5000, {game.removeVisual(mensaje)})
	}
}

object triggerArbol2{
	var property position = game.at(19, 9)
	var property image = "noImg.png"
	var property esColisionable = false

	method msg(){
		var texto = "                                                                       Necesito un hacha para cortar el arbol."

		if (zarek.tieneHacha()){
			texto = "                                                                       Corta el arbol ! ! !"
			game.removeVisual(self)
			game.removeVisual(triggerArbol1)
			arbolRio.interaccion()
		}

		const mensaje = new Mensaje(text = texto)
        game.addVisual(mensaje)
        game.schedule(5000, {game.removeVisual(mensaje)})
	}
}

object rioCollide {
	var property position = game.at(21, 9)
	var property image = "rioVertical.png"
	var property esColisionable = false
}

class Piedra {
	var property position
	var property esColisionable = true
	var property image = "pedruzco.png"
}

class Arbol{
	var property position
	var property image = "arbol.png"
	var property esColisionable = true
}

class Rio{
	var property position
	var property image
	var property esColisionable = true
}