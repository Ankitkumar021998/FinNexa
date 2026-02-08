package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate(); // destroy the session
        }
        resp.sendRedirect("login.jsp"); // redirect to login page
    }
}


// “Why do you still need LogoutServlet?”
// Client-side redirection does not destroy the server session. 
// I used a LogoutServlet to invalidate the session on the server 
// to ensure proper logout and prevent unauthorized access via browser back navigation.