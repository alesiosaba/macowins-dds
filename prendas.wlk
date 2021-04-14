

/*  Prendas
Queremos saber el precio de venta de una prenda y sus tipos, */

class Prenda {
	
	var estado;
	
	method precioBase();
	
	method precioFinal() = estado.calcularPrecio(self)
}

// los tipos de prenda son: sacos, pantalones, camisas

object saco inherits Prenda {
	override method precioBase() = 20;
}

object pantalon inherits Prenda {
	override method precioBase() = 50;
}

object camisa inherits Prenda {
	override method precioBase() = 100;
}

// Estados de prendas

// Nueva: en este caso no modifican el precio base. 
object nueva {
	method calcularPrecio(unaPrenda) = unaPrenda.precioBase()
}

// Promoción: Le resta un valor fijo decidido por el usuario
object promocion{
	var descuento = 10;
	
	method calcularPrecio(unaPrenda) = unaPrenda.precioBase() - descuento;
}

// Liquidación: Es un 50% del valor del producto.
object liquidacion {
	method calcularPrecio(unaPrenda) = unaPrenda.precioBase() * 0.5
}