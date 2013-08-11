$(document).ready(function() {

	console.log('hello world'); 


	//############# DISPLAY ################
	
	//Define UI elements: 
	var die = $('#die'); 


	//main function:
	function Display(screen) {
		
		//Log the current screen Ai can keep track of where we are: 		
		currentScreen = screen; 

		if (screen == 'Starting') {

			//Hide previous screens if existing: 
			$('.screen').hide(); 			

			//Welcome user: 
			console.log("Welcome to DICE.  Are you ready to roll?\n(R)oll (E)xit");			
			$('#startScreen').show(); 

		}

		if (screen == 'Rolling') {
			$('#startScreen').hide(); 
			$('#dieScreen').show();
			$('#gameplayUI').show();	
		}


	}


	//############# AI ################

	function Ai(command) {

		if (command == 'Start') {
			Display('Starting');
		}

		if (command == 'Roll') {

			//Perform the dice roll computation: 
			var rollResult = Math.ceil(Math.random() * 6 - 1) + 1;
			console.log(rollResult); 

			//Reset animation classes if any were added previously: 
			die.removeClass(); 
			die.addClass('default'); 						

			//In one second, initiate the spin animation: 
			setTimeout(function () {
				die.addClass('spin'); 
				}, 1000); 

			//1.5 seconds later, add the final class: 
			setTimeout(function () {
				die.addClass('show-bottom'); 
				}, 2500); 

			//Display rolling screen: 
			Display('Rolling'); 			
		}
	}



	//############# INPUT ################

	/* Main menu: */
	$('#rollBtn, #rollAgainBtn').click(function() {
		Ai('Roll')
	}); 

	/* Gameplay: */
	$('#homeBtn').click(function() {
		Ai('Start')
	}); 	
	

	Ai('Start'); 

});