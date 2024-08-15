<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library Track</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="validation.js"></script>
<style>
@import url('https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css');
:root {
    --primary-color: #007bff; 
    --secondary-color: #6c757d; 
    --background-color: #f0f2f5; 
    --form-background-color: #ffffff; 
    --text-color: #333; 
    --link-color: #007bff; 
    --link-hover-color: #0056b3; 
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
    height: 90px;
    width: auto; 
}

.container {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.login-container {
    display: flex;
    max-width: 900px;
    width: 100%;
    border-radius: 10px;
    background-color: var(--form-background-color);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
}

.login-image {
    flex: 1;
    background: url('image/lib5.jpg') no-repeat center center;
    background-size: cover;
    min-height: 400px;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
}

.login-form {
    flex: 1;
    padding: 30px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.login-form h1 {
    font-family: 'Georgia', serif;
    color: var(--primary-color);
    margin-bottom: 15px;
}

.login-form p {
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
        <img src="image/liblogo1.png" alt="librarytrack Logo"> 
    </div>
</header>

<div class="container">
    <div class="login-container">
        <div class="login-image"></div>
        <div class="login-form">
            <h1 class="text-center mb-2 animate__animated animate__fadeInDown">Welcome Back to Library Track</h1>
            <p class="text-center mb-4 animate__animated animate__fadeInDown animate__delay-0.2s">Ensuring Ease, Efficiency, and Engagement</p>
            <form onsubmit="return loginValidateForm()" action='LoginServlet'>
            <div class="mb-4">
        <label for="Input3" class="form-label animate__animated animate__fadeInDown animate__delay-0.3s">You are?</label>
        <select name='cmbUserType' class="form-control" id="Input6">
          <option value='Admin'>Admin</option>
          <option value='Librarian'>Librarian</option>
          <option value='Student'>Student</option>
          <option value='Staff'>Staff</option>
        </select>
    </div>
    <div class="mb-4">
                    <label for="Input4" class="form-label animate__animated animate__fadeInDown animate__delay-0.4s">UserID:</label>
                    <input type="text" class="form-control animate__animated animate__fadeInDown animate__delay-0.4s" id="Input4" placeholder="Enter your User ID" name='txtUserID'>
                </div>
                <div class="mb-4">
                    <label for="Input1" class="form-label animate__animated animate__fadeInDown animate__delay-0.4s">Username:</label>
                    <input type="text" class="form-control animate__animated animate__fadeInDown animate__delay-0.4s" id="Input1" placeholder="Enter your username" name='txtUser'>
                </div>
                <div class="mb-4">
                    <label for="Input2" class="form-label animate__animated animate__fadeInDown animate__delay-0.5s">Password:</label>
                    <input type="password" class="form-control animate__animated animate__fadeInDown animate__delay-0.5s" id="Input2" placeholder="Enter your password" name='txtPass'>
                </div>
                <div class="mb-5 d-grid">
                    <button type="submit" class="btn btn-primary animate__animated animate__zoomIn animate__delay-0.7s">Login</button>
                </div>
                <div class="register-link animate__animated animate__fadeInUp animate__delay-0.8s">
                    <p>Do not have an account? <a href="regsiter.jsp">Register here</a></p>
                </div>
            </form>
        </div>
    </div>
</div>
<footer>
    <p>&copy; 2024 LibraryTrack. All rights reserved.</p>
</footer>
</body>
</html>
