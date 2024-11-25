import wollok.game.*
import elementos.*
import interfaz.*

// 	 1 piedra , 2 (arbol), 9 espada,15 agua
//  12 rio vertical ,13 rio horizontal, 14r rio codo, 12 cartel

	object estructuraDificil{
		var property estructura = [
			0 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 ,12 , 1 , 1,  1, 1 ,
			    
			1 , 1 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 2 , 2 , 2 , 2 , 2 , 0 , 0 , 0 , 0 , 0 ,12 , 1 , 0 , 0, 1 ,
			                          
			1 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 2 , 0 , 0 , 0 , 2 , 0 , 0 , 0 , 0 , 0 ,12 , 0 , 0 ,10, 1 ,
			                           
			1 , 1 , 8 , 1 , 1 , 1 , 0 , 0 , 0 , 0 , 0 , 2 , 2 , 2 , 0 , 2 , 0 , 0 , 0 , 0 , 0 ,12, 10 , 0,  0, 1 ,
			                           
			1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ,14 ,13 ,13 ,13, 13,
			                          
			1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0, 1 ,

			1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 0 , 0, 1 ,
			                           
			12, 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0, 1 ,
			                           
			1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 11 , 0 , 0 , 0 , 0 , 0 , 0 , 0  , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0, 1,
			                           
			1 , 2 , 2 , 2 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 13, 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0, 1 ,
			                           
			1 , 0,  0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 0 , 0, 1 ,
			                           
			1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1, 1 
		]
	}

	object estructuraInicio{ //	Deprecated
		var property estructura = [
			1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 ,
			    
			1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 ,
			                          
			1 , 0 , 1 , 1 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 1 , 1 , 0 , 0 , 1 ,
			                           
			1 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 1 ,
			                           
			1 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 1 ,
			                          
			1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 ,
			                           
			1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 ,
			                           
			1 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 1 ,
			                           
			1 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 1 ,
			                           
			1 , 0 , 1 , 1 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 1 , 1 , 0 , 0 , 1 ,
			                           
			1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 ,
			                           
			1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1
		]
}

/*	pre pantalla : encontra la forma de rescatar al principe
	 ///SPOILER///
	 1 zarek es una princesa que quiere rescatar a su principe atrapado por un 
	ogro(el principe no pude puede combatirlo porque le da ansiedad el color verde ) 
	para eso debe hallar la llave de la armeria donde se encuentra la espada.
	lamentablemente la llave se encuentra en una isla. para alcanzarla 
	debera derribar el arbol cercano al rio y usarlo como puente. Para tomar la llave 
	debera cruzar rio derribando el abol cercano usando el hacha, que esta en posesion de un duende!
	Para que el duende le de el hacha debera contestar una pregunta. 
	Logrado todo esto tomara la espada para derrotar al ogro y salvar al principe.
	Pero el principe no va estar convencido asi que zarek debera conquistarlo, para eso debera tener
	el corazon del principe, que como es ditraido, se lo dejo por algun lugar del bosque. 


	Dificil: 
		tiempo -30%
		El corazon, va estar en la jaula de pepita una vez la liberen. 
		La prgunta del duende es mas dificil
		Cuando tacas al ogro con la espada no tiene filo, hay que afilarla en la pirdra de afilar		
		
*/

object mapping{	
	method limpiar(){
		game.allVisuals().forEach{visuales =>
			game.removeVisual(visuales)
		}
	}
	
	method dibujar(unMapa){
		
        var x = 0
        var y = game.height() - 1
        	
        unMapa.forEach{ rastreador =>
           
            if (x == game.width()){
                x = 0
                y -= 1
            }
                
            if(rastreador == 1){
            	const pared = new Piedra(position = game.at(x, y), image = "pedruzco.png")
            	game.addVisual(pared)
            }

			if (rastreador == 2){
				const arbol = new Arbol(position = game.at(x, y), image = "arbol.png")
				game.addVisual(arbol)
			}
       		x += 1
        }
    }
}

object isla{
	method init(){
		game.addVisual(new Rio(position = game.at(21, 11), image = "rioVertical.png"))
		game.addVisual(new Rio(position = game.at(21, 10), image = "rioVertical.png"))
		game.addVisual(new Rio(position = game.at(21, 8), image = "rioVertical.png"))

		game.addVisual(new Rio(position = game.at(21, 7), image = "rioCodo.png"))

		game.addVisual(new Rio(position = game.at(22, 7), image = "rioHorizontal.png"))
		game.addVisual(new Rio(position = game.at(23, 7), image = "rioHorizontal.png"))
		game.addVisual(new Rio(position = game.at(24, 7), image = "rioHorizontal.png"))
		game.addVisual(new Rio(position = game.at(25, 7), image = "rioHorizontal.png"))
	}
}




//	Se puede hacer clase "elementosDelMapa" y usar como interfaz.
//	Para: Corazon, prision, espada, rio, piedra, arbol
//	Pasar a archivo "paredes.wlk", renombrar a "elementos".
