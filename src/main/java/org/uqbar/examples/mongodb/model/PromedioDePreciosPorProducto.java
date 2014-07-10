package org.uqbar.examples.mongodb.model;

import net.vz.mongodb.jackson.ObjectId;

import org.codehaus.jackson.annotate.JsonProperty;
import org.codehaus.jackson.map.ObjectMapper;

public class PromedioDePreciosPorProducto {
	@ObjectId
	@JsonProperty("_id")
	private ID id;
	private Value value;
	
	public class ID{
		private Producto producto;
		private Zona zona;
		
		public Zona getZona() {
			return zona;
		}
		public void setZona(Zona zona) {
			this.zona = zona;
		}
		public Producto getProducto() {
			return producto;
		}
		public void setProducto(Producto producto) {
			this.producto = producto;
		}
	}

	public class Value {
		private Integer cantidad;
		private Long precioPromedio;
		
		public Integer getCantidad() {
			return cantidad;
		}
		public void setCantidad(Integer cantidad) {
			this.cantidad = cantidad;
		}
		public Long getPrecioPromedio() {
			return precioPromedio;
		}
		public void setPrecioPromedio(Long precioPromedio) {
			this.precioPromedio = precioPromedio;
		}
	}

	public Value getValue() {
		return value;
	}

	public void setValue(Value value) {
		this.value = value;
	}

	public ID getId() {
		return id;
	}

	public void setId(ID id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		try {
			return new ObjectMapper().writer().withDefaultPrettyPrinter().writeValueAsString(this);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
