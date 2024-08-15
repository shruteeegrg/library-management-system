package pkg1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		String isbn = request.getParameter("isbn");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String publicationDate = request.getParameter("publicationDate");
		String category = request.getParameter("category");
		String language = request.getParameter("language");
		int pages = Integer.parseInt(request.getParameter("pages"));
		int copiesAvailable = Integer.parseInt(request.getParameter("copiesAvailable"));
		String shelfLocation = request.getParameter("shelfLocation");
		
		boolean result = new BookManager().update(bookid, isbn, title, author,publisher, publicationDate, category, language, pages, copiesAvailable,shelfLocation);
		
		if(result) {
		response.sendRedirect("manageBooks.jsp?success=Successfully updated book\");");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
