import flash.display.Sprite;
import js.jQuery.*; 
import js.Browser.*;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import flash.events.MouseEvent; 
import haxe.Timer; 

class Dice extends Sprite {
	
	public function new () {
		
		super ();

		//Define global variables: 
		var SIDES = 6; 
		var diceResult = null;
		var currentScreen = null; 


		//############# DISPLAY ################
		////Hide everything initially: 
	
		new js.JQuery("#start").hide(); 
		new js.JQuery("#roll").hide(); 
		new js.JQuery("#result").hide();

		new js.JQuery("#die1").hide();
		new js.JQuery("#die2").hide();
		new js.JQuery("#die3").hide();
		new js.JQuery("#die4").hide();
		new js.JQuery("#die5").hide();
		new js.JQuery("#die6").hide();	

		////Define UI elemnts: 
		var rollBtn = js.Browser.document.getElementById('rollBtn'); 

		////Primary function: 
		function Display(screen) {

			//Log the current screen Ai can keep track of where we are: 
			currentScreen = screen; 	

			if (screen == 'start') {
				//Welcome user: 
				trace("Welcome to DICE.  Are you ready to roll?\n(R)oll (E)xit");
				new js.JQuery("#start").show(); 

			} else if (screen == 'roll') {
				new js.JQuery("#start").hide(); 
				//Tell user what is going on:
				trace("You rolled a..."); 
				//Reveal the die: 
				new js.JQuery("#roll").show(); 
						

			} else if (screen == '1') {
				trace('show die1?'); 
				new js.JQuery("#result").show();				
				new js.JQuery("#die1").show();
				new js.JQuery("#die2").hide();
				new js.JQuery("#die3").hide();
				new js.JQuery("#die4").hide();
				new js.JQuery("#die5").hide();
				new js.JQuery("#die6").hide();				

			
			} else if (screen == '2') {
				new js.JQuery("#result").show();				
				new js.JQuery("#die1").hide();
				new js.JQuery("#die2").show();
				new js.JQuery("#die3").hide();
				new js.JQuery("#die4").hide();
				new js.JQuery("#die5").hide();
				new js.JQuery("#die6").hide();		

			} else if (screen == '3') {
				new js.JQuery("#result").show();							
				new js.JQuery("#die1").hide();
				new js.JQuery("#die2").hide();
				new js.JQuery("#die3").show();
				new js.JQuery("#die4").hide();
				new js.JQuery("#die5").hide();
				new js.JQuery("#die6").hide();			

			} else if (screen == '4') {
				new js.JQuery("#result").show();							
				new js.JQuery("#die1").hide();
				new js.JQuery("#die2").hide();
				new js.JQuery("#die3").hide();
				new js.JQuery("#die4").show();
				new js.JQuery("#die5").hide();
				new js.JQuery("#die6").hide();		

			} else if (screen == '5') {
				new js.JQuery("#result").show();							
				new js.JQuery("#die1").hide();
				new js.JQuery("#die2").hide();
				new js.JQuery("#die3").hide();
				new js.JQuery("#die4").hide();
				new js.JQuery("#die5").show();
				new js.JQuery("#die6").hide();		
	
			} else if (screen == '6') {
				new js.JQuery("#result").show();							
				new js.JQuery("#die1").hide();
				new js.JQuery("#die2").hide();
				new js.JQuery("#die3").hide();
				new js.JQuery("#die4").hide();
				new js.JQuery("#die5").hide();
				new js.JQuery("#die6").show();		
			}

			//Display is finished so defer to #Input listeners or continue with remainder of Ai execution. 
		}

		//############# AI ################

		////Actions: 
		function finishRoll() {
			trace(diceResult); 
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
			if(command == 'R') {

				//Commence the dice rolling! 
				roll(); 

				//Update the screen: 
				Display('roll'); 
			}
		}


		//############# INPUT ################

		function clickHandLer(event:MouseEvent) {
			trace('mouse clicked.'); 
			Ai('R'); 
		}

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
		
		////Listeners: 
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler); 
		rollBtn.addEventListener(MouseEvent.CLICK, clickHandLer); 			

		//Start game: 
		Ai('init'); 
	}
	
}