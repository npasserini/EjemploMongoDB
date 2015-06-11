package org.uqbar.examples.mongodb.model

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Zona {
	String localidad
	String calle
	String altura
	String pais
	
	
	new() {
	}

	new(String localidad, String calle, String altura, String pais) {
		super()
		this.localidad = localidad
		this.calle = calle
		this.altura = altura
		this.pais = pais
	}


}
