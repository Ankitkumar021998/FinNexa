package controller;

import java.io.IOException;

import dao.AccountDAO;
import dao.TransactionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		
		if (session == null || session.getAttribute("user") == null) {
		    resp.sendRedirect("login.jsp");
		    return;
		}

		User user = (User) session.getAttribute("user");

		double amount = Double.parseDouble(req.getParameter("amount"));

		AccountDAO accDao = new AccountDAO();
		TransactionDAO txnDao = new TransactionDAO();

		boolean status = accDao.deposit(user.getUserId(), amount);
		System.out.println("Redirecting to deposit-success.jsp");

		if (status) {
		    txnDao.addTransaction(user.getUserId(), "DEPOSIT", amount);
		    resp.sendRedirect(req.getContextPath() + "/deposit-success.jsp");
		} else {
		    resp.sendRedirect(req.getContextPath() + "/deposit.jsp");
		}

	}
}
