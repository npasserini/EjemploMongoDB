package org.uqbar.examples.mongodb.model

import java.util.ArrayList
import java.util.List

import net.vz.mongodb.jackson.ObjectId

import org.codehaus.jackson.annotate.JsonProperty
import org.eclipse.xtend.lib.annotations.Accessors

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
