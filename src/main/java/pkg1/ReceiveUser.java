package pkg1;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ReceiveUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Receive
		String fullName = request.getParameter("txtName");
		String email = request.getParameter("txtEmail");
		String phone = request.getParameter("txtPhone");
		String user = request.getParameter("txtUser");
		String password = request.getParameter("txtPassword");
		String userType = request.getParameter("cmbUserType");
		boolean result = new LoginManager().save(fullName, email, phone, user, password, userType);
		
		
		if (result) {
			if(userType.equals("Librarian")) {
				System.out.println("Saved");
				response.sendRedirect("NewLibrarian.jsp?success=Successfully added librarian");
			}else {
				System.out.println("Saved");
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
				requestDispatcher.forward(request, response);
			}
			
		}
		else {
			System.out.println("Error");
			response.sendRedirect("regsiter.jsp?error=Invalid+credentials");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
