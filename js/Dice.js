$(document).ready(function() {

	console.log('hello world'); 


	//############# DISPLAY ################
	
	//Define UI elements: 
	var die = $('#die'); 

	$('.screen').hide(); 
	$('#startScreen').show(); 


	//############# AI ################

	function Ai(command) {

		if (command == 'Start') {
			$('.screen').hide(); 			
			$('#startScreen').show(); 
		}

		if (command == 'Roll') {
			$('#startScreen').hide(); 
			$('#dieScreen').show();
			$('#gameplayUI').show();	

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
	$('#rollBtn').click(function() {
		Ai('Roll')
	}); 

	/* Gameplay: */
	$('#homeBtn').click(function() {
		Ai('Start')
	}); 	

	$('#rollAgainBtn').click(function() {
		Ai('Roll')
	}); 	

});