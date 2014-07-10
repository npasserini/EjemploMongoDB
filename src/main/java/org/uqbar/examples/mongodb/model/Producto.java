package org.uqbar.examples.mongodb.model;

import java.util.ArrayList;
import java.util.List;

import net.vz.mongodb.jackson.ObjectId;

import org.codehaus.jackson.annotate.JsonProperty;

public class Producto {
	private String codigo;
	private String nombre;
	private String marca;
	private List<Precio> precios = new ArrayList<Precio>();
	
	@ObjectId
	@JsonProperty("_id")
	private String id;
	
	public Producto() {
	}

	public Producto(String codigo, String nombre, String marca) {
		this.codigo = codigo;
		this.nombre = nombre;
		this.marca = marca;
	}
	
	public Producto agregarPrecio(Precio precio){
		this.precios.add(precio);
		return this;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public List<Precio> getPrecios() {
		return precios;
	}

	public void setPrecios(List<Precio> precios) {
		this.precios = precios;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}
