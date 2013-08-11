$(document).ready(function() {

	console.log('hello world'); 


	//############# DISPLAY ################
	
	//Define UI elements: 
	var die = $('#die'); 

	$('#startScreen').show(); 
	$('#dieScreen').hide(); 


	//############# AI ################

	function Ai(command) {
		if (command == 'Roll') {
			$('#startScreen').hide(); 
			$('#dieScreen').show();

			setTimeout(function () {
				die.addClass('spin'); 
				}, 1000); 


			setTimeout(function () {
				die.addClass('show-bottom'); 
				}, 2500); 

		}
	}



	//############# INPUT ################

	$('#rollBtn').click(function() {
		Ai('Roll')
	}); 

});