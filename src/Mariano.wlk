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

object chocolatin {
	
}

object caramelo {
	
}