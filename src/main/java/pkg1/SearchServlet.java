package pkg1;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strSearch = request.getParameter("txtSearch");
        String userType = request.getParameter("cmbUserType");

        LoginManager lm = new LoginManager();
        List<User> users = lm.search(strSearch, userType);
	
		request.setAttribute("users", users);
		if(userType.equals("Librarian")) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("NewLibrarian.jsp?success=Successfully searched librarian\");");
			requestDispatcher.forward(request, response);
		}else {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("DisplaySearchUser.jsp");
			requestDispatcher.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}