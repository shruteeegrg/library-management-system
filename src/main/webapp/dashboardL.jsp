<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LibraTrack - Librarian Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<style>
body {
    background-color: #ffffff; 
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.navbar {
    background-color: #f8f9fa; 
    padding: 1rem 2rem;
    border-bottom: 1px solid #e0e0e0; 
}

.navbar-brand {
    font-size: 24px;
    color: #333333; 
    font-weight: bold;
}

.navbar-nav .nav-link {
    color: #333333 !important; 
    font-size: 18px;
    margin-right: 15px;
}

.navbar-nav .nav-link:hover {
    color: #007bff !important; 
}

.social-icons a {
    color: #333333; 
    margin-left: 15px;
    font-size: 20px;
}

.header {
    background-color: #f0f0f0;
    color: #333333; 
    padding: 50px 0;
    text-align: center;
    clip-path: polygon(0 0, 100% 0, 100% 85%, 0 100%);
}

.header h1 {
    font-size: 48px;
    font-weight: bold;
    margin-bottom: 20px;
}

.header p {
    font-size: 24px;
    margin-bottom: 0;
}

.container .dashboard-content {
    margin-top: -50px;
    display: flex;
    flex-wrap: wrap;
    gap: 30px;
    justify-content: space-between;
}

.card {
    background-color: #ffffff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05); 
    border-radius: 10px;
    overflow: hidden;
    transition: transform 0.3s ease;
    flex: 1 1 calc(33.333% - 20px);
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    border: 1px solid #e0e0e0;
}

.card:hover {
    transform: translateY(-10px);
}

.card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.card-body {
    padding: 20px;
}

.card-title {
    font-size: 24px;
    font-weight: bold;
    color: #333333; 
}

.card-text {
    font-size: 16px;
    color: #555555;
    margin-bottom: 20px;
}

.btn-primary {
    background-color: #007bff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
}

.btn-primary:hover {
    background-color: #0056b3;
}

footer {
    background-color: #f8f9fa; 
    color: #333333;
    padding: 20px;
    text-align: center;
    margin-top: 50px;
    border-top: 1px solid #e0e0e0; 
}

footer a {
    color: #333333;
    margin: 0 10px;
    font-size: 20px;
}

footer a:hover {
    color: #007bff;
}

</style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">LibraTrack</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link" href="#manageBooks">Manage Books</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#issueBooks">Issue Books</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#viewRecords">View Records</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Logout</a>
            </li>
        </ul>
        <div class="social-icons">
            <a href="#"><i class="fab fa-linkedin"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-facebook"></i></a>
        </div>
    </div>
</nav>

<header class="header">
<% 
    HttpSession sessions = request.getSession(false);
    if(session == null || session.getAttribute("currentUser") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String currentUser = (String) session.getAttribute("currentUser");
    
%>
  <h1>Librarian Dashboard</h1>
<p>Welcome Back, <% out.println(currentUser); }%><p>
</header>

<div class="container">
    <div class="dashboard-content">
        <div id="manageBooks" class="card">
            <img src="image/lib4.jpg" alt="Manage Books">
            <div class="card-body">
                <h5 class="card-title">Manage Books</h5>
                <p class="card-text">Organize, add, or remove books from the library collection.</p>
                <a href="manageBooks.jsp" class="btn btn-primary">Manage Books</a>
            </div>
        </div>

        <div id="issueBooks" class="card">
            <img src="image/lib5.jpg" alt="Issue Books">
            <div class="card-body">
                <h5 class="card-title">Issue Books</h5>
                <p class="card-text">Issue books to members and manage due dates.</p>
                <a href="issueBook.jsp" class="btn btn-primary">Issue Books</a>
            </div>
        </div>

        <div id="viewRecords" class="card">
            <img src="image/lib1.jpg" alt="View Records">
            <div class="card-body">
                <h5 class="card-title">Make Records</h5>
                <p class="card-text">Access and manage borrowing history and member records.</p>
                <a href="viewRecords.jsp" class="btn btn-primary">View Records</a>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2024 LibraTrack. All rights reserved.</p>
    <div class="social-icons">
        <a href="#"><i class="fab fa-linkedin"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-facebook"></i></a>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
