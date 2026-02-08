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
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>FinNexa | Withdraw Money</title>

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
	background: #ffffff;
	width: 360px;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
	border-top: 6px solid #003a8f;
	animation: fadeIn 0.6s ease-in-out;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
h1 {
	text-align: center;
	color: #003a8f;
	margin-bottom: 8px;
}

.subtitle {
	text-align: center;
	font-size: 13px;
	color: #666;
	margin-bottom: 25px;
}

label {
	font-weight: bold;
	color: #333;
	font-size: 14px;
}

input {
	width: 100%;
	padding: 11px;
	margin-top: 6px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	transition: border-color 0.3s, box-shadow 0.3s;
	box-sizing: border-box;
}

input:focus {
	outline: none;
	border-color: #003a8f;
	box-shadow: 0 0 6px rgba(0, 58, 143, 0.3);
}

/* Withdraw Button Styles */
input[type="submit"] {
	background: #003a8f;
	color: #fff;
	border: none;
	padding: 12px;
	font-size: 16px;
	font-weight: 800; /* Matching the Deposit button thickness */
	border-radius: 5px;
	cursor: pointer;
	margin-top: 18px;
	transition: background 0.3s, transform 0.2s;
	width: 100%;
}

input[type="submit"]:hover {
	background: #002b6f;
	transform: translateY(-2px);
}

/* Back Link Section */
.back-link {
	text-align: center;
	margin-top: 25px;
}

.back-link a {
	color: #003a8f;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	font-size: 15px;
	transition: color 0.2s;
}

/* Arrow - Extra Thick per your request */
.back-link a span.arrow {
	font-size: 18px;
	margin-right: 8px;
	font-weight: 900;
	line-height: 1;
}

/* Text - Medium Bold (between button and arrow) */
.back-link a span.text {
	font-weight: 600;
	border-bottom: 2px solid transparent;
	padding-bottom: 1px;
	transition: border-bottom 0.2s;
}

/* Hover: Line only on text, NOT arrow */
.back-link a:hover span.text {
	border-bottom: 2px solid #003a8f;
}

.footer-text {
	text-align: center;
	font-size: 12px;
	color: #666;
	margin-top: 25px;
}
</style>
</head>

<body>
	<div class="container">
		<h1>FinNexa</h1>
		<div class="subtitle">Secure Digital Banking Platform</div>

		<form action="WithdrawServlet" method="post">
			<label for="amount">Withdraw Amount (₹)</label> <input type="number"
				id="amount" name="amount" placeholder="0.00" min="1" step="0.01"
				required autofocus /><br />
			<br /> <input type="submit" value="Withdraw" />
		</form>

		<div class="back-link">
			<a href="dashboard.jsp"> <span class="arrow">&larr;</span> <span
				class="text">Back to Dashboard</span>
			</a>
		</div>

		<div class="footer-text">© 2026 FinNexa. All Rights Reserved.</div>
	</div>
</body>
</html>