package org.uqbar.examples.mongodb.model;


public class Zona {
	private String localidad;
	private String calle;
	private String altura;
	private String pais;
	
	
	public Zona() {
	}

	public Zona(String localidad, String calle, String altura, String pais) {
		super();
		this.localidad = localidad;
		this.calle = calle;
		this.altura = altura;
		this.pais = pais;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public String getAltura() {
		return altura;
	}

	public void setAltura(String altura) {
		this.altura = altura;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

}
