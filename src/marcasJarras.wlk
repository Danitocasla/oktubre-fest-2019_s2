
class Cerveza{
	var property lupulo   // gramos por litro
	var property pais     // origen de fabricacion
}

class Corona inherits Cerveza{
	var property graduacion  // porcentaje de alcohol en volumen
}

object reglamentaria{
	var property graduacion = 0
}

class Guiness inherits Cerveza{
	method graduacion(){
		return reglamentaria.graduacion() + self.lupulo()*2
	}
}
class Hofbrau inherits Guiness{
	override method graduacion(){
		return super()*1.25
	}
}
class Jarra{
	var property capacidad // capacidad en litros
	var property marca
	var property contiene  // cerveza que contiene
	method alcoholPorJarra(){
		return contiene.graduacion()/100 * self.capacidad()
	}
}
