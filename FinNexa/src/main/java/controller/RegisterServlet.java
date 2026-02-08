package controller;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet  {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		User user = new User();
		user.setUsername(name);
		user.setEmail(email);
		user.setPassword(password);
		
		UserDAO dao = new UserDAO();
		boolean status = dao.insertUser(user);
		
		if(status) {
			resp.sendRedirect("login.jsp");
		}else {
			resp.sendRedirect("register.jsp");
		}
				
	}

}
