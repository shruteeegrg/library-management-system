package pkg1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpSession;

public class BookManager {

    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String HOST = "localhost";
    private static final int PORT = 3306;
    private static final String DBNAME = "lib";
    private static final String USER = "root";
    private static final String PASSWORD = "Mynameisshrutigurung12c!";
    private static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DBNAME;

    
    public List<BBook> getBorrowedBooksByUser(int uid) {
        List<BBook> borrowedBooks = new ArrayList<>();
        String sql = "SELECT * FROM BorrowedBook WHERE uid = ?";

        try {
            Class.forName(DRIVER);
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
                
                pstmt.setInt(1, uid);
                ResultSet rs = pstmt.executeQuery();

                while (rs.next()) {
                    BBook bbook = new BBook();
                    bbook.setBook(rs.getInt("BookID"));
                    bbook.setBorrowedDate(rs.getDate("BorrowedDate"));
                    bbook.setReturnDate(rs.getDate("ReturnDate"));
                    bbook.setStatus(rs.getString("Status"));
                    borrowedBooks.add(bbook);
                }
            } catch (SQLException e) {
                System.err.println("SQL Error: " + e.getMessage());
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found: " + e.getMessage());
            e.printStackTrace();
        }
        return borrowedBooks;
    }


    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM Books";

        try {
            Class.forName(DRIVER);
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                System.out.println("Executing query: " + ps.toString());
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    Book book = new Book();
                    book.setBookID(rs.getInt("BookID"));
                    book.setIsbn(rs.getString("ISBN"));
                    book.setTitle(rs.getString("Title"));
                    book.setAuthor(rs.getString("Author"));
                    book.setPublisher(rs.getString("Publisher"));
                    book.setPublicationDate(rs.getDate("PublicationDate"));
                    book.setCategory(rs.getString("Category"));
                    book.setLanguage(rs.getString("Language"));
                    book.setPages(rs.getInt("Pages"));
                    book.setCopiesAvailable(rs.getInt("CopiesAvailable"));
                    book.setShelfLocation(rs.getString("ShelfLocation"));

                    books.add(book);
                    System.out.println("Book fetched: " + book.getTitle());
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("SQL error occurred while fetching books.");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("JDBC Driver not found.");
        }

        System.out.println("Number of books fetched: " + books.size());
        return books;
    }

    
	
    public boolean delete(int uid) {
		boolean result=false;
		String SQL="delete from Books WHERE BookID=?;";
			
		try{
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
			PreparedStatement pstat = conn.prepareStatement(SQL);
			pstat.setInt(1, uid);
			pstat.executeUpdate(); //Insert, update, delete
			pstat.close();
			conn.close();
			System.out.println("Record delete successfully");
			result=true;
		}
		catch(Exception ex) {
			System.out.println("Error1 : "+ex.getMessage());
			result=false;
		}
		return result;
	}
    
    public boolean update(int bookID, String isbn, String title, String author, String publisher, String publicationDate, String category, String language, int pages, int copiesAvailable, String shelfLocation) {
        boolean result = false;
        String SQL = "UPDATE Books SET ISBN=?, Title=?, Author=?, Publisher=?, PublicationDate=?, Category=?, Language=?, Pages=?, CopiesAvailable=?, ShelfLocation=? WHERE BookID=?";
        
        try {
            Class.forName(DRIVER);
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement pstat = conn.prepareStatement(SQL)) {
                pstat.setString(1, isbn);
                pstat.setString(2, title);
                pstat.setString(3, author);
                pstat.setString(4, publisher);
                pstat.setString(5, publicationDate);
                pstat.setString(6, category);
                pstat.setString(7, language);
                pstat.setInt(8, pages);
                pstat.setInt(9, copiesAvailable);
                pstat.setString(10, shelfLocation);
                pstat.setInt(11, bookID);
                
                int rowsAffected = pstat.executeUpdate();
                result = rowsAffected > 0;
                
                System.out.println("Record updated successfully");
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
            result = false;
        }
        return result;
    }
    
    public List<Book> searchbooks(String strSearch) {
        String SQL = "SELECT * FROM Books WHERE Title=?";
        List<Book> books = new ArrayList<>();
        try {
            Class.forName(DRIVER);
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement pstat = conn.prepareStatement(SQL)) {
                pstat.setString(1, strSearch);
                

                try (ResultSet rs = pstat.executeQuery()) {
                    while (rs.next()) {
                        Book book = new Book(
                            rs.getInt("BookID"),
                            rs.getString("ISBN"),
                            rs.getString("Title"),
                            rs.getString("Author"),
                            rs.getString("Publisher"),
                            rs.getDate("PublicationDate"),
                            rs.getString("Category"),
                            rs.getString("Language"),
                            rs.getInt("Pages"),
                            rs.getInt("CopiesAvailable"),
                            rs.getString("ShelfLocation")
                        );
                        books.add(book);
                    }
                }
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return books;
    }
    
    public List<Book> search(String strSearch) {
        String SQL = "SELECT * FROM Books WHERE ISBN = ? ";
        List<Book> books = new ArrayList<>();
        try {
            Class.forName(DRIVER);
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement pstat = conn.prepareStatement(SQL)) {
                pstat.setString(1, strSearch);
                

                try (ResultSet rs = pstat.executeQuery()) {
                    while (rs.next()) {
                        Book book = new Book(
                            rs.getInt("BookID"),
                            rs.getString("ISBN"),
                            rs.getString("Title"),
                            rs.getString("Author"),
                            rs.getString("Publisher"),
                            rs.getDate("PublicationDate"),
                            rs.getString("Category"),
                            rs.getString("Language"),
                            rs.getInt("Pages"),
                            rs.getInt("CopiesAvailable"),
                            rs.getString("ShelfLocation")
                        );
                        books.add(book);
                    }
                }
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return books;
    }

    public boolean save(String isbn, String title, String author, String publisher, String publicationDate, String category, String language, int pages, int copiesAvailable, String shelfLocation) {
        boolean result = false;
        String SQL = "INSERT INTO Books (ISBN, Title, Author, Publisher, PublicationDate, Category, Language, Pages, CopiesAvailable, ShelfLocation) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Class.forName(DRIVER);
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement pstat = conn.prepareStatement(SQL)) {
                pstat.setString(1, isbn);
                pstat.setString(2, title);
                pstat.setString(3, author);
                pstat.setString(4, publisher);
                pstat.setString(5, publicationDate);
                pstat.setString(6, category);
                pstat.setString(7, language);
                pstat.setInt(8, pages);
                pstat.setInt(9, copiesAvailable);
                pstat.setString(10, shelfLocation);
                pstat.executeUpdate();
                result = true;
                System.out.println("Record inserted successfully");
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return result;
    }
}
