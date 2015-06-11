package org.uqbar.examples.mongodb.model

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Precio {
	Double precio
	Zona zona
	Date fecha
	Usuario user
	
	new() {
	}
	
	new(Double precio, Zona zona, Usuario user) {
		this.precio = precio
		this.zona = zona
		this.user = user
	}
}
