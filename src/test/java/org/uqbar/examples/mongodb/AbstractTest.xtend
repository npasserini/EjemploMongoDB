package org.uqbar.examples.mongodb

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.After
import org.junit.Before
import org.uqbar.examples.mongodb.model.Precio
import org.uqbar.examples.mongodb.model.Producto
import org.uqbar.examples.mongodb.model.Usuario
import org.uqbar.examples.mongodb.model.Zona

@Accessors
class AbstractTest {
	List<Usuario> usuarios
	List<Zona> zonas
	List<Producto> productos
	Collection<Producto> homeProducto
	
	@Before
	def void setup(){
		usuarios = #[new Usuario("Pepe"), new Usuario("Juan"), new Usuario("Cosme")]
		
		zonas = #[new Zona("Bernal", "Saens Peña", "3550", "Argentina"),
				new Zona("Quilmes", "Rivadavia", "435", "Argentina"),
				new Zona("Ciudad De Buenos Aires", "Callao", "1500", "Argentina")]
		
		productos = #[
				new Producto("1111111", "Triple de chocolate", "Capitan del Espacio"),
				new Producto("2222222", "Dulce de leche 500 grs", "La Serenisima"),
				new Producto("3333333", "Sprite 2.25lts", "Cocacola"),
				new Producto("4444444", "Express x3", "Terrabusi")]
		
		homeProducto = SistemDB.instance().collection(Producto)
		
		(0..1000).forEach[precio|
			productos.forEach[ producto|
				zonas.forEach[zona|
					usuarios.forEach[usuario|
						producto.agregarPrecio(
							new Precio(
								precio.doubleValue + Integer.parseInt(producto.codigo), 
								zona, 
								usuario
							)
						)
					]
				]
			]
		]
		
		homeProducto.insert(productos)
	}
	
	@After
	def void cleanDB(){
		homeProducto.mongoCollection.drop
	}
	
}