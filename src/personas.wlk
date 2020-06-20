import marcasJarras.*
import nacionalidades.*

class Persona {
	//clase abstracta
	var property peso
	var property jarrasCompradas = [] // se considera que se toma cada jarra que se compra
	var property escuchaMusica
	var property nivelAguante
	var property marcasQueGustan = #{}
	
	method jarraComprada(jarra) = jarrasCompradas.add(jarra)
	method agregarMarca(marca) = if(self.leGusta(marca)){marcasQueGustan.add(marca)} else {}
	method totalAlcoholIngerido() { 
		return jarrasCompradas.sum({ jarra=>jarra.alcoholPorJarra() })
	}
	method estaEbria() { return self.totalAlcoholIngerido() * self.peso() > self.nivelAguante() }
	method ebrioEmpedernido() {	return jarrasCompradas.all({jarr=>jarr.capacidad()>=1}) }
	method esPatriota()    // para heredar y modificar
	method leGusta(marca)  // para heredar y modificar
}

class Aleman inherits Persona{
	const property pais = alemania
	
	override method esPatriota() { return jarrasCompradas.all({jarr=>jarr.marca().pais()==pais}) }
	override method leGusta(marca) { return true }
}
class Checo inherits Persona{
	const property pais = checoslovaquia
	
	override method esPatriota() { return jarrasCompradas.all({jarr=>jarr.marca().pais()==pais}) }
	override method leGusta(marca) { return marca.graduacion() > 8 }
}
class Belga inherits Persona{
	const property pais = belgica
	
	override method esPatriota() { return jarrasCompradas.all({jarr=>jarr.marca().pais()==pais}) }
	override method leGusta(marca) { return marca.lupulo()>4 }
}