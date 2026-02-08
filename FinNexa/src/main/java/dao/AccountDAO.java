package dao;

import java.sql.*;

import util.DBConnection;

public class AccountDAO {
	public boolean deposit(int userId, double amount) {
	    String sql = "UPDATE accounts SET balance = balance + ? WHERE user_id = ?";
	    try (Connection con = DBConnection.getConnetion();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setDouble(1, amount);
	        ps.setInt(2, userId);
	        return ps.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	public boolean withdraw(int userId, double amount) {
	    String checkSql = "SELECT balance FROM accounts WHERE user_id = ?";
	    String updateSql = "UPDATE accounts SET balance = balance - ? WHERE user_id = ?";
	    try (Connection con = DBConnection.getConnetion();
	         PreparedStatement psCheck = con.prepareStatement(checkSql)) {

	        psCheck.setInt(1, userId);
	        try (ResultSet rs = psCheck.executeQuery()) {
	            if (!rs.next() || rs.getDouble("balance") < amount) {
	                return false;
	            }
	        }

	        try (PreparedStatement psUpdate = con.prepareStatement(updateSql)) {
	            psUpdate.setDouble(1, amount);
	            psUpdate.setInt(2, userId);
	            return psUpdate.executeUpdate() > 0;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	
	


	public boolean transfer(int senderUserId, int receiverAccountId, double amount) {
	    try (Connection con = DBConnection.getConnetion()) {
	        con.setAutoCommit(false);

	        // Check sender balance
	        try (PreparedStatement psSender = con.prepareStatement(
	                "SELECT balance FROM accounts WHERE user_id = ?")) {
	            psSender.setInt(1, senderUserId);
	            try (ResultSet rs = psSender.executeQuery()) {
	                if (!rs.next() || rs.getDouble("balance") < amount) {
	                    con.rollback();
	                    return false;
	                }
	            }
	        }

	        // Check receiver exists
	        try (PreparedStatement psReceiver = con.prepareStatement(
	                "SELECT account_id FROM accounts WHERE account_id = ?")) {
	            psReceiver.setInt(1, receiverAccountId);
	            try (ResultSet rs = psReceiver.executeQuery()) {
	                if (!rs.next()) {
	                    con.rollback();
	                    return false;
	                }
	            }
	        }

	        // Debit sender
	        try (PreparedStatement psDebit = con.prepareStatement(
	                "UPDATE accounts SET balance = balance - ? WHERE user_id = ?")) {
	            psDebit.setDouble(1, amount);
	            psDebit.setInt(2, senderUserId);
	            psDebit.executeUpdate();
	        }

	        // Credit receiver
	        try (PreparedStatement psCredit = con.prepareStatement(
	                "UPDATE accounts SET balance = balance + ? WHERE account_id = ?")) {
	            psCredit.setDouble(1, amount);
	            psCredit.setInt(2, receiverAccountId);
	            psCredit.executeUpdate();
	        }

	        con.commit();
	        return true;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

}
