import wollok.game.*
import elementos.*
import interfaz.*
import zarek.*
import mapa.*

object pantallaInicial{
    var property image = "inicioGame123.png"
    var property position = game.at(0, 0)

    method init(){
        // zarek.iniciar()
        // ogro.iniciar()
        // duende.iniciar()
        // puerta.iniciar()
        // arbolRio.iniciar()
        
        game.addVisual(self)
        keyboard.enter().onPressDo({game.sound("InicioJuego.mp3").play(); game.clear(); nivelDificil.init()})
		keyboard.space().onPressDo({game.sound("InicioJuego.mp3").play(); game.clear(); nivelFacil.init()})

    }
}

class Nivel{
    var property estado = "nojugando" 
    method init(){
        estado = "nojugando"
        
        
        game.addVisual(self)

        game.addVisual(corazon)

        
        game.addVisual(principe)
        game.addVisual(espada)
        game.addVisual(llave)
        game.addVisual(puerta)
		game.addVisual(hacha)
		game.addVisual(arbolRio)

        game.addVisual(triggerOgro)
        game.addVisual(triggerPuerta)
		game.addVisual(triggerArbol1)
		game.addVisual(triggerArbol2)
		game.addVisual(rioCollide)
        game.addVisual(triggerPrincipe1)
        game.addVisual(triggerPrincipe2)

        game.addVisual(timer)
        game.addVisual(reloj)
	    reloj.iniciar()

		isla.init()

        zarek.iniciar()
        ogro.iniciar()
        duende.iniciar()
        puerta.iniciar()
        arbolRio.iniciar() // Se movieron aca porque al reiniciar, no cargaban correctamente estos elementos.




        controlDeColisiones.init()

      	keyConfig.init()
    }
}

object nivelFacil inherits Nivel (){
    var property image = "backgroundNivel.png"
    var property position = game.at(0, 0)

    override method init(){
        super()
        reloj.tiempo(75)
        estado = "jugando"
        game.boardGround("backgroundNivel.png")
        mapping.dibujar(estructuraFacil.estructura())
    }
}

object nivelDificil inherits Nivel(){
    var property image = "backgroundNivel.png"
    var property position = game.at(0, 0)
    

    override method init(){
        super()
        reloj.tiempo(60)
        estado = "jugando"
        game.addVisual(duende)
		game.addVisual(triggerDuende)

        game.boardGround("backgroundNivel.png")
        mapping.dibujar(estructuraDificil.estructura())
    }
}

object gameOver {
    var property image = "gameOver.png"
    var property position = game.at(0, 0)

    method init(){
        game.removeTickEvent("tiempo")
        game.clear()
        game.sound("Perdiste.mp3").play()
        game.addVisual(self)
        //  Enter para reiniciar
        //  keyboard.space().onPressDo({game.clear(); nivelDificil.init()})
        //  keyboard.enter().onPressDo({game.clear(); nivelDificil.init()})
        //  R para reiniciar 25/11/2024
        //keyboard.r().onPressDo({game.clear(); game.stop(); nivelDificil.init(); game.start(); zarek.iniciar()})

        // Se cambio porque iniciaba siempre en nivel dificil, ahora reinicia segun el nivel.
        keyboard.r().onPressDo({game.clear(); game.stop();
            if(nivelDificil.estado() == "jugando"){nivelDificil.init()}else{nivelFacil.init()};
            game.start();})
    }
}

object gameEnd {
    var property image = "final.png"
    var property position = game.at(0, 0)

    method init(){
        game.clear() // Descomentado porque se podia seguir moviendo Zarek haciendo ruidos.
        game.removeTickEvent("tiempo")
        game.sound("Ganar.mp3").play()
        game.addVisual(self)
        //keyboard.enter().onPressDo({game.stop()})
        //keyboard.space().onPressDo({game.stop()})

        // Para reiniciar:
        keyboard.space().onPressDo({game.clear(); game.stop(); pantallaInicial.init(); game.start()})
        keyboard.enter().onPressDo({game.clear(); game.stop(); pantallaInicial.init(); game.start()})
    }
}