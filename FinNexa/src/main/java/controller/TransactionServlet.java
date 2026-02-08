package controller;

import java.io.IOException;
import java.util.List;

import dao.TransactionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Transaction;
import model.User;

@WebServlet("/TransactionServlet")
public class TransactionServlet extends HttpServlet {
	
	// For form submissions (if any)
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp); // just call doGet so POST works the same
    }

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

		User user = (User) session.getAttribute("user");
		
		TransactionDAO txnDao = new TransactionDAO();
        List<Transaction> transactions = txnDao.getTransactions(user.getUserId());

        req.setAttribute("transactions", transactions);
        req.getRequestDispatcher("transaction-history.jsp").forward(req, resp);
	}
}

//“FinNexa is a dynamic banking web application built using Core Java, JSP, Servlets, JDBC, and MySQL.
//I followed MVC architecture, implemented secure session-based login, and handled core banking features like deposit, withdrawal, fund transfer using JDBC transactions.
//All user activities are recorded and displayed through a transaction history module.”
