package pkg1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReceiveBBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookid = Integer.parseInt(request.getParameter("bookID"));
		int uid = Integer.parseInt(request.getParameter("userID"));
		String borrowedDate = request.getParameter("borrowedDate");
		String returnDate = request.getParameter("returnDate");
		String status = request.getParameter("status");
		
		boolean result = new BBookManager().save(bookid, uid, borrowedDate, returnDate, status);

		if (result) {
			response.sendRedirect("issueBook.jsp?success=Successfully issued book to student");
		} else {
		    response.sendRedirect("issueBook.jsp?error=Invalid+credentials");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
