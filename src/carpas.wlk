import marcasJarras.*
import personas.*
import nacionalidades.*
import error.*

class CarpaCervecera {
	var property limitePersonas
	var property marcaCerveza
	var property tieneBanda
	var property jarrasVendidas = [] //ver si se usa
	var property personasIngresadas = []
	
	method condicionMusical(persona){
		return (persona.escuchaMusica() and self.tieneBanda())
			or (not persona.escuchaMusica() and not self.tieneBanda())
	}
	method quiereEntrar(persona){
		return persona.leGusta(self.marcaCerveza())
			and self.condicionMusical(persona)
	}
	method dejaEntrar(persona){
		return not persona.estaEbria() and personasIngresadas.size()+1 <= limitePersonas
	}
	method puedeEntrar(persona){
		return self.quiereEntrar(persona) and self.dejaEntrar(persona)
	}
	method entre(persona){
		if (self.quiereEntrar(persona) and self.puedeEntrar(persona))
		{
			personasIngresadas.add(persona)
			persona.agregarMarca(self.marcaCerveza())
		}
		else if(self.quiereEntrar(persona) and not self.puedeEntrar(persona))
		{
			throw new UserExeption(message = "NO_CUMPLE_CONDICIONES_DE_INGRESO")
		}
	}
	method validar(persona){
		return personasIngresadas.any({per=>per == persona})
	}
	method servirJarra(persona, capacidad){
		const jarra = new Jarra(capacidad= capacidad, marca = self.marcaCerveza())
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
		return personasIngresadas.all({pers=>pers.ebrioEmpedernido()})
	}
}