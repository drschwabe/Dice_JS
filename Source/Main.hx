import flash.display.Sprite;
import js.jQuery.*; 
import js.Browser.*;
import flash.events.*;

class Main extends Sprite {
	
	public function new () {
		
		super ();
		
		//Define the variables: 
		var SIDES = 6; 
		var diceResult = null; 

		//new JQuery(function() { //(Document ready)

		//Initial display settings:  
		new js.JQuery("#start").hide(); 
		new js.JQuery("#roll").hide(); 	
		
		function clickHandler(event:MouseEvent) {
			trace("You clicked on the stage!"); 
		}


		function Display(screen) {

			if (screen == 'start') {
				trace("Welcome to DICE.  Are you ready to roll?\n(R)oll (E)xit");
				new js.JQuery("#start").show(); 
				//window.alert("test");

			} else if (screen == 'roll') {
				trace("Okay, about to roll!\n\n"); 
				//new JQuery("#roll").show(); 					

			} else if (screen == diceResult) {
				trace("You rolled a " + diceResult + "\n\n"); 
			
			} else if (screen == 'noRoll') {
				trace("Why u no wanna play dice?\n\n"); 
			}

			stage.addEventListener(MouseEvent.CLICK, clickHandler); 
		}

	
		Display('start'); 
	}
	
}