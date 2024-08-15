package pkg1;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DisplayAllUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String userType = request.getParameter("userType");

        List<User> users = null;
        if ("librarian".equalsIgnoreCase(userType)) {
            users = new LoginManager().getAllUsersByType("librarian");
        }

        request.setAttribute("users", users);
        request.getRequestDispatcher("DisplayLibrarians.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}