package pkg1;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("txtUserID"));
		String strUser = request.getParameter("txtUser");
		String strPass = request.getParameter("txtPass");
		String userType = request.getParameter("cmbUserType");
		String savePass = "no";
		
		if (request.getParameter("chkSave") != null) {
			savePass = "yes";
		}
		
		boolean result = new LoginManager().login(uid, strUser, strPass, userType);	
		
		if (result) {  // 'result == true' can be simplified to 'result'
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", strUser);
			session.setAttribute("currentUid", uid);
			
			
			
			if (savePass.equals("yes")) {
				// Assign current user and password to cookie
				Cookie cookieUser = new Cookie("user", strUser);
				Cookie cookiePass = new Cookie("pass", strPass);
				
				
				cookieUser.setMaxAge(5); // time in seconds
				cookiePass.setMaxAge(5);
				
				response.addCookie(cookieUser);
				response.addCookie(cookiePass);
			}
			
			RequestDispatcher requestDispatcher = null;
			if (userType.equalsIgnoreCase("Admin")) {
				requestDispatcher = request.getRequestDispatcher("dashboardA.jsp?success=Successfully logged in");
			} else if (userType.equalsIgnoreCase("Librarian")) {
				requestDispatcher = request.getRequestDispatcher("dashboardL.jsp?success=Successfully logged in");
			} else if (userType.equalsIgnoreCase("Student")) {
				requestDispatcher = request.getRequestDispatcher("dashboardStudent.jsp?success=Successfully logged in");
			} else if (userType.equalsIgnoreCase("Staff")) {
				requestDispatcher = request.getRequestDispatcher("dashboardStaff.jsp?success=Successfully logged in");
			} else {
				// forward to login.jsp
				requestDispatcher = request.getRequestDispatcher("login.jsp");
			}
			requestDispatcher.forward(request, response);
		} else {
			response.sendRedirect("login.jsp?error=Invalid+credentials");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
