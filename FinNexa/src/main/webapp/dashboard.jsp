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
<title>FinNexa | Dashboard</title>
<style>
body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
	background-color: #f3f7fb;
}

/* Navbar */
.navbar {
	position: fixed;
	top: 0;
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #003a8f;
	padding: 12px 40px;
	color: #fff;
	z-index: 1000;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
	box-sizing: border-box;
}

.navbar .brand {
	font-size: 24px;
	font-weight: bold;
	cursor: pointer;
}

.navbar ul {
	list-style: none;
	display: flex;
	margin: 0;
	padding: 0;
	align-items: center;
}

.navbar ul li {
	margin-left: 25px;
	position: relative;
}

.navbar ul li a {
	color: #fff;
	text-decoration: none;
	font-weight: bold;
	padding: 8px 12px;
	transition: background 0.3s, color 0.3s;
	border-radius: 5px;
	cursor: pointer;
	display: block;
}

.navbar ul li a:hover {
	color: #ffcc00;
	background: rgba(255, 255, 255, 0.1);
}

/* Dropdown for logout click toggle */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #fff;
	min-width: 140px;
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
	border-radius: 5px;
	top: 100%;
	right: 0;
	z-index: 1001;
}

.dropdown-content a {
	color: #003a8f !important;
	padding: 12px 15px;
	text-decoration: none;
	display: block;
	font-weight: bold;
	cursor: pointer;
}

.dropdown-content a:hover {
	background-color: #e8f0ff;
}

/* Sections */
section {
	padding: 150px 20px 80px 20px;
	max-width: 1000px;
	margin: 0 auto;
}

#hero {
	background: #e8f0ff;
	border-radius: 10px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
	text-align: center;
	padding: 60px 30px;
	margin-top: 80px;
}

#hero h2 {
	color: #003a8f;
	font-size: 28px;
	margin-bottom: 20px;
}

#hero p {
	color: #333;
	font-size: 16px;
	line-height: 1.7;
	margin-bottom: 20px;
}

#about, #vision {
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
	margin-top: 60px;
	padding: 50px 40px;
}

#about h3, #vision h3 {
	color: #003a8f;
	margin-bottom: 25px;
	text-align: center;
	font-size: 24px;
}

#about p, #vision p {
	font-size: 16px;
	line-height: 1.8;
	color: #333;
	margin-bottom: 20px;
}

/* Dashboard cards */
.dashboard-cards {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	margin-top: 30px;
	justify-content: center;
}

.card {
	flex: 1 1 220px;
	background: #fff;
	border-radius: 10px;
	padding: 25px;
	text-align: center;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
	transition: transform 0.2s, box-shadow 0.2s, background 0.2s;
	cursor: pointer;
	text-decoration: none;
	color: #003a8f;
	font-weight: bold;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 12px 25px rgba(0, 0, 0, 0.25);
	background-color: #dce8ff;
}

/* --- COMPACT FOOTER STYLING --- */
footer {
	background-color: #111;
	color: #fff;
	padding: 30px 40px; /* Reduced vertical padding */
	margin-top: 60px;
	font-family: Arial, sans-serif;
}

.footer-container {
	max-width: 1100px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between; /* Side-by-side layout */
	align-items: center;
	flex-wrap: wrap;
	gap: 20px;
}

.footer-info {
	text-align: left;
	flex: 1;
	min-width: 250px;
}

.footer-info h4 {
	color: #ffcc00;
	margin: 0 0 8px 0;
	font-size: 16px;
}

.footer-info p {
	margin: 2px 0;
	font-size: 14px;
	color: #ccc;
}

.social-section {
	text-align: center;
	flex: 1;
	min-width: 200px;
}

.social-section h4 {
	color: #ffcc00;
	margin: 0 0 10px 0;
	font-size: 16px;
}

.social-icons-wrapper {
	display: flex;
	justify-content: center;
	gap: 20px;
}

.social-icon svg {
	transition: transform 0.3s ease, fill 0.3s ease;
	fill: #fff;
}

.social-icon:hover svg {
	transform: scale(1.2);
	fill: #ffcc00;
}

.footer-right {
	text-align: right;
	flex: 1;
	min-width: 200px;
}

.footer-bottom {
	width: 100%;
	border-top: 1px solid #333;
	padding-top: 15px;
	margin-top: 15px;
	text-align: center;
	font-size: 12px;
	color: #666;
}

/* Mobile adjustment */
@media ( max-width : 768px) {
	.footer-container {
		flex-direction: column;
		text-align: center;
	}
	.footer-info, .footer-right {
		text-align: center;
	}
}
</style>
</head>
<body>
	<div class="navbar">
		<div class="brand" onclick="scrollToSection('hero')">FinNexa</div>
		<ul>
			<li><a onclick="scrollToSection('hero')">Home</a></li>
			<li><a onclick="scrollToSection('about')">About</a></li>
			<li><a onclick="scrollToSection('vision')">Vision</a></li>
			<li class="dropdown"><a id="logoutBtn" href="login.jsp">Logout ▼</a>
				<div id="logoutDropdown" class="dropdown-content">
					<a onclick="logout()">Logout</a> <a onclick="cancelLogout()">Cancel</a>
				</div></li>
		</ul>
	</div>

	<section id="hero">
		<h2>
			Welcome,
			<%=user.getUsername()%></h2>

		<p>Your secure digital banking platform connects you to all
			financial services seamlessly. Enjoy instant access to deposits,
			withdrawals, fund transfers, and transaction history. Your data is
			safe with our advanced encryption and security features. Experience
			banking designed for your convenience, 24/7, anywhere you are.</p>
		<div class="dashboard-cards">
			<a href="deposit.jsp" class="card">Deposit Money</a> <a
				href="withdraw.jsp" class="card">Withdraw Money</a> <a
				href="transfer.jsp" class="card">Fund Transfer</a> <a
				href="TransactionServlet" class="card">Transaction History</a>
			 <a	href="Balance.jsp" class="card">balance</a>
		</div>
	</section>

	<section id="about">
		<h3>About FinNexa</h3>
		<p>FinNexa is a modern digital banking platform built to offer a
			seamless and secure financial experience. Our mission is to provide
			users with easy access to their finances anytime, anywhere, through
			an intuitive and reliable interface.</p>
		<p>We prioritize customer security, privacy, and transparency.
			Advanced encryption protocols and multi-factor authentication ensure
			that your personal and financial data remains protected at all times.
		</p>
		<p>Our dedicated team of banking and technology experts
			continuously works on developing innovative features and improving
			our services. From fast fund transfers to detailed transaction
			tracking, FinNexa is designed to simplify your financial life.</p>
		<p>We believe in empowering our customers with the tools they need
			to manage their finances efficiently. Whether you are saving,
			investing, or making payments, FinNexa makes digital banking smooth,
			secure, and accessible to everyone.</p>
	</section>

	<section id="vision">
		<h3>Our Vision</h3>
		<p>At FinNexa, our vision is to revolutionize digital banking by
			creating smart, secure, and user-friendly solutions that empower
			individuals and businesses to manage their finances effortlessly. We
			believe that banking should be intuitive, transparent, and accessible
			to everyone.</p>
		<p>We continuously innovate by integrating cutting-edge technology
			with a customer-centric approach. From AI-driven insights to seamless
			mobile banking, our goal is to provide advanced solutions that
			simplify everyday financial tasks while maintaining the highest
			security standards.</p>
		<p>FinNexa is committed to bridging technology with trust. We aim
			to build long-lasting relationships with our customers by ensuring
			reliability, transparency, and convenience in every transaction. Our
			vision is a future where digital banking is not only efficient but
			also empowering for all users.</p>
	</section>


	<footer>
		<div class="footer-container">

			<div class="footer-info">
				<h4>Contact Us</h4>
				<p>123 Digital Street, Bengaluru, India</p>
				<p>support@finnexa.com | +91 9876543210</p>
			</div>

			<div class="social-section">
				<h4>Follow Us</h4>
				<div class="social-icons-wrapper">
					<a href="#" class="social-icon"> <svg viewBox="0 0 24 24"
							width="24" height="24">
							<path
								d="M22 12a10 10 0 10-11 9.95V14.7h-2v-3h2v-2c0-2 1-3 3-3h2v3h-1c-.5 0-1 .5-1 1v1h2l-1 3h-1v7.25A10 10 0 0022 12z" /></svg>
					</a> <a href="#" class="social-icon"> <svg viewBox="0 0 24 24"
							width="24" height="24">
							<path
								d="M12 2.2c3.2 0 3.6 0 4.85.07 1.2.06 2 .27 2.46.45a4.92 4.92 0 011.8 1.04 4.92 4.92 0 011.04 1.8c.18.46.39 1.26.45 2.46.07 1.25.07 1.65.07 4.85s0 3.6-.07 4.85c-.06 1.2-.27 2-.45 2.46a4.92 4.92 0 01-1.04 1.8 4.92 4.92 0 01-1.8 1.04c-.46.18-1.26.39-2.46.45-1.25.07-1.65.07-4.85.07s-3.6 0-4.85-.07c-1.2-.06-2-.27-2.46-.45a4.92 4.92 0 01-1.8-1.04 4.92 4.92 0 01-1.04-1.8c-.18-.46-.39-1.26-.45-2.46C2.2 15.6 2.2 15.2 2.2 12s0-3.6.07-4.85c.06-1.2.27-2 .45-2.46a4.92 4.92 0 011.04-1.8 4.92 4.92 0 011.8-1.04c.46-.18 1.26-.39 2.46-.45C8.4 2.2 8.8 2.2 12 2.2zm0 2c-3.1 0-3.5 0-4.7.07-1.06.05-1.63.24-2.02.4a2.92 2.92 0 00-1.05.68 2.92 2.92 0 00-.68 1.05c-.16.39-.35.96-.4 2.02C3.2 8.5 3.2 8.9 3.2 12s0 3.5.07 4.7c.05 1.06.24 1.63.4 2.02.17.4.4.75.68 1.05.28.3.65.51 1.05.68.39.16.96.35 2.02.4 1.2.07 1.6.07 4.7.07s3.5 0 4.7-.07c1.06-.05 1.63-.24 2.02-.4.4-.17.75-.4 1.05-.68.3-.28.51-.65.68-1.05.16-.39.35-.96.4-2.02.07-1.2.07-1.6.07-4.7s0-3.5-.07-4.7c-.05-1.06-.24-1.63-.4-2.02a2.92 2.92 0 00-.68-1.05 2.92 2.92 0 00-1.05-.68c-.39-.16-.96-.35-2.02-.4-1.2-.07-1.6-.07-4.7-.07zm0 3.5a6.5 6.5 0 110 13 6.5 6.5 0 010-13zm0 2a4.5 4.5 0 100 9 4.5 4.5 0 000-9zm5.5-.5a1 1 0 110 2 1 1 0 010-2z" /></svg>
					</a> <a href="#" class="social-icon"> <svg viewBox="0 0 24 24"
							width="24" height="24">
							<path
								d="M22.46 6c-.77.35-1.6.58-2.46.69a4.28 4.28 0 001.88-2.37 8.59 8.59 0 01-2.72 1.04 4.27 4.27 0 00-7.27 3.9A12.13 12.13 0 013 4.75a4.27 4.27 0 001.32 5.7 4.23 4.23 0 01-1.93-.53v.05a4.28 4.28 0 003.43 4.18 4.28 4.28 0 01-1.92.07 4.28 4.28 0 003.99 2.97 8.57 8.57 0 01-5.3 1.83A8.59 8.59 0 012 19.54a12.1 12.1 0 006.56 1.92c7.88 0 12.2-6.53 12.2-12.2l-.01-.56A8.72 8.72 0 0022.46 6z" /></svg>
					</a>
				</div>
			</div>

			<div class="footer-right">
				<p>FinNexa Digital Banking</p>
				<p>Secure. Fast. Reliable.</p>
			</div>

			<div class="footer-bottom">&copy; 2026 FinNexa. All Rights
				Reserved.</div>

		</div>
	</footer>

	<script>
		/**
		 * SLOW SMOOTH SCROLL LOGIC
		 */
		function scrollToSection(id) {
			const targetElement = document.getElementById(id);
			const navbarHeight = document.querySelector(".navbar").offsetHeight;
			const targetPosition = targetElement.getBoundingClientRect().top
					+ window.pageYOffset - navbarHeight - 20;
			const startPosition = window.pageYOffset;
			const distance = targetPosition - startPosition;
			const duration = 1200;
			let start = null;

			function step(timestamp) {
				if (!start)
					start = timestamp;
				const progress = timestamp - start;
				const time = Math.min(progress / duration, 1);

				const ease = time < 0.5 ? 4 * time * time * time : 1 - Math
						.pow(-2 * time + 2, 3) / 2;

				window.scrollTo(0, startPosition + distance * ease);

				if (progress < duration) {
					window.requestAnimationFrame(step);
				}
			}
			window.requestAnimationFrame(step);
		}

		/**
		 * DROPDOWN LOGIC
		 */
		function toggleDropdown(event) {
			event.stopPropagation();
			const dropdown = document.getElementById("logoutDropdown");
			dropdown.style.display = (dropdown.style.display === "block") ? "none"
					: "block";
		}

		function logout() {
			alert("You have been logged out successfully!");
			window.location.replace("login.jsp");
		}

		function cancelLogout() {
			document.getElementById("logoutDropdown").style.display = "none";
		}

		window.addEventListener("click", function(e) {
			const dropdown = document.getElementById("logoutDropdown");
			if (dropdown && dropdown.style.display === "block") {
				dropdown.style.display = "none";
			}
		});
	</script>
</body>
</html>