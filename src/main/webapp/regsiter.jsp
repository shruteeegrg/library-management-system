<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library Track</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="validation.js"></script>
<style>
@import url('https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css');

:root {
    --primary-color: #007bff; /* blue color */
    --secondary-color: #6c757d; /* grey color */
    --background-color: #f0f2f5; /* light grey background */
    --form-background-color: #ffffff; /* pure white background */
    --text-color: #333; /* dark grey text */
    --link-color: #007bff; /* blue color for links */
    --link-hover-color: #0056b3; /* darker blue color for link hover */
}

body {
    background-color: var(--background-color);
    color: var(--text-color);
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}


.logo img {
    height: 90px; /* Adjust size as needed */
    width: auto; /* Maintain aspect ratio */
}

.container {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.registration-container {
    display: flex;
    max-width: 900px;
    width: 100%;
    border-radius: 10px;
    background-color: var(--form-background-color);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
}

.registration-image {
    flex: 1;
    background: url('image/lib5.jpg') no-repeat center center;
    background-size: cover;
    min-height: 400px;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
}

.registration-form {
    flex: 1;
    padding: 30px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.registration-form h1 {
    font-family: 'Georgia', serif;
    color: var(--primary-color);
    margin-bottom: 15px;
}

.registration-form p {
    color: var(--secondary-color);
    margin-bottom: 20px;
}

.form-label {
    color: var(--secondary-color);
}

.btn-primary {
    background-color: var(--primary-color);
    border: none;
    transition: background-color 0.2s ease;
}

.btn-primary:hover {
    background-color: var(--link-hover-color);
}

.register-link {
    text-align: center;
    margin-top: 15px;
}

.register-link a {
    color: var(--link-color);
    text-decoration: none;
}

.register-link a:hover {
    text-decoration: underline;
    color: var(--link-hover-color);
}

footer {
    background-color: var(--form-background-color);
    padding: 0.5rem 0;
    text-align: center;
    color: var(--secondary-color);
    width: 100%;
}
</style>
<script>

    function showAlert(message) {
        alert(message);
    }

    function checkForAlerts() {
        const urlParams = new URLSearchParams(window.location.search);
        const successMessage = urlParams.get('success');
        if (successMessage) {
            showAlert(successMessage);
        }
    }

    document.addEventListener('DOMContentLoaded', checkForAlerts);
</script>
</head>
<body>
<header>
    <div class="logo">
        <img src="image/liblogo1.png" alt="LibTrack Logo"> 
    </div>
</header>

<div class="container">
    <div class="registration-container">
        <div class="registration-image"></div>
        <div class="registration-form">
            <h1 class="text-center mb-2 animate__animated animate__fadeInDown">Register</h1>
            <p class="text-center mb-4 animate__animated animate__fadeInDown animate__delay-0.2s">Ensuring Ease, Efficiency, and Engagement</p>
            <form onsubmit="return newUserValidation()" action='ReceiveUser' method="POST">
    <div class="mb-4">
        <label for="Input1" class="form-label animate__animated animate__fadeInDown animate__delay-0.3s">Name:</label>
        <input type="text" class="form-control animate__animated animate__fadeInDown animate__delay-0.3s" id="Input1" placeholder="Enter your name" name='txtName'>
    </div>
    <div class="mb-4">
        <label for="Input2" class="form-label animate__animated animate__fadeInDown animate__delay-0.4s">Email:</label>
        <input type="email" class="form-control animate__animated animate__fadeInDown animate__delay-0.4s" id="Input2" placeholder="Enter your email" name='txtEmail'>
    </div>
    <div class="mb-4">
        <label for="Input3" class="form-label animate__animated animate__fadeInDown animate__delay-0.5s">Phone:</label>
        <input type="text" class="form-control animate__animated animate__fadeInDown animate__delay-0.5s" id="Input3" placeholder="Enter your phone number" name='txtPhone'>
    </div>
    <div class="mb-4">
        <label for="Input4" class="form-label animate__animated animate__fadeInDown animate__delay-0.6s">Login ID:</label>
        <input type="text" class="form-control animate__animated animate__fadeInDown animate__delay-0.6s" id="Input4" placeholder="Enter your login ID" name='txtUser'>
    </div>
    <div class="mb-4">
        <label for="Input5" class="form-label animate__animated animate__fadeInDown animate__delay-0.7s">Login Password:</label>
        <input type="password" class="form-control animate__animated animate__fadeInDown animate__delay-0.7s" id="Input5" placeholder="Enter your password" name='txtPassword'>
    </div>
    <div class="mb-4">
        <label for="Input6" class="form-label animate__animated animate__fadeInDown animate__delay-0.8s">User Type:</label>
        <select name='cmbUserType' class="form-control" id="Input6">
          <option value='Admin'>Admin</option>
          <option value='Student'>Student</option>
          <option value='Staff'>Staff</option>
        </select>
    </div>
    <div class="mb-4 form-check">
        <input type="checkbox" class="form-check-input animate__animated animate__fadeInDown animate__delay-0.8s" id="agreement" name="agreement">
        <label class="form-check-label" for="agreement">I agree to the <a href="terms-and-conditions.html">terms and conditions</a></label>
    </div>
    <div class="mb-4 d-grid">
        <button type="submit" class="btn btn-primary animate__animated animate__zoomIn animate__delay-0.9s">Register</button>
    </div>
</form>
            <div class="register-link animate__animated animate__fadeInUp animate__delay-1s">
                <p>Already have an account? <a href="login.jsp">Login Here</a></p>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2024 Library Track. All rights reserved.</p>
</footer>
</body>
</html>
