package org.uqbar.examples.mongodb;

import net.vz.mongodb.jackson.DBQuery
import net.vz.mongodb.jackson.Id
import net.vz.mongodb.jackson.MapReduce
import org.codehaus.jackson.annotate.JsonProperty
import org.junit.Assert
import org.junit.Test
import org.uqbar.examples.mongodb.model.Producto

class FindTest extends AbstractTest {

	@Test
	def void findByCode() {
		val productos = homeProducto.mongoCollection.find(DBQuery.is("codigo", "1111111"))

		Assert.assertEquals(productos.size(), 1);
		val producto = productos.get(0);

		Assert.assertEquals(producto.nombre, "Triple de chocolate");
		Assert.assertEquals(producto.marca, "Capitan del Espacio");
	}

	@Test
	def void findByZone() {
		val query = DBQuery.in("codigo", "1111111", "2222222", "5555555")
		val productos = homeProducto.getMongoCollection().find(query)
		Assert.assertEquals(productos.size(), 2);
	}

	@Test
	def void mapReduce() {
		val map = '''
			function() { 
				emit(this.codigo, 1);
			}
		'''
		
		val reduce = '''
			function(key, values) {
				var sum = 0;
				for(var i in vals) sum += vals[i];
				return sum;
			}
		'''
		
		val command = MapReduce.build(map,
				reduce,
				MapReduce.OutputType.REPLACE, "userComments", AnalisisDePrecios, String)
				
		command.query = DBQuery.in("codigo", "1111111", "2222222", "5555555")
				
		val output = homeProducto.mongoCollection.mapReduce(command)

		output.results().forEach [
			println('''El producto «codigo» tiene en promedio el precio $«value»''')
		]
	}
}

public class AnalisisDePrecios {
	@Id
	public String codigo;

	public double value;
}
