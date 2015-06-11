package org.uqbar.examples.mongodb.model;

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	String userName;
	
	new() {
	}
	
	new(String username) {
		this.userName = username
	}
	
}
