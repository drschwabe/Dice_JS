import flash.display.Sprite;
import js.jQuery.*; 
import js.Browser.*;
import flash.events.*;
import flash.ui.Keyboard;
import haxe.Timer; 

class Main extends Sprite {
	
	public function new () {
		
		super ();

		////Define variables: 
		var SIDES = 6; 
		var diceResult = null;
		var currentScreen = null; 


		//############# DISPLAY ################
		////Initial settings:  
		new js.JQuery("#start").hide(); 
		new js.JQuery("#roll").hide(); 
		new js.JQuery("#result").hide(); 	

		////Primary function: 
		function Display(screen) {

			//Log the current screen Ai can keep track of where we are: 
			currentScreen = screen; 	

			if (screen == 'start') {
				//Welcome user: 
				trace("Welcome to DICE.  Are you ready to roll?\n(R)oll (E)xit");
				new js.JQuery("#start").show(); 

			} else if (screen == 'roll') {
				//Tell user what is going on:
				trace("You rolled it..."); 
				new js.JQuery("#start").hide(); 		
				new js.JQuery("#roll").show(); 
				//Hide any current result, if any: 
				new js.JQuery("#result").hide(); 	

			} else if (screen == diceResult) {
				trace("You rolled a " + diceResult + "\n\n"); 
				new js.JQuery("#result").show(); 	
				js.Browser.document.getElementById('diceResult').innerHTML = diceResult;
		
			}
			//Display is finished so defer to #Input listeners or continue with remainder of Ai execution. 
		}

		//############# AI ################

		////Actions: 

		function finishRoll() {
			Display(diceResult); 
		}


		function roll() {
			//Generate a random number from 1 to 6:  
			var computation = Math.ceil(Math.random() * SIDES - 1) + 1; 

			//Convert to string:
			diceResult = Std.string(computation); 

			//Wait a second before revealing the roll result: 
			haxe.Timer.delay(finishRoll, 1000); 
		}

		///Primary function: 
		function Ai(command) {

			//Process command:

			if(command == 'init') {
				//Welcome the user:
				Display('start'); 
				return; //(defer to #Input listener)
			}

			//Determine action based on what screen we on:
			if(command == 'R') {

				//Commence the dice rolling! 
				roll(); 

				//Update the screen: 
				Display('roll'); 
			}
		}


		//############# INPUT ################

		function keyDownHandler(event:KeyboardEvent) {

			if(event.keyCode == Keyboard.R) {
				trace("--typed R."); 
				//Send this news to Ai for processing: 
				Ai('R'); 

			} else if (event.keyCode == Keyboard.E) {
				trace("--typed E."); 
				//Ai(true, event.keyCode); 
			}
		}

		//Listeners: 
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler); 		

		//Start game: 
		Ai('init'); 
	}
	
}