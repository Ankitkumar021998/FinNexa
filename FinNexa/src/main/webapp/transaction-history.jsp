<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@
    		page import = "java.util.*, model.Transaction, model.User"
     %>
     
     <%
     User user = (User) session.getAttribute("user");
     if(user == null){
     response.sendRedirect("login.jsp");
     return;
     }
     %>
     
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FinNexa | Transaction History</title>

    <style>
      body {
        margin: 0;
        padding: 0;
        font-family: Arial, Helvetica, sans-serif;
        background-color: #f3f7fb;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 20px;
      }

      .container {
        background: #ffffff;
        width: 100%;
        max-width: 600px;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
        border-top: 6px solid #003a8f;
        animation: fadeIn 0.6s ease-in-out;
      }

      @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
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

      /* Table Styling */
      .transaction-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
        font-size: 14px;
      }

      .transaction-table th {
        background-color: #003a8f;
        color: #ffffff;
        text-align: left;
        padding: 12px;
        font-weight: bold;
      }

      .transaction-table td {
        padding: 12px;
        border-bottom: 1px solid #eeeeee;
        color: #333;
      }

      .transaction-table tr:nth-child(even) {
        background-color: #f9fbff;
      }

      .transaction-table tr:hover {
        background-color: #f1f4f9;
      }

      .no-data {
        text-align: center;
        color: #999;
        font-style: italic;
      }

      /* Back Link Section */
      .back-link {
        text-align: center;
        margin-top: 30px;
      }

      .back-link a {
        color: #003a8f;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        font-size: 15px;
        transition: color 0.2s;
      }

      .back-link a span.arrow {
        font-size: 18px; 
        margin-right: 8px;
        font-weight: 900; 
        line-height: 1;
      }

      .back-link a span.text {
        font-weight: 600; 
        border-bottom: 2px solid transparent; 
        padding-bottom: 1px;
        transition: border-bottom 0.2s;
      }

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

      <table class="transaction-table">
        <thead>
          <tr>
            <th>Type</th>
            <th>Amount</th>
            <th>Date</th>
          </tr>
        </thead>
        <tbody>
          <%
          List<Transaction> list = (List<Transaction>) request.getAttribute("transactions");
          if (list != null && !list.isEmpty()) {
              for (Transaction t : list) {
          %>
          <tr>
            <td style="font-weight: bold; color: #003a8f;"><%= t.getType() %></td>
            <td>₹ <%= t.getAmount() %></td>
            <td style="color: #666;"><%= t.getTxnDate() %></td>
          </tr>
          <%
              }
          } else {
          %>
          <tr>
            <td colspan="3" class="no-data">No transactions found</td>
          </tr>
          <%
          }
          %>
        </tbody>
      </table>

      <div class="back-link">
        <a href="dashboard.jsp">
            <span class="arrow">&larr;</span> 
            <span class="text">Back to Dashboard</span>
        </a>
      </div>

      <div class="footer-text">© 2026 FinNexa. All Rights Reserved.</div>
    </div>
  </body>
</html>


