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
			Display('Rolling')

			die.removeClass(); 
			die.addClass('default'); 			

			setTimeout(function () {
				die.addClass('spin'); 
				}, 1000); 

			setTimeout(function () {
				die.addClass('show-bottom'); 
				}, 2500); 

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