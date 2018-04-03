package {

	import flash.display.MovieClip;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;


	public class Portada extends MovieClip {


		public function Portada() {
			//instancias para llamar a los twens de la portada 
			var practica2_mcc: Tween = new Tween(practica8_mc, "y", Bounce.easeOut, -48.95, 41.35, 3, true);
			var upv: Tween = new Tween(upvt_mc, "x", Bounce.easeOut, -440.6, 195.4, 3, true);
			var nombre_mcc: Tween = new Tween(nombre_mc, "x", Bounce.easeOut, -392.2, 243.8, 3, true);
			var maestro: Tween = new Tween(maestro_mc, "x", Bounce.easeOut, -431.7, 204.3, 3, true);
			var materia: Tween = new Tween(materia_mc, "x", Bounce.easeOut, -332.5, 303.5, 3, true);
			var matricula: Tween = new Tween(matricula_mc, "x", Bounce.easeOut, -190.65, 445.35, 3, true);
			var grupo: Tween = new Tween(grupo_mc, "x", Bounce.easeOut, -154.75, 481.25, 3, true);
			var continuar: Tween = new Tween(continuar_btn, "y", Regular.easeInOut, 500, 433.6, 3, true);
			var logo: Tween = new Tween(logo_mc, "y", None.easeOut, -273.2, 484.2, 3, true);
		}
	}

}