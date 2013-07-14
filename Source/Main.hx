import flash.display.Sprite;
import jQuery.*; 
import js.Browser.*;

class Main extends Sprite {
	
	public function new () {
		
		super ();
		
		//Define the variables: 
		var SIDES = 6; 
		var diceResult = null; 

		//new JQuery(function() { //(Document ready)
		
		function Display(screen) {

			if (screen == 'start') {
				trace("Welcome to DICE.  Are you ready to roll?\n(R)oll (E)xit");
				//new JQuery("#start").show(); 
				window.alert("test"); 

			} else if (screen == 'roll') {
				trace("Okay, about to roll!\n\n"); 
				//new JQuery("#roll").show(); 					

			} else if (screen == diceResult) {
				trace("You rolled a " + diceResult + "\n\n"); 
			
			} else if (screen == 'noRoll') {
				trace("Why u no wanna play dice?\n\n"); 
			}
		}

		Display('start'); 
	}
	
}