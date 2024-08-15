package pkg1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class SearchBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strSearch = request.getParameter("txtSearch");
        BookManager bm = new BookManager();
        List<Book> books = bm.search(strSearch);
        
        request.setAttribute("books1", books);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("manageBooks.jsp?success=Succesfully searched book");
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
