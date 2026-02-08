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

@WebServlet("/WithdrawServlet")
public class WithdrawServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		User user = (User) session.getAttribute("user");

		double amount = Double.parseDouble(req.getParameter("amount"));

		AccountDAO accDao = new AccountDAO();
		TransactionDAO txnDao = new TransactionDAO();

		boolean status = accDao.withdraw(user.getUserId(), amount);

		if (status) {
		    txnDao.addTransaction(user.getUserId(), "WITHDRAW", amount);
		    resp.sendRedirect("withdraw-success.jsp"); // redirect to success popup
		} else {
		    resp.sendRedirect("withdraw.jsp");
		}

	}
}
