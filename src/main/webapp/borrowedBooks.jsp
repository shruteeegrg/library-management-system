<%@ page import="pkg1.BBook"%>
<%@ page import="pkg1.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LibraTrack - Borrowed Books</title>
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
        .card-img-top {
            width: 100%;
            height: 180px;
            object-fit: cover;
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
    <a class="navbar-brand" href="dashboardStudent.jsp">LibraTrack</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link" href="dashboardStudent.jsp">Back to Dashboard</a>
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
    String currentUser = null;
    HttpSession sessions = request.getSession(false);
    if (session == null || session.getAttribute("currentUser") == null) {
        response.sendRedirect("login.jsp");
        return;
    } else {
        currentUser = (String) session.getAttribute("currentUser");
    }
    %>
    <h1>Student Dashboard</h1>
    <p>Welcome Back, <%= currentUser %></p>
</header>

<div class="container mt-4">
    <div class="row">
        <div class="section-container border rounded-3 shadow-sm bg-white p-4">
            <form action="DisplayBorrowedBookS" method="GET">
               <%
    Object objUid = session.getAttribute("currentUid");
    int uid = 0;

    if (objUid instanceof Integer) {
        uid = (Integer) objUid;
    } else if (objUid instanceof String) {
        uid = Integer.parseInt((String) objUid);
    }
%>
                <input type="hidden" name="txtUserId" value="<%= uid %>">
                <button type="submit" class="btn btn-primary mb-3">Display All Borrowed Books</button>
            </form>
        </div>

       <%
        List<BBook> borrowedBooks = (List<BBook>) request.getAttribute("borrowedBooks");
        if (borrowedBooks != null && !borrowedBooks.isEmpty()) {
        %>
        <table class="table table-striped mt-3">
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Borrowed Date</th>
                    <th>Return Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (BBook bbook : borrowedBooks) {
                %>
                <tr>
                    <td><%= bbook.getBook() %></td>
                    <td><%= bbook.getBorrowedDate() %></td>
                    <td><%= bbook.getReturnDate() %></td>
                    <td><%= bbook.getStatus() %></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
        <%
        } else {
        %>
        <p>No borrowed books found.</p>
        <%
        }
        %>
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