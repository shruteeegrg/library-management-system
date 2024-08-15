<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LibraTrack - Issue Book</title>
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

        .container {
            margin-top: 30px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
        }

        footer {
            background-color: #f8f9fa;
            color: #333333;
            padding: 20px;
            text-align: center;
            margin-top: 50px;
            border-top: 1px solid #e0e0e0;
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

<% 
    HttpSession sessions = request.getSession(false);
    if(session == null || session.getAttribute("currentUser") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String currentUser = (String) session.getAttribute("currentUser");
    }
%>

<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="dashboardL.jsp">LibraTrack</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link" href="manageBooks.jsp">Manage Books</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="issueBook.jsp">Issue Books</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="viewRecords.jsp">View Records</a>
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
    <h1>Issue a Book</h1>
    <p>Fill out the form below to issue a book to Students.</p>
</header>

<div class="container">
    <form action="ReceiveBBook" method="post">
        <div class="form-group">
            <label for="bookID">Book ID</label>
            <input type="number" class="form-control" id="bookID" name="bookID" required>
        </div>
        <div class="form-group">
            <label for="userID">User ID</label>
            <input type="number" class="form-control" id="userID" name="userID" required>
        </div>
        <div class="form-group">
            <label for="borrowedDate">Borrowed Date</label>
            <input type="date" class="form-control" id="borrowedDate" name="borrowedDate" required>
        </div>
        <div class="form-group">
            <label for="returnDate">Return Date</label>
            <input type="date" class="form-control" id="returnDate" name="returnDate">
        </div>
        <div class="form-group">
            <label for="status">Status</label>
            <select class="form-control" id="status" name="status" required>
                <option value="Onloan">On loan</option>
                <option value="Returned">Returned</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Issue Book</button>
    </form>
</div>

<footer>
    <p>&copy; 2024 LibraTrack. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
