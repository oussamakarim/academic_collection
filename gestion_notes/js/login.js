function validateFormInputs(event){
    let username = document.getElementById('username');
    let password = document.getElementById('password');
    let professor = document.getElementById('professor');
    let student = document.getElementById('student');
    let usernameError = document.getElementById('username-error');
    let passwordError = document.getElementById('password-error');
    let accountError = document.getElementById('account-error');

    let errorStatus = false;
    if ( !username.value.length){
        usernameError.style.visibility = "visible";
        errorStatus = true;
    } else {
        usernameError.style.visibility = "hidden";
    }

    if (!password.value.length){
        passwordError.style.visibility = "visible";
        errorStatus = true;
    } else {
        passwordError.style.visibility = "hidden";
    }

    if (professor.checked || student.checked){
        accountError.style.visibility = "hidden";
    } else {
        accountError.style.visibility = "visible";
        errorStatus = true;
    }

    if (errorStatus){
        event.preventDefault();
    }
}

let submit_button = document.getElementById('submit');
submit_button.addEventListener('click', validateFormInputs
);
