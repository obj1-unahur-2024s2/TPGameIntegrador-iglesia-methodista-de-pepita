import zarek.*
import level.*

object keyConfig {
    method init(){
        keyboard.up().onPressDo({
            zarek.moverArriba()
        })

        keyboard.down().onPressDo({
            zarek.moverAbajo()
        })

        keyboard.right().onPressDo({
            zarek.moverDer()
        })

        keyboard.left().onPressDo({
            zarek.moverIzq()
        })
    }
}

object timer{
    var property position = game.at(0, 11)
    var property image = "reloj1.png"
}

object paleta {
	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"
    const property negro = "00000000"
}


object reloj {
	var tiempo = 60
    var property textColor = paleta.verde()
	
	method text() = tiempo.toString()
    //method textColor() = paleta.verde()
    
	method position() = game.at(0, game.height()-1)
	
	method pasarTiempo() {
		self.avisarPocoTiempo()
        tiempo = 0.max(tiempo - 1)
        self.detenerEn(0)
        if (tiempo == 0){
            gameOver.init()
        }
	}
	method iniciar(){
		tiempo = 60
		game.onTick(1000, "tiempo", {self.pasarTiempo()})
        textColor = paleta.verde()
	}
	method detenerEn(cantidad){
        if(cantidad == tiempo)
		    game.removeTickEvent("tiempo")
        
	}

    method perderJuegoPorReloj(){
        if (tiempo == 0){
            textColor = paleta.negro()
            gameOver.init()
        }
    }

    method avisarPocoTiempo(){
        if (tiempo == 11){
            textColor = paleta.rojo()
        }
    }
}


// Objeto mensaje para Interfaz:
class Mensaje {
    var property text = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    var property textColor = paleta.negro()
    var property image = "msgBox.png"
    var property position = game.at(7, 0)

    //method position() = game.at(3 , 3)

    //method escribir(){
    //    game.addVisual(self)
    //    //game.text(text)
    //}
    
    //method borrarMsg(){
    //    text = ""
    //}
}