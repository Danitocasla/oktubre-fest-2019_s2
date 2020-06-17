import marcasJarras.*

class Persona {
	var property peso
	var property jarrasCompradas = []
	var property leGustaMusicTrad
	var property nivelAguante
	var property nacionalidad
	var property marcasQueGusstan = #{}
	method agregarMarca(marca){
	//	marcasQueGusstan.add(marca)
	}
	method estaEbria(){
		return jarrasCompradas.sum({
			jarra=>jarra.alcoholPorLitro()
		})*self.peso() > self.nivelAguante()
	}
}
