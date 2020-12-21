// jquery
$(document).ready(function () {
    console.log("Jquery is ready");
    $('[data-toggle="tooltip"]').tooltip();
    $('#profile button.btn-secondary').hide();
    $('.toast').toast('show');

    // show update email button on input clicking
    let updateEmailBtn = $('#profile button.btn-secondary');
    let editEmailInput = $('input.filed-value');

    editEmailInput.on('focus', function(event){
        updateEmailBtn.show();
    });

    updateEmailBtn.on('click', function(event){
        let email = editEmailInput.val();
        if (!email.match(/^\w+@\w+\.[a-z]{2,5}$/)){
            editEmailInput.css('color', 'red');
        } else {
            editEmailInput.css('color', 'black');

            // ajax call to update email
            let xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function(event){
                if (this.readyState == 4 && this.status){
                    let response = JSON.parse(this.responseText);
                    console.warn(response);
                    $('#update-message').text(response.description);
                    if (response.status){
                        $('#update-message').css('color', '#00ff00');
                    } else {
                        $('#update-message').css('color', '#ff0000');
                    }
                }
            }
            let data = new FormData();
            data.append('email', email);
            console.log("Email: ", email);
            xhr.open('GET', './php/update_profile.php', false);
            xhr.send(data);

        }
    })


    // table filtering

    $("#filter-grades").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("tbody#grades tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });

    $(".sidebar input").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $(".sidebar li").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });

    $('#update-password').on('click', function(event){
        if ($('#first-password').val() == $('#second-password').val()){
            $('#password-message').text("password updated successfully");
            $('#password-message').show();
        } else {
            $('#password-message').text("password didnt match");
            $('#password-message').show();

        }
        
    })
});
