$(document).ready(function(){


    $('div.searchbar input').keyup(function(event){
        if ( event.keyCode === 13){
            console.log('ENTER IS CLICKED');
            event.preventDefault();
        }
    })

})