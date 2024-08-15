package pkg1;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class SearchBBookA extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String strSearch = request.getParameter("search");
        BBookManager bm = new BBookManager();
        List<BBook> bbooks = bm.search(strSearch);
        
        request.setAttribute("bbooks", bbooks);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("viewRecordsA.jsp?success=Successfully searched book");
        requestDispatcher.forward(request, response);
       
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
