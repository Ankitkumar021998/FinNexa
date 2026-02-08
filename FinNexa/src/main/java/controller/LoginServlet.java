package controller;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserDAO dao = new UserDAO();
		User user = dao.validateUser(email, password);

		if (user != null) {
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			resp.sendRedirect("dashboard.jsp");
		} else {
			resp.sendRedirect("login.jsp");
		}
	}
}
