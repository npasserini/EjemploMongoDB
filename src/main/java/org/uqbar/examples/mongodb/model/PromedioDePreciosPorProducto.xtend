package org.uqbar.examples.mongodb.model;

import net.vz.mongodb.jackson.ObjectId;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.ObjectMapper;
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PromedioDePreciosPorProducto {
	@ObjectId
	@JsonProperty("_id")
	ID id;
	Value value;

	override def toString() {
		try {
			return new ObjectMapper().writer().withDefaultPrettyPrinter().writeValueAsString(this);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}

@Accessors
class ID {
	Producto producto;
	Zona zona;
}

@Accessors
class Value {
	Integer cantidad;
	Long precioPromedio;

}