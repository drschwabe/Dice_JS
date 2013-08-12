$(document).ready(function() {

	//############# DISPLAY ################
	
	//Define UI elements: 
	var die = $('#die'); 


	//A function to update the content/style of the Roll button; changes depending on if the die is rolling or not: 
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

	//Main function to render the screen: 
	function Display(screen) {
		
		//Log the current screen Ai can keep track of where we are: 		
		currentScreen = screen; 

		if (screen == 'Starting') {

			//Hide previous screens if existing: 
			$('.screen').hide(); 		

			//Welcome user: 
			console.log("Welcome to DICE.");			
			$('#startScreen').show(); 

			//Animate UI elements: 
			$("#rollBtn ").addClass("animated bounceInUp"); 
			$("#logo").addClass('animated bounceIn'); 
		}

		if (screen == 'Rolling') {
			//Hide start screen and show the gameplay screens: 
			$('#startScreen').hide(); 
			$('#dieScreen').show();
			$('#gameplayUI').show();
			//Make the roll button say 'ROLLING': 
			updateRollButton(); 			
		}
	}


	//############# AI ################	

	//Set some initial parameters: 
	var delayTime;  
	var spinFromClass = 'spinFromFront'; 
	var spinToClass = 'spintToFront'; 
	var rolling = false; 

	//A function to determine the appropriate class to apply to the 3D die depending on the result of the user's roll: 
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


	//Primary logic function: 
	function Ai(command) {

		if (command == 'Start') {
			//Set a brief lag after the user taps the roll button for the first time: 
			delayTime = 600;

			//Call the main Display function to render the needed screen: 
			Display('Starting');
		}

		if (command == 'Roll' && rolling == false) {

			//Now we rolling! 
			rolling = true; 

			//Perform the dice roll computation: 
			rollResult = Math.ceil(Math.random() * 6 - 1) + 1;
			console.log(rollResult); 

			//Display rolling screen...
			Display('Rolling');

			//and after a brief moment, initiate the spin animation...
			setTimeout(function () {
				die.addClass(spinFromClass); 
				}, delayTime); 

	
			//then after some spinning, 'spin to' the class for the die's landing state...
			setTimeout(function() {

				//Determine this final class based on the rollResult..
				spinToClass = determineDieClass(rollResult, 'spinTo'); 

				//and replace the previously set class with this new one:  				
				die.attr('class', spinToClass); 

			}, delayTime + 1500);  


			//and after the final spin completes, do some housekeeping: 
			setTimeout(function() {
				die.removeClass('spin'); 

				//Based on the result, determine a class we start from for the next roll (this ensures the next animation starts from the last completed roll): 
				spinFromClass = determineDieClass(rollResult, 'spinFrom'); 	

				//Update the delay time to reduce it for subsequent rolls: 
				delayTime = 0; 

				//Conclude by updating rolling status.. 
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