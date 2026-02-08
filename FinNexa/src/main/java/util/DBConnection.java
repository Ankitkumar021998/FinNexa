package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static final String URL = "jdbc:mysql://localhost:3306/finnexa_db";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "tiger";

	@Deprecated
	public static Connection getConnetion() {
		return getConnection();
	}

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("DB Connection sucess: " + con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void main(String[] args) {
	    Connection con = DBConnection.getConnection();
	    if (con != null) {
	        System.out.println("Connection successful!");
	    } else {
	        System.out.println("Connection FAILED!");
	    }
	}

}
