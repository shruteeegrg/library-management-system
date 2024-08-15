<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="pkg1.BBook"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LibraTrack - View Records</title>
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
        .container {
            margin-top: 30px;
        }
        .table {
            margin-top: 20px;
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

<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="dashboardA.jsp">LibraTrack</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link" href="NewLibrarian.jsp">Manage Librarian</a>
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

<% 
    HttpSession sessions = request.getSession(false);
    if(session == null || session.getAttribute("currentUser") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String currentUser = (String) session.getAttribute("currentUser");
    }
%>

<header class="header">
    <h1>View Reports</h1>
    <p>Access and manage borrowing history and member records.</p>
</header>
<div class="container">
    <h2>Borrowing History</h2>
    <form action="SearchBBookA" method="GET">
        <div class="mb-3">
            <label for="search" class="form-label">Search Borrowing Records:</label>
            <input type="text" id="search" name="search" class="form-control" placeholder="Enter Book ID or User ID">
        </div>
        <button type="submit" class="btn btn-primary mb-3">Search</button>
    </form>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>BorrowedBookID</th>
                <th>BookID</th>
                <th>UserID</th>
                <th>Borrowed Date</th>
                <th>Return Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<BBook> borrowedBooks = (List<BBook>) request.getAttribute("bbooks");
                if (borrowedBooks != null && !borrowedBooks.isEmpty()) {
                    for (BBook borrowedBook : borrowedBooks) {
            %>
            <tr>
                <td><%= borrowedBook.getBorrowedBookID() %></td>
                <td><%= borrowedBook.getBook() %></td>
                <td><%= borrowedBook.getUser() %></td>
                <td><%= borrowedBook.getBorrowedDate() %></td>
                <td><%= borrowedBook.getReturnDate() %></td>
                <td><%= borrowedBook.getStatus() %></td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="6">No records found</td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>
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
