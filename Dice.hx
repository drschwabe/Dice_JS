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
		
		////Define UI elemnts: 
		var rollBtn = js.Browser.document.getElementById('rollBtn'); 
		var rollAgainBtn = js.Browser.document.getElementById('rollAgainBtn');
		var homeBtn = js.Browser.document.getElementById('homeBtn');

		////
		function showDie(face) {

			switch(face) {

				case '1': 
					//new js.JQuery("#top").show();
					new js.JQuery("#die").attr('class', 'show-top'); 

				case '2': 
					new js.JQuery("#die").attr('class', 'show-front'); 
				
				case '3': 
					new js.JQuery("#die").attr('class', 'show-right'); 
				
				case '4': 
					new js.JQuery("#die").attr('class', 'show-left'); 
				
				case '5': 
					new js.JQuery("#die").attr('class', 'show-back'); 

				case '6': 
					new js.JQuery("#die").attr('class', 'show-bottom'); 
				}
		}

		//Timed actions: 
		function stopRolling() {
			//Return rolling button back to normal: 				
			rollAgainBtn.innerHTML = 'ROLL again'; 
			new js.JQuery("#rollAgainBtn").removeClass("rolling"); 
			trace(diceResult); 

			//Final animation for the die: 
			//new js.JQuery("#die ").addClass("animated bounceInDown"); 
		}

		////Hide everything initially: 
		new js.JQuery("#start").hide(); 
		new js.JQuery("#rollBtn ").hide(); 		
		new js.JQuery("#gameplayUI").hide(); 
		new js.JQuery("#dice").hide();


		////Primary function: 
		function Display(screen) {

			//Log the current screen Ai can keep track of where we are: 
			currentScreen = screen; 	

			if (screen == 'start') {

				//Hide previous screens if existing: 
				new js.JQuery("#gameplayUI").hide(); 
				new js.JQuery("#dice").hide(); 

				//Welcome user: 
				trace("Welcome to DICE.  Are you ready to roll?\n(R)oll (E)xit");
				new js.JQuery("#start").show();
				
				//Animate stuff: 
				new js.JQuery("#logo").addClass('animated bounceIn'); 
				new js.JQuery("#rollBtn ").show(); 
				new js.JQuery("#rollBtn ").addClass("animated bounceInUp"); 
		

			} else if (screen == 'rolling') {
				//Hide previous menu if existing: 
				new js.JQuery("#start").hide();
				//Unhide the screens:   
				new js.JQuery("#gameplayUI").show(); 
				new js.JQuery("#dice").show();			

				//UI...
				trace("Rolling..."); 
				rollAgainBtn.innerHTML = 'ROLLING'; 
				new js.JQuery("#rollAgainBtn").addClass("rolling"); 	

				//animation...

				//and then stop it: 
				haxe.Timer.delay(stopRolling, 900); 

			}

			//Display is finished so defer to #Input listeners or continue with remainder of Ai execution. 
		}

		//############# AI ################

		////Actions: 

		function finishRoll() {
		 	showDie(diceResult); 
		}

		function roll() {
			//Generate a random number from 1 to 6:  
			var computation = Math.ceil(Math.random() * SIDES - 1) + 1; 

			//Convert to string:
			diceResult = Std.string(computation); 

			//Initiate rolling animation... 
			Display('rolling'); 

			//then reveal the result: 
			haxe.Timer.delay(finishRoll, 700); 			

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
			}
		}

		//############# INPUT ################

		function clickHandLer(event:MouseEvent) {
			trace('mouse clicked.'); 
			if(event.target == homeBtn) {
				Display('start'); 
			//All other menu buttons do a dice roll: 
			} else {
				Ai('R'); 				
			}
		}

		//Keyboard controls:
		function keyDownHandler(event:KeyboardEvent) {

			if(event.keyCode == Keyboard.R) {
				trace("--typed R."); 
				//Send this news to Ai for processing: 
				Ai('R'); 

			} else if (event.keyCode == Keyboard.E) {
				trace("--typed E."); 
		
			} else if (event.keyCode == Keyboard.ESCAPE) {
				trace("--typed ESC."); 
				Display('start'); 				
			}			
		}
		
		////Listeners: 
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler); 
		rollBtn.addEventListener(MouseEvent.CLICK, clickHandLer); 			
		rollAgainBtn.addEventListener(MouseEvent.CLICK, clickHandLer); 		
		homeBtn.addEventListener(MouseEvent.CLICK, clickHandLer); 			


		//Start game: 
		Ai('init'); 
	}
	
}