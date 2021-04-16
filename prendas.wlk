// Prendas

// Queremos saber el precio de venta de una prenda y sus tipos 

class Prenda {
	
	var estado;
	
	// devuelve el nombre del tipo de prenda 
	method tipoDePrenda()
	
	// el precio propio o base de la prenda (entendemos que cada tipo de prende tiene un precio base)
	method precioBase()
	
	// El cálculo del precio de una prenda es, el precio propio de la prenda modificado según el estado de la prenda
	method precioFinal() = estado.precioPorEstado(self)
}

// los tipos de prenda son: sacos, pantalones, camisas

class Saco inherits Prenda {
	override method precioBase() = 20;
	override method tipoDePrenda() = "saco";
}

class Pantalon inherits Prenda {
	override method precioBase() = 50;
	override method tipoDePrenda() = "pantalon";
}

class Camisa inherits Prenda {
	override method precioBase() = 100;
	override method tipoDePrenda() = "camisa";
}

// Estados de prendas

// Nueva: en este caso no modifican el precio base. 
object nueva {
	method precioPorEstado(unaPrenda) = unaPrenda.precioPropio()
}

// Promoción: Le resta un valor fijo decidido por el usuario
object promocion{
	var descuento = 10;
	
	method precioPorEstado(unaPrenda) = unaPrenda.precioPropio() - descuento;
}

// Liquidación: Es un 50% del valor del producto.
object liquidacion {
	method precioPorEstado(unaPrenda) = unaPrenda.precioPropio() * 0.5
}