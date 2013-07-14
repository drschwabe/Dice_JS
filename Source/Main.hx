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

			} else if (screen == diceResult) {
				trace("You rolled a " + diceResult + "\n\n"); 
				new js.JQuery("#result").show(); 	
				js.Browser.document.getElementById('result').innerHTML = diceResult;
			
			} else if (screen == 'noRoll') {
				trace("Why u no wanna play dice?\n\n"); 
			}
		}

		//############# AI ################

		////Actions: 
		function roll() {
			//Generate a random number from 1 to 6:  
			var computation = Math.ceil(Math.random() * SIDES - 1) + 1; 

			//Convert to string and return: 
			return Std.string(computation); 
		}

		///Primary function: 
		function Ai(newCommand, value) {

			//Initialize the app:
			Display('start'); 

			//Process input:
			if(newCommand == true) {

				//Determine action based on what screen we on:
				if(currentScreen == 'start') {
					//Start screen asks if user wants to roll, that is the only option, so that is the new command.  Commence the dice rolling! 
					diceResult = roll(); 

					//Update the screen: 
					Display('roll'); 

					// var timer:haxe.Timer = haxe.Timer.delay(Display(diceResult), 300); 
					Display(diceResult); 
				}
			}
		}


		//############# INPUT ################

		function keyDownHandler(event:KeyboardEvent) {

			if(event.keyCode == Keyboard.R) {
				trace("--typed R."); 
				//Send this news to Ai for processing: 
				Ai(true, event.keyCode); 

			} else if (event.keyCode == Keyboard.E) {
				trace("--typed E."); 
			}
		}

		//Listeners: 
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler); 		

		//Start game: 
		Ai(null, null); 
	}
	
}