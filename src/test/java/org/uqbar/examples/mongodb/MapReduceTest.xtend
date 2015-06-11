package org.uqbar.examples.mongodb

import org.uqbar.examples.mongodb.model.PromedioDePreciosPorProducto
import org.junit.Test
import org.junit.Assert

class MapReduceTest extends AbstractTest{
	val mapPorZona = "
		function() {"+
            "for (var idx = 0; idx < this.precios.length; idx++) {"+
            	"var value = {"+
                        "cantidad: 1,"+
                        "precio: this.precios[idx].precio"+
                      "};"+
                  "var key = {producto: {nombre: this.nombre, codigo:this.codigo}, zona:this.precios[idx].zona};"+
                "emit(key , value);"+
            "}"+
         "};";
     
    val reduceFunction = "
		function(key, precios) {"+
	         "reducedVal = { cantidad: 0, precio: 0 };"+
	         "for (var idx = 0; idx < precios.length; idx++) {"+
	             "reducedVal.cantidad += precios[idx].cantidad;"+
	             "reducedVal.precio+= precios[idx].precio;"+
	         "}"+
	         "return reducedVal;"+
	      "};"

	val finalizeFunction = "
		function (key, reducedVal) {"+
		    "var value = {"+
		          "cantidad: reducedVal.cantidad,"+
		          "precioPromedio: reducedVal.precio/reducedVal.cantidad"+
		        "};"+
		      "return value;"+
   		"};";
   		
		val mapPorProducto = "
			function() {"+
		        "for (var idx = 0; idx < this.precios.length; idx++) {"+
		        	"var value = {"+
		                    "cantidad: 1,"+
		                    "precio: this.precios[idx].precio"+
		                  "};"+
		              "var key = {producto: {nombre: this.nombre, codigo:this.codigo}};"+
		            "emit(key , value);"+
		        "}"+
		     "};";
	
	@Test
	def void testMapPorZona(){
		val mapReduce = homeProducto.mapReduce(mapPorZona, reduceFunction, finalizeFunction, PromedioDePreciosPorProducto, PromedioDePreciosPorProducto);
		val results = mapReduce.results()
		val dulceDeLeche = results.head
		
		results.forEach[println(it)]
		Assert.assertEquals(12, results.length)
		Assert.assertEquals(3003, dulceDeLeche.value.cantidad)
		Assert.assertEquals(500, dulceDeLeche.value.precioPromedio)
		Assert.assertEquals("2222222", dulceDeLeche.id.producto.codigo)
		Assert.assertEquals("Bernal", dulceDeLeche.id.zona.localidad)
		
		println (mapReduce.results.length)
	}
	
	@Test
	def void testMapPo(){
		val mapReduce = homeProducto.mapReduce(mapPorProducto, reduceFunction, finalizeFunction, PromedioDePreciosPorProducto, PromedioDePreciosPorProducto);
		val results = mapReduce.results()
		val dulceDeLeche = results.head
		
		
		results.forEach[println(it)]
		Assert.assertEquals(4, results.length)
		Assert.assertEquals(9009, dulceDeLeche.value.cantidad)
		Assert.assertEquals(500, dulceDeLeche.value.precioPromedio)
		Assert.assertEquals("2222222", dulceDeLeche.id.producto.codigo)
		
		println (mapReduce.results.length)
	}
	
}