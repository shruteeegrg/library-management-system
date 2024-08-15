package pkg1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BBookManager {
	
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String HOST = "localhost";
    private static final int PORT = 3306;
    private static final String DBNAME = "lib";
    private static final String USER = "root";
    private static final String PASSWORD = "Mynameisshrutigurung12c!";
    private static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DBNAME;
    
    
    public List<BBook> search(String strSearch) {
        String SQL = "SELECT * FROM BorrowedBook WHERE BookID = ?";
        List<BBook> bbooks = new ArrayList<>();
        try {
            Class.forName(DRIVER);
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement pstat = conn.prepareStatement(SQL)) {
                pstat.setString(1, strSearch);
                
                try (ResultSet rs = pstat.executeQuery()) {
                    while (rs.next()) {
                        BBook bbook = new BBook(
                            rs.getInt("BorrowedBookID"),
                            rs.getInt("BookID"),
                            rs.getInt("uid"),
                            rs.getDate("BorrowedDate"),
                            rs.getDate("ReturnDate"),
                            rs.getString("Status")
                        );
                        bbooks.add(bbook);
                    }
                }
            }
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }
        return bbooks;
    }

    
    public boolean save(int bookid, int uid, String borrowedDate, String returnDate, String status) {
        boolean result = false;
        String SQL = "INSERT INTO BorrowedBook (BookID, uid, BorrowedDate, ReturnDate, Status) VALUES (?, ?, ?, ?, ?)";
        try {
            Class.forName(DRIVER);
            try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement pstat = conn.prepareStatement(SQL)) {
                pstat.setInt(1, bookid);
                pstat.setInt(2, uid);
                pstat.setString(3, borrowedDate);
                pstat.setString(4, returnDate);
                pstat.setString(5, status);
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
