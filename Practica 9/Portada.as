package {
	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import flash.events.MouseEvent;
	import flash.events.ActivityEvent;


	public class Portada extends MovieClip {
		var tween: Tween;
		///  Este frame es invisible solo lo utilizo para crar las variables que necesitare   ///
		var i: int = 0; //CREAMOS UN CONTADOR QUE SE UTILIZARÁ ADELANTE PARA UN CICLO FOR
		var limite: int = 0; //LIMITE DE LAS PERSONAS QUE SE PUEDEN REGISTRAR
		var nombre: String = ""; //SE GUARDA EL NOMBRE DE LA PERSONA
		var nombreNum: Number = 0; //AQUI VAMOS A GUARDAR EL NOMBRE QUE ESTE EN EL ARRAY DE NOMBRE
		var edad1: Number = 0; //GUARDAMOS LA EDAD NUMBER PARA SABER SI TIENE PUNTO O LETRAS Y DESPUES TENDREMOS
		var edad: int = 0; //QUE CONVERTIRLO EN INT PARA QUE NO TENGA DECIMALES
		var sueldo: Number = 0; //OBTENEMOS EL SUELDO QUE VAMOS A COMPROBAR AQUI EN ESTA VARIABLE
		var desOaumen: Number = 0; //ES LA VARIABLE QUE UTILIZAMOS PARA SABER SI SE AUMENTA O DISMINUYE EL SUELDO
		var contadorPersona: int = 0; //Es un contador el cual nos va a decir en que numero de persona vamos
		var correcto: int = 0; //Es para ver si lo que ingreso el usuario es correcto
		var modulo: int = 0; //Para obtener el numero de edad sin decimales

		//Listas
		var arrayEmpleado: Array = new Array(); //Lista de número de empleado
		var arrayNombre: Array = new Array(); //Lista de nombre de Empleado
		var arrayEdad: Array = new Array(); //Lista de la edad del empleado
		var arraySexo: Array = new Array(); //Lista del sexo del usuario
		var arraySueldo: Array = new Array(); //Lista sueldo, la cantidad que ingresa el usuario
		var arraySueldoFinal: Array = new Array(); //Lista de los sueldos finales

		//Variables y contadores olo para verificar hombre o mujer
		var descuentoH: int = 0;
		var sinDescuentoH: int = 0;
		var terceraEdadH: int = 0;
		var sumaH: Number = 0;
		var descuentoM: int = 0;
		var sinDescuentoM: int = 0;
		var terceraEdadM: int = 0;
		var sumaM: Number = 0;

		public function Portada() {
			//instancias para llamar a los twens de la portada 
			tween = new Tween(practica9_mc, "y", Bounce.easeOut, -48.95, 41.35, 3, true);
			tween = new Tween(upvt_mc, "x", Bounce.easeOut, -440.6, 195.4, 3, true);
			tween = new Tween(nombre_mc, "x", Bounce.easeOut, -392.2, 243.8, 3, true);
			tween = new Tween(maestro_mc, "x", Bounce.easeOut, -431.7, 204.3, 3, true);
			tween = new Tween(materia_mc, "x", Bounce.easeOut, -332.5, 303.5, 3, true);
			tween = new Tween(matricula_mc, "x", Bounce.easeOut, -190.65, 445.35, 3, true);
			tween = new Tween(grupo_mc, "x", Bounce.easeOut, -154.75, 481.25, 3, true);
			tween = new Tween(continuar_btn, "y", Regular.easeInOut, 500, 433.6, 3, true);
			tween = new Tween(logo_mc, "y", None.easeOut, -273.2, 484.2, 3, true);

			continuar_btn.addEventListener(MouseEvent.CLICK, continuar);

			function continuar(event: MouseEvent) {
				nextFrame();
				mujer_check.addEventListener(MouseEvent.CLICK, mujer);
				hombre_check.addEventListener(MouseEvent.CLICK, hombre);
				guardar_btn.addEventListener(MouseEvent.CLICK, guardar); //Agregamos el evento al botón de guardar
				volver_btn.addEventListener(MouseEvent.CLICK, volver); //Agregamos el evento a volver
				total_btn.addEventListener(MouseEvent.CLICK, Ntotal); //Agregamos el evento al botón total
				volver1_btn.addEventListener(MouseEvent.CLICK, volver1); //Agregamos el evento a botón volver 1
				nEmpleado_txtd.text = String(contadorPersona + 1); //Cuando el empleado este en 0 pero se cambiará a 1

				//CUANDO SE INICIA EL FRAME NECESITAMOS PONER INVISIBLE LAS COSAS QUE TODAVIA NO VAMOS A OCUPAR
				//Ponemos invisible todo lo que hay cuando el usuarion ingresa correctamente todos los valores
				etiqueta2_mc.visible = false;
				nombre_txtd.visible = false;
				sexo_txtd.visible = false;
				sueldo_txtd.visible = false;
				sumaAumento_txtd.visible = false;
				noEmpleado_txtd.visible = false;
				edad_txtd.visible = false;
				total_txtd.visible = false;
				volver_btn.visible = false;
				mujer_img.visible = false;
				hombre_img.visible = false;

				//Ponemos invisible todo lo que hay cuando el usuario todavia no presiona el botón de nomina total
				etiqueta3_mc.visible = false;
				totalEmpleado_txtd.visible = false;
				nominaTotal_txtd.visible = false;
				volver1_btn.visible = false;
				otroH_txtd.visible = false;
				tresH_txtd.visible = false;
				terceraH_txtd.visible = false;
				cEmpleadoH_txtd.visible = false;
				subtotalH_txtd.visible = false;
				otroM_txtd.visible = false;
				tresM_txtd.visible = false;
				terceraM_txtd.visible = false;
				cEmpleadoM_txtd.visible = false;
				subtotalM_txtd.visible = false;
				totalEmpleado_txtd.visible = false;
				nominaTotal_txtd.visible = false;
			}

			function mujer(event: MouseEvent): void {
				hombre_check.selected = false;
				mujer_check.selected = true;
			}

			function hombre(event: MouseEvent): void {
				mujer_check.selected = false;
				hombre_check.selected = true;
			}

			function guardar(event: MouseEvent): void { //Guardar los datos del empleado		
				//Validación del nombre
				nombre = String(nombre_txt.text); //Guardamos la caja de texto nombre en variable nombre
				nombreNum = Number(nombre_txt.text); //Guardamos la caja de texto nombre en una variable nombreNum tipo Numerica

				if (!isNaN(nombreNum)) { //Aqui hacemos el caso negativo de isNaN por cuando sea verdadero es por que hay puros numeros
					sinNombre_txtd.text = "*Ingresa letras"; //Mandamos mensaje
				} else {
					if (nombre == "") { //Cuando la caja este vacia
						sinNombre_txtd.text = "*Ingresa letras"; //Mandamos mensaje
					} else {
						arrayNombre[contadorPersona] = nombre; //Guardamos el nombre en array
						sinNombre_txtd.text = ""; //Donde mandamos el mesaje lo reinicuamos
						correcto++; //Añadimos un contador de correcto
					}
				}

				//Validación de la edad
				edad1 = Number(edad_txt.text); //Guardamos la caja de edad en variable edad 1 como Number
				if (edad1 % 1 == 0) { //Cuando tenga un punto decimal no podemos convertir a entero
					modulo = 1; // y una persona no puede poner que tiene de edad 20.9 años
					edad = int(edad_txt.text); //Cambiamos a la variable entera
				}
				if (isNaN(edad1)) { //Si edad1 contiene letra
					sinEdad_txtd.text = "*Error"; //Marcamos error
				} else {
					if (edad1 == 0) { //Si esta vacia 
						sinEdad_txtd.text = "*Error"; //Marcamos error
					} else {
						if (modulo == 0) { //En caso que tenga punto decimal
							sinEdad_txtd.text = "*Error"; //Marcamos error
						} else {
							if (edad <= 90 && edad > 17) { //Si la edad esta dentro de estos rangos la guardamos
								arrayEdad[contadorPersona] = edad;
								sinEdad_txtd.text = "";
								correcto++; //Aumentamos el correcto y asi valdrá 2
							} else {
								sinEdad_txtd.text = "*Error"; //Si no esta marcamos error
							}
						}
					}
				}

				//Validación de sexo
				if (mujer_check.selected == false && hombre_check.selected == false) { //Cuando las ods no esten marcadas
					sinSexo_txtd.text = "*Error"; //Marcamos error
				} else {
					if (mujer_check.selected == true && hombre_check.selected == true) { //Si las 2 estan marcadas
						sinSexo_txtd.text = "*Error"; //Marcamos error
					} else {
						if (mujer_check.selected == true) { //Si nada mas esta activa la de mujer
							arraySexo[contadorPersona] = "Mujer"; //Guardamos que es mujer
							sinSexo_txtd.text = ""; //Vaciamos el texto de error
							correcto++; //Añadimos correcto en la variable para que sean 3
						} else {
							if (hombre_check.selected == true) { //Si nada mas esta activa la de hombre
								arraySexo[contadorPersona] = "Hombre"; //Guardamos que es hombre
								sinSexo_txtd.text = ""; //vaciamos el mensaje de error
								correcto++; //Añadimos correcto en la variable para que sean 3
							}
						}
					}

				}

				//Validación de sueldo
				sueldo = Number(sueldo_txt.text); //Guardamos la caja de texto de sueldo en la variable sueldo tipo Number
				if (isNaN(sueldo)) { //Si contiene letras
					sinSueldo_txtd.text = "*Error"; //Marcamos error
				} else {
					if (sueldo == 0) { //Si esta vacia 
						sinSueldo_txtd.text = "*Error"; //Marcamos error
					} else {
						arraySueldo[contadorPersona] = sueldo; //Guardamos el sueldo del array en el empleado
						sinSueldo_txtd.text = ""; //Borramos el mensaje de error
						correcto++; //Sumamos en correcto y seria 4
					}
				}

				if (correcto == 4) { //Cuando es 4 entra
					//PONER INVISIBLE LAS COSAS DE EL INGRESO DE DATOS
					nombre_txt.visible = false;
					sinNombre_txtd.visible = false;
					edad_txt.visible = false;
					sinEdad_txtd.visible = false;
					mujer_check.visible = false;
					hombre_check.visible = false;
					sinSexo_txtd.visible = false;
					nEmpleado_txtd.visible = false;
					sueldo_txt.visible = false;
					sinSueldo_txtd.visible = false;
					etiqueta1_mc.visible = false;
					guardar_btn.visible = false;
					limpiar_btn.visible = false;
					total_btn.visible = false;
					nombre_txt.text = "";
					edad_txt.text = "";
					sueldo_txt.text = "";

					//SE MUESTRA LO INGRESADO
					etiqueta2_mc.visible = true;
					nombre_txtd.visible = true;
					sexo_txtd.visible = true;
					sueldo_txtd.visible = true;
					sumaAumento_txtd.visible = true;
					noEmpleado_txtd.visible = true;
					edad_txtd.visible = true;
					total_txtd.visible = true;
					volver_btn.visible = true;


					//VERIFICACIÓN PARA SABER SI SE LE OTORGARA UN DESCUENTO, AUMENTO O PASAR LIMPIO
					//Aumento a las personas de la tercera edad
					if (edad >= 60) { //Si la edad es mayor de 60
						desOaumen = (sueldo * 0.20); //Aumentamos un 20% a los ancianos
						sueldo = sueldo + (sueldo * 0.20); //Sumamos el sueldo
						sumaAumento_txtd.text = "Con un aumento de: $" + desOaumen; //Mostramos el dinero con aumento
						total_txtd.text = "$" + sueldo; //Mostramos el sueldo final
						arraySueldoFinal[contadorPersona] = sueldo; //Agregamos el sueldo al array
					} else {
						if (mujer_check.selected == true && edad > 25) { //Esto es cuando una mujer no entra al aumento
							total_txtd.text = "$" + sueldo; //Mostramos el sueldo final
							arraySueldoFinal[contadorPersona] = sueldo; //Agregamos el sueldo al array
							mujer_img.visible = true;
						} else {
							if (mujer_check.selected == true && edad >= 18 && edad <= 25) { //Verficamos que mujer esta valido y la edad
								desOaumen = (sueldo * 0.15); //Sea mayor igual a 18 y menor igual que 25
								sueldo = sueldo + (sueldo * 0.15); //aplicamos el aumento
								sumaAumento_txtd.text = "Con un aumento de: $" + desOaumen; //Mostramos la cantidad de aumento
								total_txtd.text = "$" + sueldo; //Mostramos el sueldo final
								arraySueldoFinal[contadorPersona] = sueldo; //Agregamos el sueldo al array
								mujer_img.visible = true;
							} else {
								//Esto es cuando un hombre no entra al descuento
								if (hombre_check.selected == true && (edad < 30 || edad > 35)) {
									total_txtd.text = "$" + sueldo; //Mostramos el sueldo final
									arraySueldoFinal[contadorPersona] = sueldo; //Agregamos el sueldo al array
									hombre_img.visible = true;
								} else {
									if (hombre_check.selected == true && (edad >= 30 && edad <= 35)) { //Verficamos que hombre esta valido y la edad
										desOaumen = (sueldo * 0.05); //Sea mayor igual a 30 y menor igual que 35
										sueldo = sueldo - (sueldo * 0.05); //aplicamos el aumento
										sumaAumento_txtd.text = "Con un descuento de: $" + desOaumen; //Mostramos la cantidad de aumento
										total_txtd.text = "$" + sueldo; //Mostramos el sueldo final
										arraySueldoFinal[contadorPersona] = sueldo; //Agregamos el sueldo al array
										hombre_img.visible = true;
									}
								}
							}
						}
					}

					//Muestra en los textos dinamicos
					noEmpleado_txtd.text = String(contadorPersona);
					nombre_txtd.text = arrayNombre[contadorPersona];
					sexo_txtd.text = arraySexo[contadorPersona];
					sueldo_txtd.text = arraySueldo[contadorPersona];
					edad_txtd.text = arrayEdad[contadorPersona];

					contadorPersona++; //Aumentamos el contador
					noEmpleado_txtd.text = String(contadorPersona); //Mostramos el número de empleado
					correcto = 0; //Reiniciamos correcto para que vuelva a entrar aqui
					limite++; //Aumentamos el limite

					if (arraySexo[contadorPersona - 1] == "Hombre") { //Verificamos que en el array de sexo es hombre
						if (arrayEdad[contadorPersona - 1] >= 30 && arrayEdad[contadorPersona - 1] <= 35) { //Para la edad un rango de 30 y 35
							descuentoH++; //Una variable que se encarga de decirnos cuantas personas se les hizo descuento
						} else {
							if (arrayEdad[contadorPersona - 1] >= 60) { //Rango mayor a 60
								terceraEdadH++; //Una variable que se encarga de decirnos cuantas personas se les hizo aumento
							} else {
								sinDescuentoH++; //Una variable que se encarga de decirnos cuantas personas se pasaron normal
							}
						}
						sumaH += arraySueldoFinal[contadorPersona - 1]; //Sumatoria de sueldos finales
					} else {
						if (arraySexo[contadorPersona - 1] == "Mujer") {
							if (arrayEdad[contadorPersona - 1] >= 18 && arrayEdad[contadorPersona - 1] <= 25) { //Para edad el rango de 30 y 35
								descuentoM++; //Una variable que se encarga de decirnos cuantas personas se les hizo aumento
							} else {
								if (arrayEdad[contadorPersona - 1] >= 60) { //Rango mayor a 60
									terceraEdadM++; //Una variable que se encarga de decirnos cuantas personas se les hizo aumento
								} else {
									sinDescuentoM++; //Una variable que se encarga de decirnos cuantas personas se pasaron normal
								}
							}
							sumaM += arraySueldoFinal[contadorPersona - 1]; //Sumatoria de sueldos finales

						}
					}
				} else {
					correcto = 0; //Reiniciamos correcto para que vuelva a entrar aqui
				}
			}

			function volver(event: MouseEvent): void { //Volver de la muestra del usuario
				//DATOS DEL EMPLEADO LO PONEMOS VISIBLE
				nombre_txt.visible = true;
				sinNombre_txtd.visible = true;
				edad_txt.visible = true;
				sinEdad_txtd.visible = true;
				mujer_check.visible = true;
				hombre_check.visible = true;
				sinSexo_txtd.visible = true;
				nEmpleado_txtd.visible = true;
				sueldo_txt.visible = true;
				sinSueldo_txtd.visible = true;
				etiqueta1_mc.visible = true;
				guardar_btn.visible = true;
				limpiar_btn.visible = true;
				total_btn.visible = true;
				//Reiniciamos los valores del check de hombre y mujer
				mujer_check.selected = false;
				hombre_check.selected = false;
				mujer_img.visible = false;
				hombre_img.visible = false;

				//Mostramos el numero de empleado que se va a registrar
				nEmpleado_txtd.text = String(contadorPersona + 1);

				//LA VENTANA DE CORRECTO LA PONEMOS INVISIBLE
				etiqueta2_mc.visible = false;
				nombre_txtd.visible = false;
				sexo_txtd.visible = false;
				sueldo_txtd.visible = false;
				sumaAumento_txtd.visible = false;
				noEmpleado_txtd.visible = false;
				edad_txtd.visible = false;
				total_txtd.visible = false;
				volver_btn.visible = false;
				sumaAumento_txtd.text = ""; //El texto donde se dice que si se agrega o disminuye el sueldo lo ponemos vacio
			}

			function Ntotal(event: MouseEvent): void {
				//PONER INVISIBLE LAS COSAS DE EL INGRESO DE DATOS
				nombre_txt.visible = false;
				sinNombre_txtd.visible = false;
				edad_txt.visible = false;
				sinEdad_txtd.visible = false;
				mujer_check.visible = false;
				hombre_check.visible = false;
				sinSexo_txtd.visible = false;
				nEmpleado_txtd.visible = false;
				sueldo_txt.visible = false;
				sinSueldo_txtd.visible = false;
				etiqueta1_mc.visible = false;
				guardar_btn.visible = false;
				limpiar_btn.visible = false;
				total_btn.visible = false;
				nombre_txt.text = "";
				edad_txt.text = "";
				sueldo_txt.text = "";

				//LABEL'S DE NOMINA TOTAL
				etiqueta3_mc.visible = true;
				totalEmpleado_txtd.visible = true;
				nominaTotal_txtd.visible = true;
				volver1_btn.visible = true;
				otroH_txtd.visible = true;
				tresH_txtd.visible = true;
				terceraH_txtd.visible = true;
				cEmpleadoH_txtd.visible = true;
				subtotalH_txtd.visible = true;
				otroM_txtd.visible = true;
				tresM_txtd.visible = true;
				terceraM_txtd.visible = true;
				cEmpleadoM_txtd.visible = true;
				subtotalM_txtd.visible = true;
				totalEmpleado_txtd.visible = true;
				nominaTotal_txtd.visible = true;

				//MOSTRAMOS LOS CONTADORES EN PANTALLA
				tresH_txtd.text = String(descuentoH);
				terceraH_txtd.text = String(terceraEdadH);
				otroH_txtd.text = String(sinDescuentoH);
				tresM_txtd.text = String(descuentoM);
				terceraM_txtd.text = String(terceraEdadM);
				otroM_txtd.text = String(sinDescuentoM);

				//MOSTRAMOS LA CANTIDAD FINAL DE EMPLEADOS HOMBRES
				cEmpleadoH_txtd.text = String(descuentoH + terceraEdadH + sinDescuentoH);
				//MOSTRAMOS EL SUELDO DE TODOS LOS HOMBRES
				subtotalH_txtd.text = String(sumaH);

				//MOSTRAMOS LA CANTIDAD FINAL DE EMPLEADOS HOMBRES
				cEmpleadoM_txtd.text = String(descuentoM + terceraEdadM + sinDescuentoM);
				//MOSTRAMOS EL SUELDO DE TODAS LAS MUJERES
				subtotalM_txtd.text = String(sumaM);

				//Mostramos la cantidad de personas registradas
				totalEmpleado_txtd.text = String(contadorPersona);
				//Mostramos el sueldo sumado de los dos sexos
				nominaTotal_txtd.text = String(sumaM + sumaH);
			}

			function volver1(event: MouseEvent): void { //Volver de la muestra del usuario
				//DATOS DEL EMPLEADO LO PONEMOS VISIBLE
				nombre_txt.visible = true;
				sinNombre_txtd.visible = true;
				edad_txt.visible = true;
				sinEdad_txtd.visible = true;
				mujer_check.visible = true;
				hombre_check.visible = true;
				sinSexo_txtd.visible = true;
				nEmpleado_txtd.visible = true;
				sueldo_txt.visible = true;
				sinSueldo_txtd.visible = true;
				etiqueta1_mc.visible = true;
				guardar_btn.visible = true;
				limpiar_btn.visible = true;
				total_btn.visible = true;
				//Reiniciamos los valores del check de hombre y mujer
				mujer_check.selected = false;
				hombre_check.selected = false;

				//Mostramos el numero de empleado que se va a registrar
				nEmpleado_txtd.text = String(contadorPersona + 1);

				//LA VENTANA DE FINAL LA VOLVEMOS INVISIBLE
				etiqueta3_mc.visible = false;
				totalEmpleado_txtd.visible = false;
				nominaTotal_txtd.visible = false;
				volver1_btn.visible = false;
				otroH_txtd.visible = false;
				tresH_txtd.visible = false;
				terceraH_txtd.visible = false;
				cEmpleadoH_txtd.visible = false;
				subtotalH_txtd.visible = false;
				otroM_txtd.visible = false;
				tresM_txtd.visible = false;
				terceraM_txtd.visible = false;
				cEmpleadoM_txtd.visible = false;
				subtotalM_txtd.visible = false;
				totalEmpleado_txtd.visible = false;
				nominaTotal_txtd.visible = false;
			}
		}

	}

}