package pkg1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReceiveBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isbn = request.getParameter("isbn");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String publicationDate = request.getParameter("publicationDate");
		String category = request.getParameter("category");
		String language = request.getParameter("language");
		int pages = Integer.parseInt(request.getParameter("pages"));
		int copiesAvaiable = Integer.parseInt(request.getParameter("copiesAvailable"));
		String shelfLocation = request.getParameter("shelfLocation");
		
		boolean result = new BookManager().save(isbn, title, author, publisher, publicationDate, category, language, pages, copiesAvaiable,shelfLocation);
		
		
		if (result) {
			response.sendRedirect("manageBooks.jsp?success=Successfully saved book");
		} else {
		    response.sendRedirect("manageBooks.jsp?error=Invalid+credentials");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
