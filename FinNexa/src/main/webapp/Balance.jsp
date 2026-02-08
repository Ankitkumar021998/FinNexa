<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.User"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FinNexa | Account Balance</title>

<style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica, sans-serif;
    background-color: #f3f7fb;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background: #fff;
    width: 360px;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.12);
    border-top: 6px solid #003a8f;
    text-align: center;
}

h1 {
    color: #003a8f;
    margin-bottom: 8px;
}

.subtitle {
    font-size: 13px;
    color: #666;
    margin-bottom: 25px;
}

.balance-box {
    background: #eaf1ff;
    padding: 20px;
    border-radius: 8px;
    margin-top: 20px;
}

.balance-label {
    font-size: 14px;
    color: #333;
}

.balance-amount {
    font-size: 28px;
    font-weight: bold;
    color: #003a8f;
    margin-top: 8px;
}

.back-link {
    margin-top: 25px;
}

.back-link a {
    color: #003a8f;
    text-decoration: none;
    font-weight: 600;
}

.back-link a:hover {
    text-decoration: underline;
}

.footer-text {
    font-size: 12px;
    color: #666;
    margin-top: 25px;
}
</style>
</head>

<body>

<div class="container">
  
  <%Connection con = DBConnection.getConnection();
   PreparedStatement ps = con.prepareStatement("select balance from finnexa_db.accounts where user_id=?");
   User user1 = (User) session.getAttribute("user");
   ps.setInt(1,user1.getUserId());
 ResultSet rs=  ps.executeQuery();
 double db = 0;
 if(rs.next()) {
	    db = rs.getDouble("balance");
	}
     
  %>>
  
    <h1>FinNexa</h1>
    <div class="subtitle">Secure Digital Banking Platform</div>

    <div class="balance-box">
        <div class="balance-label">Available Balance</div>
        <div class="balance-amount">
            ₹ <%=db %>
        </div>
    </div>

    <div class="back-link">
        <a href="dashboard.jsp">← Back to Dashboard</a>
    </div>

    <div class="footer-text">© 2026 FinNexa. All Rights Reserved.</div>

</div>

</body>
</html>
