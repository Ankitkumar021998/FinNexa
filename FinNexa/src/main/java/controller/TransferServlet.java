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

@WebServlet("/TransferServlet")
public class TransferServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		User user = (User) session.getAttribute("user");

		int receiverAcc = Integer.parseInt(req.getParameter("receiveAcc"));
		double amount = Double.parseDouble(req.getParameter("amount"));

		AccountDAO accDao = new AccountDAO();
		TransactionDAO txnDao = new TransactionDAO();

		boolean status = accDao.transfer(user.getUserId(), receiverAcc, amount);

		if (status) {
		    txnDao.addTransaction(user.getUserId(), "TRANSFER_DEBIT", amount);
		    txnDao.addTransactionByAccount(receiverAcc, "TRANSFER_CREDIT", amount);

		    session.setAttribute("txAmount", amount);
		    session.setAttribute("receiverAcc", receiverAcc);

		    resp.sendRedirect("transfer-success.jsp");
		} else {
		    resp.sendRedirect("transfer.jsp");
		}

	}
}
