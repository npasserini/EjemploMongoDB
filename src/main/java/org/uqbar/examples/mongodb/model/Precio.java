package org.uqbar.examples.mongodb.model;

import java.util.Date;

public class Precio {
	private Double precio;
	private Zona zona;
	private Date fecha;
	private Usuario user;
	
	public Precio() {
	}
	
	public Precio(Double precio, Zona zona, Usuario user) {
		this.precio = precio;
		this.zona = zona;
		this.user = user;
	}
	
	public Double getPrecio() {
		return precio;
	}
	public void setPrecio(Double precio) {
		this.precio = precio;
	}
	public Zona getZona() {
		return zona;
	}
	public void setZona(Zona zona) {
		this.zona = zona;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public Usuario getUser() {
		return user;
	}
	public void setUser(Usuario user) {
		this.user = user;
	}
}
