package org.uqbar.examples.mongodb;

import net.vz.mongodb.jackson.DBQuery
import org.junit.Assert
import org.junit.Test

class FindTest extends AbstractTest{
	
	@Test
	def void findByCode(){
		val productos = homeProducto.getMongoCollection().find(DBQuery.is("codigo", "1111111"))
		
		Assert.assertEquals(productos.size(), 1);
		val producto = productos.get(0);
		
		Assert.assertEquals(producto.nombre, "Triple de chocolate");
		Assert.assertEquals(producto.marca, "Capitan del Espacio");
	}
	
	@Test
	def void findByZone(){
		val query = DBQuery.in("codigo", "1111111", "2222222", "5555555")
		val productos = homeProducto.getMongoCollection().find(query)
		Assert.assertEquals(productos.size(), 2);
	}
}
