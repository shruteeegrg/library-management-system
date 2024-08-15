<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="pkg1.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Librarians</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-8Z5sPIgyXVCq/7/sIlp/ZedYWG2Fadn2TfBX5aDh/pfJeiCVC0kG2i0GlXfhWQoN" crossorigin="anonymous"></script>
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

    .section-container {
        max-width: 800px;
        padding: 20px;
        margin: auto;
    }
    .modal-header, .modal-footer {
        background-color: #f1f1f1;
    }
    .btn-delete {
        color: white;
        background-color: #dc3545;
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


<div class="container mt-4">
  <div class="row">
    <!-- Add Librarian Section -->
    <div id="addLibrarian" class="col-md-3 mb-3">
      <div class="section-container border rounded-3 shadow-sm bg-white">
        <h2 class="text-center">Add Librarian</h2>
        <form onsubmit='return newLibrarianValidation()' action='ReceiveUser' method='post'>
          <div class="mb-3">
            <label for="Input1" class="form-label">Name:</label>
            <input type="text" class="form-control" id="Input1" placeholder="Enter librarian's name" name='txtName' required>
          </div>
          <div class="mb-3">
            <label for="Input2" class="form-label">Email:</label>
            <input type="email" class="form-control" id="Input2" placeholder="Enter librarian's email" name='txtEmail' required>
          </div>
          <div class="mb-3">
            <label for="Input3" class="form-label">Phone:</label>
            <input type="text" class="form-control" id="Input3" placeholder="Enter librarian's phone number" name='txtPhone' required>
          </div>
          <div class="mb-3">
            <label for="Input4" class="form-label">Login ID:</label>
            <input type="text" class="form-control" id="Input4" placeholder="Enter librarian's login ID" name='txtUser' required>
          </div>
          <div class="mb-3">
            <label for="Input5" class="form-label">Login Password:</label>
            <input type="password" class="form-control" id="Input5" placeholder="Enter librarian's password" name='txtPassword' required>
          </div>
          <div class="mb-3">
            <label for="Input6" class="form-label">User Type:</label>
            <select name='cmbUserType' class="form-control" id="Input6">
              <option value='Librarian'>Librarian</option>
            </select>
          </div>
          <div class="mb-3 text-center">
            <input type='submit' value='Add Librarian' class="btn btn-primary">
          </div>
        </form>
      </div>
    </div>

  
    <div class="col-md-9 mb-3">
      <div class="section-container border rounded-3 shadow-sm bg-white">
     
        <div id="searchLibrarian">
          <h3 class="text-center">Search Librarians</h3>
          <form action="SearchServlet" method="post">
            <div class="row">
              <div class="mb-3 col">
                <label for="searchId" class="form-label">Search:</label>
                <input type="text" class="form-control" id="searchId" placeholder="Enter librarian's ID or name" name="txtSearch">
              </div>
              <div class="mb-3 col">
                <label for="cmbUserType" class="form-label">User Type:</label>
                <select name="cmbUserType" class="form-control" id="cmbUserType">
                  <option value="Librarian">Librarian</option>
                </select>
              </div>
              <div class="mb-3 col text-center">
                <input type="submit" value="Search" class="btn btn-primary">
              </div>
            </div>
          </form>
         
  <% 
    List<User> users = (List<User>) request.getAttribute("users");
    if (users != null && !users.isEmpty()) { 
        for (User user : users) { 
%>
            <form action="UpdateUser" method="post" class="mt-4">
                <h3>Edit User Information</h3>
                <div class="form-group">
                    <label for="userId">User ID:</label>
                    <input type="text" name="txtUid" class="form-control" value="<%= user.getUid() %>" readonly>
                </div>
                <div class="form-group">
                    <label for="fullName">Full Name:</label>
                    <input type="text" name="txtName" class="form-control" value="<%= user.getFullName() %>">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="txtEmail" class="form-control" value="<%= user.getEmail() %>">
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" name="txtPhone" class="form-control" value="<%= user.getPhone() %>">
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="txtUser" class="form-control" value="<%= user.getLoginName() %>">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="txtPassword" class="form-control" value="<%= user.getLoginPassword() %>">
                </div>
                <div class="form-group">
                    <label for="userType" class="form-label">User Type:</label>
                    <select name="cmbUserType" class="form-control" id="userType">
                        <option value="Librarian" <%= user.getUserType().equals("Librarian") ? "selected" : "" %>>Librarian</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-success">Save Changes</button>
                <button type="button" class="btn btn-danger" onclick="deleteUser('<%= user.getUid() %>')">Delete</button>
            </form>
        <% } %>
    <% } else { %>
        <p>No Librarian found for the provided search criteria.</p>
    <% } %>

    </div>
      
        </div>
      </div>
    </div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa7MjPjpl6JIZn6Xr6sHpe6aU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIyOMqTwG6AQYBfhOdjbCkBKoI0AqCJe0EyD3ZE7" crossorigin="anonymous"></script>

</body>
</html>