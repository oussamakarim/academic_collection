/**
 * 
 */

const cards = $('#cards')
const createInput = $('#createInput');
const createCard = $('#createCard');
const followInput = $('#followInput');
const followCard = $('#followCard');

// hide input 
createInput.hide();
followInput.hide();

// set click listener on buttons
createCard.on('click', function(event){
	cards.toggle();
	createInput.toggle();
})

followCard.on('click', function(event) {
	cards.toggle();
	followInput.toggle();
})

$('.backbutton').on('click', function(){
	console.log("Button is clicked");
	cards.show();
	createInput.hide();
	followInput.hide();
})