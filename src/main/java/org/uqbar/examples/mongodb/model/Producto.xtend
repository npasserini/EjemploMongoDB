package org.uqbar.examples.mongodb.model

import com.fasterxml.jackson.annotation.JsonProperty
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongojack.ObjectId

@Accessors
class Producto {
	String codigo
	String nombre
	String marca
	List<Precio> precios = new ArrayList<Precio>()
	@ObjectId
	@JsonProperty("_id")
	String id
	
	new() {
	}

	new(String codigo, String nombre, String marca) {
		this.codigo = codigo
		this.nombre = nombre
		this.marca = marca
	}
	
	def agregarPrecio(Precio precio){
		this.precios.add(precio)
		this
	}
	
}
