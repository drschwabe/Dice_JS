$(document).ready(function() {

	//############# DISPLAY ################
	
	//Define UI elements: 
	var die = $('#die'); 


	function updateRollButton() {
		var rollAgainBtn = $('#rollAgainBtn'); 
		if(rolling == true ) { 
			rollAgainBtn.addClass('rolling'); 
			rollAgainBtn.html('ROLLING');		
		} else {
			rollAgainBtn.html('ROLL again');					
			rollAgainBtn.removeClass('rolling'); 	
		}
	}

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
			updateRollButton(); 			
		}
	}


	//############# AI ################	

	//Set some initial parameters: 
	var delayTime;  
	var spinFromClass = 'spinFromFront'; 
	var spinToClass = 'spintToFront'; 
	var rolling = false; 

	function determineDieClass(result, status) {

		if(status == 'spinTo') { 
			switch(result) {

				case 1: 
					return 'spinToTop';
					break;
				case 2: 
					return 'spinToFront' ;
					break;
				case 3: 
					return 'spinToRight' ;
					break;
				case 4: 
					return 'spinToLeft' ;
					break;
				case 5: 
					return 'spinToBack' ;
					break;
				case 6: 
					return 'spinToBottom' ;
					break;					
			}
		}

		if(status == 'spinFrom') {
			switch(result) {

				case 1: 
					return 'spinFromTop';
					break;
				case 2: 
					return 'spinFromFront' ;
					break;
				case 3: 
					return 'spinFromRight' ;
					break;
				case 4: 
					return 'spinFromLeft' ;
					break;
				case 5: 
					return 'spinFromBack' ;
					break;
				case 6: 
					return 'spinFromBottom' ;
					break; 
			}
		}
	}	


	//Primary function: 
	function Ai(command) {

		if (command == 'Start') {
			delayTime = 600;
			Display('Starting');
		}

		if (command == 'Roll' && rolling == false) {

			rolling = true; 

			//Perform the dice roll computation: 
			rollResult = Math.ceil(Math.random() * 6 - 1) + 1;
			console.log(rollResult); 


			//Display rolling screen: 
			Display('Rolling'); 			

			
			//In one second, initiate the spin animation...
			setTimeout(function () {
				die.addClass(spinFromClass); 
				}, delayTime); 

	
			//And add the final class: 
			setTimeout(function() {

				//Determine the final class based on the rollResult..
				spinToClass = determineDieClass(rollResult, 'spinTo'); 

				//Replace the previously set class with the new one:  				
				die.attr('class', spinToClass); 

			}, delayTime + 1500);  


			setTimeout(function() {
				die.removeClass('spin'); 
				//Based on the result, determine a class we start from for the next roll (this ensures animation starts from the last completed roll): 
				spinFromClass = determineDieClass(rollResult, 'spinFrom'); 	

				//Update the delay time to reduce it for subsequent rolls: 
				delayTime = 0; 

	
				//Conclude by updating rolling status.., 
				rolling = false; 
				//and have display update the Roll Again button content: 
				updateRollButton(); 


			}, delayTime + 2000); 

		}	
	}


	//############# INPUT ################

	/* Main menu: */
	$('#rollBtn, #rollAgainBtn').click(function() {

		Ai('Roll'); 
	}); 

	/* Gameplay: */
	$('#homeBtn').click(function() {
		Ai('Start')
	}); 	
	

	Ai('Start'); 

});