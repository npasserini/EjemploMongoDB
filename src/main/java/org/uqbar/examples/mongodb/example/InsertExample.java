package org.uqbar.examples.mongodb.example;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

import org.uqbar.examples.mongodb.Collection;
import org.uqbar.examples.mongodb.SistemDB;
import org.uqbar.examples.mongodb.model.Precio;
import org.uqbar.examples.mongodb.model.Producto;
import org.uqbar.examples.mongodb.model.Usuario;
import org.uqbar.examples.mongodb.model.Zona;


public class InsertExample {
	
	public static void main(String[] args){
		List<Usuario> usuarios = Arrays.asList(new Usuario("Pepe"), new Usuario("Juan"), new Usuario("Cosme"));
		
		List<Zona> zonas = Arrays.asList(new Zona("Bernal", "Saens Peña", "3550", "Argentina"),
				new Zona("Quilmes", "Rivadavia", "435", "Argentina"),
				new Zona("Ciudad De Buenos Aires", "Callao", "1500", "Argentina"));
		
		List<Producto> productos = Arrays.asList(
				new Producto("1111111", "Triple de chocolate", "Capitan del Espacio"),
				new Producto("2222222", "Dulce de leche 500 grs", "La Serenisima"),
				new Producto("3333333", "Sprite 2.25lts", "Cocacola"),
				new Producto("4444444", "Express x3", "Terrabusi"));
		
		Collection<Producto> home = SistemDB.instance().collection(Producto.class);
		Random random = new Random();
		for (int i = 0; i < 100000; i++) {
			Producto producto = productos.get(random.nextInt(4));
			Zona zona = zonas.get(random.nextInt(3));
			Usuario usuario = usuarios.get(random.nextInt(3));
			producto.agregarPrecio(new Precio((Math.random()*100)+2d, zona, usuario));
		}
		
		home.insert(productos);
	}

}
