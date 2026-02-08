package dao;

import java.sql.*;

import model.User;
import util.DBConnection;

public class UserDAO {

	public boolean insertUser(User user) {
		Connection con = null;
		PreparedStatement psUser = null;
		PreparedStatement psAccount = null;

		try {
			con = DBConnection.getConnetion();
			con.setAutoCommit(false);

//		insert into users table
			String userSql = "INSERT INTO USERS(USERNAME, EMAIL, PASSWORD) VALUES(?,?,?)";
			psUser = con.prepareStatement(userSql, Statement.RETURN_GENERATED_KEYS);
			psUser.setString(1, user.getUsername());
			psUser.setString(2, user.getEmail());
			psUser.setString(3, user.getPassword());
			psUser.executeUpdate();

			ResultSet rs = psUser.getGeneratedKeys();
			rs.next();
			int userId = rs.getInt(1);

//		String into accounts table
			String accSql = "INSERT INTO ACCOUNTS(USER_ID, BALANCE) VALUES(?,?)";
			psAccount = con.prepareStatement(accSql);
			psAccount.setInt(1, userId);
			psAccount.setDouble(2, 0);
			psAccount.executeUpdate();

			con.commit();
			return true;

		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			return false;
		}

	}

	public User validateUser(String email, String password) {
		User user = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = DBConnection.getConnetion();

			String sql = "SELECT * FROM USERS WHERE EMAIL=? AND PASSWORD=?";

			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			rs = ps.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setUserId(rs.getInt("user_id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
}
