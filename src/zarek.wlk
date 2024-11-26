import wollok.game.*
import elementos.*
import interfaz.*
import mapa.*

object zarek {
    var property image = "zarek.png"
    var property position = game.at(6, 6)

    var property tieneCorazon = false
    var property tieneEspada = false
    var property tieneLlave = false
	var property tieneHacha = false


    //var property orientacion = 0

    //Agregado para Reiniciar 25/11/2024
    method iniciar(){
        tieneCorazon = false
        tieneEspada = false
        tieneLlave = false
        tieneHacha = false
        position = game.at(6, 6)
        image = "zarek.png" // Se agrego su imagen al iniciar() para reinicio completo.
        game.addVisual(self)
    }
    
    method leerMensaje(unPersonaje){
        unPersonaje.msg()
    }

    method interactuarCon(unElemento){
        unElemento.interaccion()
    }

    //   method position() = if (centrado) game.center() else game.origin()

    method tomarCorazon(){
        self.tieneCorazon(true)
        game.removeVisual(corazon) // Deberia ser: espada.remover() ? ?
        game.sound("RecogeObjetos.mp3").play()
    }

	method tomarHacha(){
		self.tieneHacha(true)
		game.removeVisual(hacha)
        game.sound("RecogeObjetos.mp3").play()
	}

    method tomarEspada(){
        self.tieneEspada(true)
        espada.remover() // Idem metodo anterior, ver cual queda.
        image = "zarekConEspada1.png"   
        game.sound("RecogeObjetos.mp3").play()
    }

    method tomarLlave(){
        self.tieneLlave(true)
        llave.remover()
        game.sound("RecogeObjetos.mp3").play()
    }

    method moverArriba(){
        const tempPos = game.at(position.x(), 10.min(position.y() + 1))
        self.position(tempPos) //game.at(position.x(), 10.min(position.y() + 1))
        image = "zarekEspalda2.png"
        game.sound("paso1seg.mp3").play()
    }

    method moverAbajo(){
        const tempPos = game.at(position.x(), 10.min(position.y() - 1))
        self.position(tempPos)
		image = if (tieneEspada) "zarekConEspada1.png" else if (tieneHacha) "zarekConHacha.png" else "zarek.png"
        game.sound("paso1seg.mp3").play()
    }

    method moverDer(){
        const tempPos = game.at(position.x() +1, 10.min(position.y()))
        self.position(tempPos)
		image = "zarekCostado.png"
        game.sound("paso1seg.mp3").play()
    }

    method moverIzq(){
        const tempPos = game.at(position.x() -1, 10.min(position.y()))
        self.position(tempPos)
	    image = "zarekCostadoIzq.png"
        game.sound("paso1seg.mp3").play() // Se agrego en todas las direcciones el sonido de paso 22/11/2024.
    }

    method position(prediccionPosicion){
	    var area = []
    
	    //Colisiones:
	
		//Se llena una colección con los objetos que hayan en la posición predecida, se filtra a través de un identificador:
		area = game.getObjectsIn(prediccionPosicion).filter({ visual => visual.esColisionable()})
			
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

        //game.onCollideDo(ogro, {zarek => zarek.interactuarCon(ogro)})
        //game.onCollideDo(puerta, {zarek => zarek.interactuarCon(puerta)})
		//game.onCollideDo(arbolRio, {zarek => zarek.interactuarCon(arbolCaido)})
		game.onCollideDo(principe, {zarek => zarek.interactuarCon(principe)}) // Se le debe agregar trigger ? para que quede igual al resto?

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