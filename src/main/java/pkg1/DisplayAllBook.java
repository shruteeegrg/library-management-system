package pkg1;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DisplayAllBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("DisplayAllBook servlet is invoked.");
	    List<Book> books = new BookManager().getAllBooks();
	    System.out.println("Number of books fetched: " + books.size());
	    if (!books.isEmpty()) {
	        System.out.println("First book title: " + books.get(0).getTitle());
	    }

	    request.setAttribute("books", books);
	    request.getRequestDispatcher("manageBooks.jsp?success=Successfully displayed book").forward(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}