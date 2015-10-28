package org.uqbar.examples.mongodb;

import org.junit.Assert
import org.junit.Test
import org.mongojack.Aggregation
import org.mongojack.Aggregation.Group
import org.mongojack.DBQuery
import org.mongojack.DBSort
import org.mongojack.Id
import org.mongojack.MapReduce

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
				for (i in this.precios) {
					emit(this.codigo, this.precios[i].precio);
				}
			}
		'''

		val reduce = '''
			function(key, values) {
				var sum = 0;
				var count = 0;
				for(var i in values) {
					sum += values[i];
					count++;
				}
				return sum/count;
			}
		'''

		val command = MapReduce.build(map, reduce, 
			MapReduce.OutputType.REPLACE, "precios", 
			AnalisisDePrecios, String)

		command.query = DBQuery.in("codigo", "1111111", "2222222", "5555555")

		val output = homeProducto.mongoCollection.mapReduce(command)

		output.results().forEach [
			// Assert.assertEquals(500, value, 0)
			println('''El producto «codigo» tiene en promedio el precio $«value»''')
		]
	}

	@Test
	def void aggregate() {
		val pipeline = Aggregation
			.match(DBQuery.in("codigo", "1111111", "2222222", "5555555"))
			.unwind("precios")
			.projectFields("codigo", "precios.precio")
			.group("codigo").set("value", Group.average("precios.precio"))
			.sort(DBSort.asc("_id"))
				
		val output = homeProducto.mongoCollection.aggregate(pipeline, AnalisisDePrecios)

		output.results().forEach[
			// Assert.assertEquals(500, value, 0)
			println('''El producto «codigo» tiene en promedio el precio $«value»''')
		]
	}
}

public class AnalisisDePrecios {
	@Id
	public String codigo;

	public double value;
}
