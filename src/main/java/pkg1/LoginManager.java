package pkg1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoginManager {
	
	public List<User> getAllUsersByType(String userType) {
        List<User> users = new ArrayList<>();
        String url = "jdbc:mysql://localhost:3306/lib";
        String user = "root";
        String password = "Mynameisshrutigurung12c!";

        String sql = "SELECT * FROM users WHERE user_type = ?";
        
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lib", "root", "Mynameisshrutigurung12c!");
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userType);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    User user1 = new User(
                        rs.getInt("uid"),
                        rs.getString("full_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("login_name"),
                        rs.getString("login_password"),
                        rs.getString("user_type")
                    );
                    users.add(user1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

	public List<User> getAllUsersExcept(String currentUser) {
        String url = "jdbc:mysql://localhost:3306/lib";
        String user = "root";
        String password = "Mynameisshrutigurung12c!";

        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE login_name != ?";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            System.out.println("Database connection established.");
            ps.setString(1, currentUser);
            System.out.println("Executing query: " + ps.toString());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user1 = new User();
                user1.setUid(rs.getInt("uid"));
                user1.setFullName(rs.getString("full_name"));
                user1.setEmail(rs.getString("email"));
                user1.setPhone(rs.getString("phone"));
                user1.setLoginName(rs.getString("login_name"));
                user1.setLoginPassword(rs.getString("login_password"));
                user1.setUserType(rs.getString("user_type"));
                users.add(user1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println("Fetched users: " + users.size());
        return users;
    }
	
	public boolean login(int uid, String strUser, String strPass, String userType) {
		boolean result=false;
		String DRIVER = "com.mysql.cj.jdbc.Driver";
		String HOST="localhost";
		int PORT =3306;
		String DBNAME="lib";
		String USER="root";
		String PASSWORD="Mynameisshrutigurung12c!";
		String SQL="SELECT * FROM users WHERE uid =? AND login_name=? AND login_password=? AND user_type=?";
		String URL = "jdbc:mysql://"+HOST+":"+PORT+"/"+DBNAME;			
		User user = null;
		
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
			PreparedStatement pstat = conn.prepareStatement(SQL);
			pstat.setInt(1,  uid);
			pstat.setString(2, strUser);
			pstat.setString(3, strPass);
			pstat.setString(4,userType);
			ResultSet rs = pstat.executeQuery();
			while(rs.next()) {
				user = new User(rs.getInt("uid"), rs.getString("full_name"), rs.getString("phone"), rs.getString("email"), rs.getString("login_name"), rs.getString("login_password"), rs.getString("user_type"));
				result = true;
			}
			rs.close();
			conn.close();			
		}
		catch(Exception ex) {
			System.out.println("Error : "+ex.getMessage());
		}
		return result;
	}
	public User search(int uid) {
		String DRIVER = "com.mysql.cj.jdbc.Driver";
		String HOST="localhost";
		int PORT =3306;
		String DBNAME="dbLoginSys";
		String USER="root";
		String PASSWORD="Mynameisshrutigurung12c!";
		String SQL="SELECT * FROM users WHERE uid="+uid+"";
		String URL = "jdbc:mysql://"+HOST+":"+PORT+"/"+DBNAME;			
		User user = null;
		try {
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
			PreparedStatement pstat = conn.prepareStatement(SQL);
			ResultSet rs = pstat.executeQuery();			
			while(rs.next()) {
				user = new User(rs.getInt("uid"), rs.getString("full_name"), rs.getString("phone"), rs.getString("email"), rs.getString("login_name"), rs.getString("login_password"), rs.getString("user_type"));
				//System.out.println(rs.getInt("uid")+", "+rs.getString("full_name")+", "+rs.getString("phone")+", "+rs.getString("email")+", "+rs.getString("login_name")+", "+rs.getString("login_password")+", "+rs.getString("user_type"));
			}
			conn.close();
		}
		catch(Exception ex) {
			System.out.println("Error : "+ex.getMessage());
		}
		return user;
	}
	
	
	public List<User> search(String strSearch, String userType) {
	    String DRIVER = "com.mysql.cj.jdbc.Driver";
	    String HOST = "localhost";
	    int PORT = 3306;
	    String DBNAME = "lib";
	    String USER = "root";
	    String PASSWORD = "Mynameisshrutigurung12c!";
	    String SQL = "SELECT * FROM users WHERE user_type = ? AND uid = ?";
	    String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DBNAME;

	    List<User> users = new ArrayList<>();
	    try {
	        Class.forName(DRIVER);
	        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
	             PreparedStatement pstat = conn.prepareStatement(SQL)) {

	            pstat.setString(1, userType);
	            pstat.setInt(2, Integer.parseInt(strSearch));

	            try (ResultSet rs = pstat.executeQuery()) {
	                while (rs.next()) {
	                    User user = new User(rs.getInt("uid"), rs.getString("full_name"),  rs.getString("email"),rs.getString("phone"),
	                            rs.getString("login_name"), rs.getString("login_password"), rs.getString("user_type"));
	                    users.add(user);
	                   
	                }
	            }
	        }
	    } catch (Exception ex) {
	        System.out.println("Error : " + ex.getMessage());
	    }
	    return users;
	}

	public boolean save(String fullName, String email, String phone, String loginName, String loginPassword, String userType) {
		boolean result=false;
		String DRIVER = "com.mysql.cj.jdbc.Driver";
		String HOST="localhost";
		int PORT =3306;
		String DBNAME="lib";
		String user="root";
		String password="Mynameisshrutigurung12c!";
		String SQL="insert into users values(?, ?, ?, ?, ?, ?, ?);";
		String URL = "jdbc:mysql://"+HOST+":"+PORT+"/"+DBNAME;		
		try{
			Class.forName(DRIVER);
			Connection conn = DriverManager.getConnection(URL, user, password);
			PreparedStatement pstat = conn.prepareStatement(SQL);
			pstat.setInt(1, 0);
			pstat.setString(2, fullName);
			pstat.setString(3, email);
			pstat.setString(4, phone);
			pstat.setString(5, loginName);
			pstat.setString(6, loginPassword);
			pstat.setString(7, userType);
			pstat.executeUpdate(); //Insert, update, delete
			pstat.close();
			conn.close();
			System.out.println("Record insert successfully");
			result=true;
		}
		catch(Exception ex) {
			System.out.println("Error1 : "+ex.getMessage());
			result=false;
		}
		return result;
	}
	
	public boolean update(int uid, String fullName, String email, String phone, String loginName, String loginPassword, String userType) {
		boolean result=false;
		String DRIVER = "com.mysql.cj.jdbc.Driver";
		String HOST="localhost";
		int PORT =3306;
		String DBNAME="lib";
		String user="root";
		String password="Mynameisshrutigurung12c!";
		String SQL="update users set full_name=?, email=?, phone=?, login_name=?, login_password=?, user_type=? WHERE uid=?;";
		String URL = "jdbc:mysql://"+HOST+":"+PORT+"/"+DBNAME;		
		try{
			Class.forName(DRIVER);
			//Connect
			Connection conn = DriverManager.getConnection(URL, user, password);
			PreparedStatement pstat = conn.prepareStatement(SQL);
			pstat.setString(1, fullName);
			pstat.setString(2, email);
			pstat.setString(3, phone);
			pstat.setString(4, loginName);
			pstat.setString(5, loginPassword);
			pstat.setString(6, userType);
			pstat.setInt(7, uid);
			pstat.executeUpdate(); //Insert, update, delete
			pstat.close();
			conn.close();
			System.out.println("Record update successfully");
			result=true;
		}
		catch(Exception ex) {
			System.out.println("Error1 : "+ex.getMessage());
			result=false;
		}
		return result;
	}
	
	public boolean delete(int uid) {
		boolean result=false;
		String DRIVER = "com.mysql.cj.jdbc.Driver";
		String HOST="localhost";
		int PORT =3306;
		String DBNAME="lib";
		String user="root";
		String password="Mynameisshrutigurung12c!";
		String SQL="delete from users WHERE uid=?;";
		String URL = "jdbc:mysql://"+HOST+":"+PORT+"/"+DBNAME;		
		try{
			Class.forName(DRIVER);
			//Connect
			Connection conn = DriverManager.getConnection(URL, user, password);
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
}