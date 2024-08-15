function newUserValidation() {
    const name = document.querySelector('input[name="txtName"]').value.trim();
    const email = document.querySelector('input[name="txtEmail"]').value.trim();
    const phone = document.querySelector('input[name="txtPhone"]').value.trim();
    const loginID = document.querySelector('input[name="txtUser"]').value.trim();
    const password = document.querySelector('input[name="txtPassword"]').value;
    const agreementChecked = document.querySelector('input[name="agreement"]').checked;

    const phoneRegex = /^\d{10}$/;

    if (name.length < 6 || name.length > 20) {
        alert('Name must be between 6 and 20 characters.');
        return false;
    }

    if (!validateEmail(email)) {
        alert('Please enter a valid email address.');
        return false;
    }

    if (!phoneRegex.test(phone)) {
        alert('Phone number must be 10 digits.');
        return false;
    }

    if (loginID.length < 6 || loginID.length > 20) {
        alert('Login ID must be between 6 and 20 characters.');
        return false;
    }

    if (password.length < 6) {
        alert('Password must be at least 6 characters.');
        return false;
    }

    if (!agreementChecked) {
        alert('You must agree to the terms.');
        return false;
    }

    return true;
}

function loginValidateForm() {
    const username = document.querySelector('input[name="txtUser"]').value.trim();
    const password = document.querySelector('input[name="txtPass"]').value.trim();

    if (username.length < 6 || username.length > 20) {
        alert('Username must be between 6 and 20 characters.');
        return false;
    }

    if (password.length < 6) {
        alert('Password must be at least 6 characters.');
        return false;
    }

    return true;
}

function newLibrarianValidation() {
    var name = document.getElementById("Input1").value.trim();
    var email = document.getElementById("Input2").value.trim();
    var phone = document.getElementById("Input3").value.trim();
    var loginId = document.getElementById("Input4").value.trim();
    var password = document.getElementById("Input5").value.trim();
    var userType = document.getElementById("Input6").value;
    
    var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    var phonePattern = /^[0-9]{10}$/;

    if (name === "") {
        alert("Name is required.");
        return false;
    }

    if (email === "" || !emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }

    if (phone === "" || !phonePattern.test(phone)) {
        alert("Please enter a valid 10-digit phone number.");
        return false;
    }

    if (loginId === "") {
        alert("Login ID is required.");
        return false;
    }

    if (password === "") {
        alert("Password is required.");
        return false;
    }

    if (userType === "") {
        alert("User Type is required.");
        return false;
    }

    return true;
}

function validateEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}
