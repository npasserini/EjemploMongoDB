package org.uqbar.examples.mongodb.model;


public class Usuario {
	private String userName;
	
	
	public Usuario() {
	}
	
	public Usuario(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
