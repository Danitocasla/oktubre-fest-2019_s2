import nacionalidades.*

class Cerveza{
	var property lupulo   // gramos por litro
	var property pais     // de origen
	method graduacion()   // clase abstracta que convierte a Cerveza en Clase abstracta
}

class Rubia inherits Cerveza{
	var property graduacion = 0 // porcentaje de alcohol en volumen expresado en numero. Ejemplo 10% == 10
}

object graduacion{
	var property reglamentaria = 0
}

class Negra inherits Cerveza{
	override method graduacion(){ return (graduacion.reglamentaria().min(self.lupulo()*2)) }
}

class Roja inherits Negra{
	override method graduacion() = return super()*1.25
}

class Jarra{
	var property capacidad // capacidad en litros
	var property marca     //de cerveza
	
	method alcoholPorJarra() = return self.marca().graduacion()/100 * self.capacidad()
}
