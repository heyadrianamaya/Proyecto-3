package  {
	
	public class Codigo {
		//Creamos la variables a utilizar
		private var areaC: Number = 0; 
		private var areaT: Number = 0;

		function AreaCirculo(radio: Number) { //Funcion que recibe el radio y genera la operacion
			areaC = 3.1416 * (radio * radio);
		}

		function Circulo(): String { //Funcion que entrega resultado
			return areaC.toString();
		}

		function AreaTriangulo(base: Number, altura: Number) { //Funcion que recibe base, altura y genera la operacion
			areaT = (base * altura) / 2;
		}

		function Triangulo(): String { //Funcion que entrega el resultado
			return areaT.toString();
		}
	}
	
}
