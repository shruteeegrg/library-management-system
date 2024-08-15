<!DOCTYPE html>
<%@ page import="pkg1.Book"%>
<%@ page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LibraTrack - Browse Books</title>
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

.container-fluid {
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

.footer {
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
    HttpSession sessions = request.getSession(false);
    if(session == null || session.getAttribute("currentUser") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String currentUser = (String) session.getAttribute("currentUser");
    %>
    <h1>Browse Books</h1>
    <p>Welcome Back, <% out.println(currentUser); } %></p>
</header>

<div class="container-fluid">
    <!-- Search Book Form -->
    <div class="row mb-4">
        <div class="col-md-12">
            <div class="section-container border rounded-3 shadow-sm bg-white p-4">
                <div id="searchBook">
                    <h3 class="text-center">Search Book</h3>
                    <form action="SearchBookS" method="post">
                        <div class="row">
                            <div class="col-md-8 mb-3">
                                <input type="text" class="form-control" id="searchId" placeholder="Enter Book's Title" name="txtSearch">
                            </div>
                            <div class="col-md-4 mb-3 text-center">
                                <input type="submit" value="Search" class="btn btn-primary">
                            </div>
                        </div>
                    </form>
                </div>
                
                <!-- Display Table of Books -->
                <div class="table-responsive mt-4">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>BookID</th>
                                <th>ISBN</th>
                                <th>Title</th>
                                <th>Author</th>
                                <th>Publisher</th>
                                <th>Publication Date</th>
                                <th>Category</th>
                                <th>Language</th>
                                <th>Pages</th>
                                <th>Copies Available</th>
                                <th>Shelf Location</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                            List<Book> books = (List<Book>) request.getAttribute("books2");
                            if (books != null && !books.isEmpty()) { 
                                for (Book book2 : books) { 
                            %>
                            <tr>
                                <td><%= book2.getBookID() %></td>
                                <td><%= book2.getIsbn() %></td>
                                <td><%= book2.getTitle() %></td>
                                <td><%= book2.getAuthor() %></td>
                                <td><%= book2.getPublisher() %></td>
                                <td><%= book2.getPublicationDate() %></td>
                                <td><%= book2.getCategory() %></td>
                                <td><%= book2.getLanguage() %></td>
                                <td><%= book2.getPages() %></td>
                                <td><%= book2.getCopiesAvailable() %></td>
                                <td><%= book2.getShelfLocation() %></td>
                            </tr>
                            <% 
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="11" class="text-center">No books found</td>
                            </tr>
                            <% 
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Display All Books Button -->
    <div class="row mb-4">
        <div class="col-md-12">
            <div class="section-container border rounded-3 shadow-sm bg-white p-4">
                <form action="DisplayAllBookS" method="GET">
                    <button type="submit" class="btn btn-primary mb-3">Display All Books</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Display Book Cards -->
    <div class="row">
        <% 
        List<Book> books1 = (List<Book>) request.getAttribute("books");
        if (books1 != null && !books1.isEmpty()) {
            for (Book book2 : books1) {
        %>
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="card">
                <img src="image/lib1.jpg" class="card-img-top" alt="<%= book2.getTitle() %>">
                <div class="card-body">
                    <h5 class="card-title">Title: <%= book2.getTitle() %></h5>
                    <p class="card-text"><strong>Author:</strong> <%= book2.getAuthor() %></p>
                    <p class="card-text"><strong>Publisher:</strong> <%= book2.getPublisher() %></p>
                    <p class="card-text"><strong>Publication Date:</strong> <%= book2.getPublicationDate() %></p>
                    <p class="card-text"><strong>Category:</strong> <%= book2.getCategory() %></p>
                    <p class="card-text"><strong>Language:</strong> <%= book2.getLanguage() %></p>
                    <p class="card-text"><strong>Pages:</strong> <%= book2.getPages() %></p>
                    <p class="card-text"><strong>Copies Available:</strong> <%= book2.getCopiesAvailable() %></p>
                    <p class="card-text"><strong>Shelf Location:</strong> <%= book2.getShelfLocation() %></p>
                </div>
            </div>
        </div>
        <% 
            }
        } else {
        %>
        <div class="col-12">
            <p class="text-center">No books found.</p>
        </div>
        <% 
        }
        %>
    </div>
</div>

<footer class="footer">
    <p>&copy; 2024 LibraTrack. All rights reserved.</p>
    <div class="social-icons">
        <a href="#"><i class="fab fa-linkedin"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-facebook"></i></a>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9kLHg+O5iXQlm8zM1QkT1zxhK04FQ0OM9uUbk4PZElF5jv4A7gJ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-pb3dcoG6FB6tF8ZTqhbWfHp+J6HhDkQ0PFRU6F2M37vvDABk5lM0tqzVZZV8FkpR" crossorigin="anonymous"></script>
</body>
</html>
