import prendas.*

object macowins {
	
	// lista de ventas (objetos de clase Venta)
	var ventasRealizadas = []
	
	method agregarVenta(unaVenta) = ventasRealizadas.add(unaVenta)	
	
	// Para los pagos con tarjeta
	method coeficienteFijo() = 0.10; 
	
	// Macowins registra las ventas de estas prendas y necesita saber las ganancias de un determinado día. 	
	method gananciasDelDia(unaFecha) = self.ventasDeLaFecha(unaFecha).map({unaVenta => unaVenta.gananciaGenerada()}).sum();
		
	method ventasDeLaFecha(unaFecha) = ventasRealizadas.filter({unaVenta => self.mismaFechaDeVenta(unaFecha,unaVenta)});
	
	method mismaFechaDeVenta(unaFecha,unaVenta) = unaFecha == unaVenta.fecha();
}


// Cada venta tiene asociada las prendas que se vendieron, su cantidad y la fecha de venta

class Venta {

	// lista de items (cada prenda con su cantidad vendida) 
	var prendasVendidas;
	 
	var fecha;
	 
	method fecha() = fecha;
	 
	// se redefine en cada tipo de venta
	method gananciaGenerada();
	 
	method valorTodasLasPrendas() = prendasVendidas.map({ unItemVenta => self.valorPorItem(unItemVenta) }).sum();

	method valorPorItem(unItemVenta) = unItemVenta.precioDePrenda() * unItemVenta.cantidadPrenda();

}

// Las ventas pueden ser en efectivo o con tarjeta

class VentaConEfectivo inherits Venta {
	// no modifica el precio
	override method gananciaGenerada() = self.valorTodasLasPrendas()
}

class VentaConTarjeta inherits Venta {
	 
	var cantidadCuotas;
	// se aplica un recargo según la cantidad de cuotas seleccionadas 
	
	override method gananciaGenerada() = self.valorTodasLasPrendas() + self.recargo();

	// (cantidad de cuotas * un coeficiente fijo + 0.01 del valor de cada prenda)	
	method recargo() = cantidadCuotas * macowins.coeficienteFijo() + 0.01 * self.valorTodasLasPrendas()
}

// un item de una venta contiene la prenda y la cantidad comprada

class ItemDeVenta {

	var prenda;
	var cantidad;

	method precioDePrenda() = prenda.precioFinal();
	method cantidadPrenda() = cantidad; 
}
