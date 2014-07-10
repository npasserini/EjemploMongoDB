package org.uqbar.examples.mongodb;

import java.util.List;

import net.vz.mongodb.jackson.DBQuery;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.uqbar.examples.mongodb.example.InsertExample;
import org.uqbar.examples.mongodb.model.Producto;


public class ExampleTest {
	private Collection<Producto> home = SistemDB.instance().collection(Producto.class);
	
	@Before
	public void fillDB(){
		InsertExample.main(null);
	}
	
	@After
	public void cleanDB(){
		home.getMongoCollection().drop();
	}
	
	@Test
	public void findByCode(){
		List<Producto> productos = home.getMongoCollection().find(DBQuery.is("codigo", "1111111")).toArray();
		
		Assert.assertEquals(productos.size(), 1);
		Producto producto = productos.get(0);
		
		Assert.assertEquals(producto.getNombre(), "Triple de chocolate");
		Assert.assertEquals(producto.getMarca(), "Capitan del Espacio");
	}
	
	@Test
	public void findByZone(){
		List<Producto> productos = home.getMongoCollection().find(DBQuery.in("codigo", "1111111", "2222222", "5555555")).toArray();
		
		Assert.assertEquals(productos.size(), 2);
	}
}
