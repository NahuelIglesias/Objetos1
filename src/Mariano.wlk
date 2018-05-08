object mariano {
	const golosinas = #{}
	
	method comprar (_golosina) {
		golosinas.add(_golosina)
	}
	
	method golosinas() = golosinas
	
	method probaTodasLasGolosinas() {
		golosinas.forEach({golosina => golosina.mordisco()})
	}
	
	method hayGolosinasSinTACC() = golosinas.any({golosina => golosina.libreGluten()})
	
	method preciosCuidados() = golosinas.all({golosina => golosina.precio() > 10})
	
	method golosinaDeSabor(unSabor) = golosinas.find({golosina => golosina.gusto() == unSabor})
	
	method golosinasDeSabor(unSabor) = golosinas.filter({golosina => golosina.gusto() == unSabor})
	
	method sabores() =  golosinas.filter({golosina => golosina.gusyo()}).asSet()
	
	method golosinaMasCara() = golosinas.max({golosina => golosina.precio()})
	
//	method precioDeLaGolosinaMasCara() = self.golosinaMasCara().precio()

	method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.diference(golosinas)
	
	method gustosFaltantes(gustosDeseados) = gustosDeseados.filter({gusto => self.hayGolosinaDe(sabor)})
	method hayGolosinasDe(sabor) = golosinas.any({golosina => golosina.gusto() == sabor})
}

object alfajor {
	
}

object chupetin {
	
}

class Chocolatin {
	var comido = 0
	var pesoInicial = 100
	
	method precio() {
		return pesoInicial * 0.5
	}
	method peso() {
		return (pesoInicial - comido).max(0)
	}
	method mordisco() {
		comido += 2
	}
	method gusto() {
		return "chocolate"
	}
	method libreGluten() {
		return false
	}
}

class Heladera {
	var property coeficiente = 0.1
}

class ChocoVIP inherits Chocolatin {
	
	var heladera = new Heladera()
	
	override method peso() {
		return super() * (1 + self.humedad())
	}
	
	method humedad() {
		return heladera.coeficiente()
	}
}

class ChocoPremium inherits ChocoVIP {
	override method humedad() {
		return super()/2
	}
}

class Caramelo {
	var peso = 5
	var gusto = "frutilla"
	
	method precio() {
		return 1
	}
	method peso() {
		return peso
	}
	method mordisco() {
		peso -= 1
	}
	method gusto() {
		return gusto
	}
	method libreGluten() {
		return true
	}
}

class CarCorazonChocolate inherits Caramelo {
	override method mordisco() {
		super()
		gusto = "chocolate"
	}
}

class Bombon {
	var peso = 15
	
	method precio() {
		return 5
	}
	method peso() {
		return peso
	}
	method mordisco() {
		peso = peso * 0
	}
	method gusto() {
		return "chocolate"
	}
	method libreGluten() {
		return true
	}
}

class BombonDuro inherits Bombon {
	override method mordisco() {
		peso = peso * 0.9
	}
}

class Obleas {
	var peso = 250
	
	method precio() {
		return 5
	}
	method peso() {
		return peso
	}
	method mordisco() {
		peso = peso * if (peso > 70) 0.5 else  0.75
	}
	method gusto() {
		return "vainilla"
	}
	method libreGluten() {
		return false
	}
}

class OblCrujientes inherits Obleas {
	var mordiscos = 0
	
	override method mordisco() {
		super()
		if (mordiscos <= 3) {
			peso -= 3
		}
		mordiscos += 1
	}
} 