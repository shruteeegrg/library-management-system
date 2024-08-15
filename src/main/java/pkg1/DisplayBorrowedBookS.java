package pkg1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class DisplayBorrowedBookS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     
	        int uid = Integer.parseInt(request.getParameter("txtUserId"));
	        List<BBook> borrowedBooks = new BookManager().getBorrowedBooksByUser(uid);

	        request.setAttribute("borrowedBooks", borrowedBooks);
	        request.getRequestDispatcher("borrowedBooks.jsp?success=Successfully displayed borrowed book").forward(request, response);
	    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
