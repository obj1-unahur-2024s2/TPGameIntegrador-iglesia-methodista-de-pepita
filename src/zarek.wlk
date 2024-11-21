import wollok.game.*
import mapa.*
import interfaz.*
import elementos.*

object zarek {
    var property image = "zarek.png"
    var property position = game.at(6, 6)

    var property tieneCorazon = false
    var property tieneEspada = false
    var property tieneLlave = false
	var property tieneHacha = false


    //var property orientacion = 0

    method leerMensaje(unPersonaje){
        unPersonaje.msg()
    }

    method interactuarCon(unElemento){
        unElemento.interaccion()
    }

    //   method position() = if (centrado) game.center() else game.origin()

    method tomarCorazon(){
        self.tieneCorazon(true)
        game.removeVisual(corazon) // Deberia ser: espada.remover() ? ? ?
    }

	method tomarHacha(){
		self.tieneHacha(true)
		game.removeVisual(hacha)
	}

    method tomarEspada(){
        self.tieneEspada(true)
        espada.remover() // Idem metodo anterior, ver cual queda.
        image = "zarekConEspada1.png"   
    }

    method tomarLlave(){
        self.tieneLlave(true)
        llave.remover()
    }

    method moverArriba(){
        const tempPos = game.at(position.x(), 10.min(position.y() + 1))
        self.position(tempPos) //game.at(position.x(), 10.min(position.y() + 1))
        image = "zarekEspalda2.png"
    }

    method moverAbajo(){
        const tempPos = game.at(position.x(), 10.min(position.y() - 1))
        self.position(tempPos)
		image = if (tieneEspada) "zarekConEspada1.png" else if (tieneHacha) "zarekConHacha.png" else "zarek.png"
    }

    method moverDer(){
        const tempPos = game.at(position.x() +1, 10.min(position.y()))
        self.position(tempPos)
		image = "zarekCostado.png"
    }

    method moverIzq(){
        const tempPos = game.at(position.x() -1, 10.min(position.y()))
        self.position(tempPos)
	    image = "zarekCostadoIzq.png"
    }

    method position(prediccionPosicion){
	    var area = []
    
	    //Colisiones:
	
		//Se llena una colección con los objetos que hayan en la posición predecida, se filtra a través de un identificador:
		area = game.getObjectsIn(prediccionPosicion).filter({ visual => visual.nombre() == "pared"})
			
		//Si no se detecta ninguna pared con la colección, simplemente pase a la posición predecida:
		if (area.size() == 0){
			position = prediccionPosicion
		}
    }
}

object controlDeColisiones {
    method init(){
        game.onCollideDo(corazon, {zarek => zarek.tomarCorazon()})
        game.onCollideDo(espada, {zarek => zarek.tomarEspada()})
        game.onCollideDo(llave, {zarek => zarek.tomarLlave()})
        game.onCollideDo(hacha, {zarek => zarek.tomarHacha()})

        game.onCollideDo(ogro, {zarek => zarek.interactuarCon(ogro)})
        game.onCollideDo(puerta, {zarek => zarek.interactuarCon(puerta)})
		game.onCollideDo(arbolCaido, {zarek => zarek.interactuarCon(arbolCaido)})
		game.onCollideDo(principe, {zarek => zarek.interactuarCon(principe)})

        //  msgTriggers
        //game.onCollideDo(zarek, {zarek => zarek.mensajeOgro()})
        game.onCollideDo(triggerOgro, {zarek => zarek.leerMensaje(triggerOgro)})
        game.onCollideDo(triggerPuerta, {zarek => zarek.leerMensaje(triggerPuerta)})
        game.onCollideDo(triggerArbol1, {zarek => zarek.leerMensaje(triggerArbol1)})
        game.onCollideDo(triggerArbol2, {zarek => zarek.leerMensaje(triggerArbol2)})
		game.onCollideDo(triggerDuende, {zarek => zarek.leerMensaje(triggerDuende)})
		game.onCollideDo(triggerPrincipe1, {zarek => zarek.leerMensaje(triggerPrincipe1)})
		game.onCollideDo(triggerPrincipe2, {zarek => zarek.leerMensaje(triggerPrincipe2)})
    }
}