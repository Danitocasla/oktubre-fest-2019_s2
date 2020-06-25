import marcasJarras.*
import personas.*
import nacionalidades.*
import error.*

class CarpaCervecera {
	var property limitePersonas
	var property marcaCerveza
	var property tieneBanda
	var property jarrasVendidas = [] //ver si se usa
	var property personasIngresadas = #{}
	
	method tieneCantidadPar() = personasIngresadas.size().even()
	method condicionMusical(persona){
		return (persona.escuchaMusica() and self.tieneBanda())
			or (not persona.escuchaMusica() and not self.tieneBanda())
	}
	/*method quiereEntrar(persona){
		return persona.leGusta(self.marcaCerveza())
			and self.condicionMusical(persona)
	}*/
	method dejaEntrar(persona){
		return not persona.estaEbria() and personasIngresadas.size()+1 <= limitePersonas
	}
	method puedeEntrar(persona){
		return persona.quiereEntrar(self) and self.dejaEntrar(persona)
	}
	method entre(persona){
		if (self.puedeEntrar(persona))
		{
			personasIngresadas.add(persona)
			persona.agregarMarca(self.marcaCerveza())
		}
		else
		{
			throw new UserExeption(message = "NO_CUMPLE_CONDICIONES_DE_INGRESO")
		}
	}
	method validar(persona){
		return personasIngresadas.contains(persona)
	}
	method servirJarra(persona, capacidad){
		const jarra = new Jarra(capacidad= capacidad, marca = marcaCerveza)
		if(self.validar(persona)){	
			persona.jarraComprada(jarra)
			persona.agregarMarca(jarra.marca())
			jarrasVendidas.add(jarra)
		}
		else{
			throw new UserExeption(message = "NO_SE_ENCUENTRA_PERSONA_EN_CARPA")
		}
	}
	method ebriosEmpedernidos(){
		return personasIngresadas.filter({pers=>pers.ebrioEmpedernido()}).size()
	}
	// REQUERIMIENTOS AVANZADOS
	method personasCompatibles(persona1,persona2){
		return persona1.soyCompatibleCon(persona2)
	}
	
}