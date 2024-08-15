package pkg1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("txtUid"));
		String fullName = request.getParameter("txtName");
		String email = request.getParameter("txtEmail");
		String phone = request.getParameter("txtPhone");
		String user = request.getParameter("txtUser");
		String password = request.getParameter("txtPassword");
		String userType = request.getParameter("cmbUserType");
		boolean result = new LoginManager().update(uid, fullName, email, phone, user, password, userType);
		
		if(result) {
			if(userType.equals("Librarian")) {
				response.sendRedirect("NewLibrarian.jsp?success=Successfully updated librarian\");");
			}
		}
		else {
			System.out.print("Error updating");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
