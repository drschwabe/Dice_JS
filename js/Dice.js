$(document).ready(function() {

	console.log('hello world'); 


	//############# DISPLAY ################
	
	//Define UI elements: 
	var die = $('#die'); 

	$('#startScreen').show(); 
	$('#dieScreen').hide(); 




	//############# INPUT ################

	$('#rollBtn').click(function() {
		$('#startScreen').hide(); 
		$('#dieScreen').show(); 	


		setTimeout(function () {
			die.addClass('spin'); 
			}, 1000); 


		setTimeout(function () {
			die.addClass('show-bottom'); 
			}, 2500); 
					
	}); 

});