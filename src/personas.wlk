import marcasJarras.*

class Persona {
	var property peso
	var property jarrasCompradas = []
	var property leGustaMusicTrad
	var property nivelAguante
	var property nacionalidad
	var property marcasQueGusstan = #{}
	method agregarMarca(marca){
		if(nacionalidad.leGusta()) {marcasQueGusstan.add(marca)}
	}
	method totalAlcoholIngerido(){
		return jarrasCompradas.sum({
			jarra=>jarra.alcoholPorJarra()
		})
	}
	method estaEbria(){
		return self.totalAlcoholIngerido()*self.peso() > self.nivelAguante()
	}
}
object belga{
	method leGusta(marca){
		return marca.lupulo() > 4
	}
}
object checo{
	method leGusta(marca){
		return marca.graduacion() > 8
	}
}
object aleman{
	method leGusta(marca){
		return true
	}
}