$(document).ready(function() {

	console.log('hello world'); 

	var die = $('#die'); 
/*

	//Animate the die after 1 second: 
	setTimeout(function () {
		die.addClass('show-bottom'); 
	}, 1000); 

	setTimeout(function () {
		die.removeClass(); 
		die.addClass('show-top'); 
	}, 2000); 	

	setTimeout(function () {
		die.removeClass(); 		
		die.addClass('show-left'); 
	}, 3000); 	

	setTimeout(function () {
		die.removeClass(); 		
		die.addClass('show-right'); 
	}, 4000); 	

	setTimeout(function () {
		die.removeClass(); 		
		die.addClass('show-front'); 
	}, 5000); 

	setTimeout(function () {
		die.removeClass(); 		
		die.addClass('show-back'); 
	}, 6000); 			
*/


setTimeout(function () {
	die.addClass('rotateEverywhere'); 
	}, 1000); 

}); 