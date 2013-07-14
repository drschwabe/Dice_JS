import flash.display.Sprite;
import js.jQuery.*; 
import js.Browser.*;
import flash.events.*;
import flash.ui.Keyboard;

class Main extends Sprite {
	
	public function new () {
		
		super ();

		////Define variables: 
		var SIDES = 6; 
		var diceResult = null;
			
		//############# INPUT ################
		////Events: 
		function clickHandler(event:MouseEvent) {
			trace("You clicked on something!"); 
			new js.JQuery("#start").hide(); 
		}

		function keyDownHandler(event:KeyboardEvent) {
			trace("You typed something!"); 
			if(event.keyCode == Keyboard.R) {
				trace("You are ready, that's great."); 
			}
		}

		//Listeners: 
		stage.addEventListener(MouseEvent.CLICK, clickHandler); 
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler); 


		//############# DISPLAY ################
		////Initial settings:  
		new js.JQuery("#start").hide(); 
		new js.JQuery("#roll").hide(); 	

		////Primary function: 
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
		function Ai() {
			//Ai starts up: 
			Display('start'); 
		}

		Ai(); 
	}
	
}