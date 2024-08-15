<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="pkg1.Book"%>
<%@ page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Books</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<style>

 .section-container {
        margin: 20px auto;
        max-width: 1200px;
    }
    
    .table {
        margin-bottom: 0;
    }
    
    .table th {
        background-color: #f8f9fa;
        font-weight: bold;
    }
    
    .table td, .table th {
        vertical-align: middle;
        text-align: center;
    }
    
    .table tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    
    .table-bordered {
        border: 1px solid #dee2e6;
    }
    
    .table-bordered td, .table-bordered th {
        border: 1px solid #dee2e6;
    }
    
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

.footer {
    background-color: #f8f9fa; 
    color: #333333; 
    padding: 20px;
    text-align: center;
    margin-top: 50px;
    border-top: 1px solid #e0e0e0; 
}

.footer a {
    color: #333333;
    margin: 0 10px;
    font-size: 20px;
}

.footer a:hover {
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
                <a class="nav-link" href="makeRecords.jsp">Make Records</a>
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

<div class="container mt-4">
  <div class="row">
    <div id="addBook" class="col-md-4 mb-3">
      <div class="section-container border rounded-3 shadow-sm bg-white p-3">
        <h2 class="text-center">Add Book</h2>
        <form action="ReceiveBook" method="post" class="mb-4">
        <input type="hidden" name="action" value="addOrUpdate">
        <input type="hidden" name="bookID" id="bookID">
        <div class=" mb-3">
            <label for="title" class="col-sm-2 col-form-label">ISBN</label>
            <input type="text" class="form-control" id="title" name="isbn" required>
        </div>
        <div class="mb-3">
            <label for="title" class="col-sm-2 col-form-label">Title</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>
        <div class="mb-3">
            <label for="author" class="col-sm-2 col-form-label">Author</label>
            <input type="text" class="form-control" id="author" name="author" required>
        </div>
        
        <div class="mb-3">
            <label for="publisher" class="col-sm-2 col-form-label">Publisher</label>
            <input type="text" class="form-control" id="publisher" name="publisher">
        </div>

        <div class="mb-3">
            <label for="publicationDate" class="col-sm-2 col-form-label">Publication Date</label>
            <input type="date" class="form-control" id="publicationDate" name="publicationDate">
        </div>
        
        <div class="mb-3">
            <label for="category" class="col-sm-2 col-form-label">Category</label>
            <input type="text" class="form-control" id="category" name="category">
        </div>
        
        <div class="mb-3">
            <label for="language" class="col-sm-2 col-form-label">Language</label>
             <input type="text" class="form-control" id="language" name="language">
        </div>
        
        <div class="mb-3">
            <label for="pages" class="col-sm-2 col-form-label">Pages</label>
            <input type="number" class="form-control" id="pages" name="pages">
        </div>
        
        <div class="mb-3">
            <label for="copiesAvailable" class="col-sm-2 col-form-label">Copies Available</label>
            <input type="number" class="form-control" id="copiesAvailable" name="copiesAvailable" required>
        </div>
        
        <div class="mb-3">
            <label for="shelfLocation" class="col-sm-2 col-form-label">Shelf Location</label>
            <input type="text" class="form-control" id="shelfLocation" name="shelfLocation">
        </div>
        
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</div>
  
    <div class="col-md-8 mb-3">
      <div class="section-container border rounded-3 shadow-sm bg-white p-3">
        <div id="searchBook">
          <h3 class="text-center">Search Book</h3>
          <form action="SearchBook" method="post">
            <div class="row">
              <div class="mb-3 col">
                <input type="text" class="form-control" id="searchId" placeholder="Enter Book's ISBN Number" name="txtSearch">
              </div>
              <div class="mb-3 col text-center">
                <input type="submit" value="Search" class="btn btn-primary">
              </div>
            </div>
          </form>     
  <%
    List<Book> books = (List<Book>) request.getAttribute("books1");
    if (books != null && !books.isEmpty()) { 
        for (Book book : books) { 
%>
            <form action="UpdateBook" method="post" class="mt-4">
                <h3>Edit Book Information</h3>
                <div class="form-group">
                    <label for="userId">Book ID:</label>
                    <input type="text" name="bookid" class="form-control" value="<%= book.getBookID() %>" readonly>
                </div>
                <div class="form-group">
                    <label for="isbn">ISBN:</label>
                    <input type="text" name="isbn" class="form-control" value="<%= book.getIsbn() %>">
                </div>
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" name="title" class="form-control" value="<%= book.getTitle() %>">
                </div>
                <div class="form-group">
                    <label for=""author"">Author:</label>
                    <input type="text" name="author" class="form-control" value="<%= book.getAuthor() %>">
                </div>
                <div class="form-group">
                    <label for="publisher">Publisher:</label>
                    <input type="text" name="publisher" class="form-control" value="<%= book.getPublisher() %>">
                </div>
                <div class="form-group">
                    <label for="publicationDate">Publication Date:</label>
                    <input type="date" name="publicationDate" class="form-control" value="<%= book.getPublicationDate() %>">
                </div>
                <div class="form-group">
                    <label for="category">Category:</label>
                    <input type="text" name="category" class="form-control" value="<%= book.getCategory() %>">
                </div>
                <div class="form-group">
                    <label for="language">Language:</label>
                    <input type="text" name="language" class="form-control" value="<%= book.getLanguage() %>">
                </div>
                <div class="form-group">
                    <label for="pages">Pages:</label>
                    <input type="text" name="pages" class="form-control" value="<%= book.getPages() %>">
                </div>
                <div class="form-group">
                    <label for="copiesAvailable">Copies Available:</label>
                    <input type="text" name="copiesAvailable" class="form-control" value="<%= book.getCopiesAvailable() %>">
                </div>
                <div class="form-group">
                    <label for="shelfLocation">Shelf Location:</label>
                    <input type="text" name="shelfLocation" class="form-control" value="<%= book.getShelfLocation() %>">
                </div>
                
                <button type="submit" class="btn btn-success mt-1">Save Changes</button>
                <button type="button" class="btn btn-danger mt-1" onclick="deleteBook('<%= book.getBookID() %>')">Delete</button>
            
            </form>
        <% } %>
    <% } else { %>
        <p>No Book found for the provided search criteria.</p>
    <% } %>

  
      
        </div>
      </div>
      <div class="container mt-5">
      <div class="section-container border rounded-3 shadow-sm bg-white p-4">
    <form action="DisplayAllBook" method="GET">
        <button type="submit" class="btn btn-primary mb-3">Display All Books</button>
    </form>

    <div class="table-responsive">
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
                    List<Book> books1 = (List<Book>) request.getAttribute("books");
                    if (books1 != null && !books1.isEmpty()) {
                        for (Book book2 : books1) {
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

<footer class="footer">
    <p>&copy; 2024 LibraTrack. All rights reserved.</p>
    <div class="social-icons">
        <a href="#"><i class="fab fa-linkedin"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-facebook"></i></a>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa7MjPjpl6JIZn6Xr6sHpe6aU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIyOMqTwG6AQYBfhOdjbCkBKoI0AqCJe0EyD3ZE7" crossorigin="anonymous"></script>
</body>
</html>
