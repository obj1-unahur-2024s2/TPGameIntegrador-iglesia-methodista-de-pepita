import wollok.game.*
import mapa.*
import interfaz.*
import zarek.*
import level.*

object ogro {
    var property position = game.at(16, 2)
    var property image = "ogro.png"
    var property nombre = "ogro"

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
    var property nombre = "invisible"

    method msg(){
        var texto = "                                                                       Necesitas una espada para derrotar al Ogro."
        if (zarek.tieneEspada()){
            texto = "                                                                       Derrota al Ogro ! ! !"
			
        }
        const mensaje = new Mensaje(text = texto)
        game.addVisual(mensaje)
        game.schedule(5000, {game.removeVisual(mensaje)})
    }
}


object principe {
    var property position = game.at(21, 4)
    var property image = "principe2.png"
	var property nombre = "principe"

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
	var property nombre = "principe"

	method msg(){
		var texto = "                                                                       Necesitas el corazón para conquistar al principe ♥."

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
	var property nombre = "principe"

	method msg(){
		var texto = "                                                                       Necesitas el corazón para conquistar al principe ♥."

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
}

object triggerDuende {
	var property position = game.at(3, 1)
	var property image = "noImg.png"
	var property nombre = "invisible"

	method msg(){
    	var texto = "                                                                       Decime los primeros 3 decimales de π (pi)."
		image = "noNum.png"

		if(image == "noNum.png"){
			position = game.at(8, 4)
			keyboard.num1().onPressDo({
				image = "1.png"
				keyboard.num4().onPressDo({
					image = "14.png"
					keyboard.num1().onPressDo({
						image = "141.png"
						duende.position(game.at(3, 3))
						game.removeVisual(self)
					})
				})
			})
		}
    	const mensaje = new Mensaje(text = texto)
    	game.addVisual(mensaje)
    	game.schedule(4000, {game.removeVisual(mensaje)})
	}
}

object corazon {
    var property position = game.at(12, 9)
    var property image = "corazon.png"
	var property nombre = "corazon"

	method remover(){
		game.removeVisual(self)
	}
}

object espada {
	var property position = game.at(4, 10)
	var property image = "espada.png"
	var property nombre = "espada"

	method remover(){
		game.removeVisual(self)
	}
}

object hacha {
	var property position = game.at(1, 1)
	var property image = "hacha.png"
	var property nombre = "hacha"

	method remover(){
		game.removeVisual(self)
	}
}

object puerta{
	var property position = game.at(2, 8)
	var property image = "cerreada.png"
	var property nombre = "puerta"
	var property estado = "cerrada"

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
			image = "abierta.png"
			estado = "abierta"
			game.sound("Puerta.mp3").play()
		}
		
	}
}

object triggerPuerta{
	var property position = game.at(2, 7)
	var property image = "noImg.png"
	var property nombre = "triggerPuerta"

	method msg(){
    	var texto = "                                                                       Necesitas la llave para abrir la puerta."
    	if (zarek.tieneLlave()){
    	    texto = "                                                                       Puede Avanzar"
    	}
    	const mensaje = new Mensaje(text = texto)
    	game.addVisual(mensaje)
    	game.schedule(3500, {game.removeVisual(mensaje)})
	}
}

object llave{
	var property position = game.at(23, 9)
	var property image = "llave.png"
	var property nombre = "llave"

	method remover(){
		game.removeVisual(self)
	}
}

object arbolCaido{
	var property position = game.at(20, 9)
	var property image = "arbol.png"
	var property nombre = "arbolCaido"

	method interaccion(){
		if (zarek.tieneHacha()){
			image = "arbolCaido.png"
			nombre = "arbolCaido"
			game.sound("HachaCortaArbol.mp3").play() // Sonido agregado.
			game.removeVisual(rioCollide)
			zarek.tieneHacha(false)
		} else {
			zarek.moverAbajo()
		}
	}
}

object triggerArbol1{   // Cuando vuelve de agarrar la llave, hace un movimiento en diagonal al pasar por el arbol. Arreglar!!!
	var property position = game.at(20, 8)
	var property image = "noImg.png"
	var property nombre = "arbol"

	method msg(){
		var texto = "                                                                       Necesito un hacha para cortar el arbol."

		if (zarek.tieneHacha()){
			texto = "                                                                       Corta el arbol ! ! !"
			game.removeVisual(self)
			game.removeVisual(triggerArbol2)

		}

		const mensaje = new Mensaje(text = texto)
        game.addVisual(mensaje)
        game.schedule(5000, {game.removeVisual(mensaje)})
	}
}

object triggerArbol2{
	var property position = game.at(19, 9)
	var property image = "noImg.png"
	var property nombre = "arbol"

	method msg(){
		var texto = "                                                                       Necesito un hacha para cortar el arbol."

		if (zarek.tieneHacha()){
			texto = "                                                                       Corta el arbol ! ! !"
			game.removeVisual(self)
			game.removeVisual(triggerArbol1)
		}

		const mensaje = new Mensaje(text = texto)
        game.addVisual(mensaje)
        game.schedule(5000, {game.removeVisual(mensaje)})
	}
}

object rioCollide {
	var property position = game.at(21, 9)
	var property image = "rioVertical.png"
	var property nombre = "rioCollide"
}

class Arbol{
	var property position
	var property image = "arbol.png"
}

class Rio{
	var property position
	var property image
}