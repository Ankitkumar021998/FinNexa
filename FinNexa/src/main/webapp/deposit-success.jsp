<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FinNexa | Deposit Success</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f3f7fb;
            font-family: Arial, sans-serif;
            overflow: hidden; 
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 58, 143, 0.15); 
            display: flex;
            align-items: center;
            justify-content: center;
            backdrop-filter: blur(2px);
        }

        .popup {
            background: white;
            padding: 40px 30px;
            width: 340px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 15px 50px rgba(0, 58, 143, 0.2);
            border-top: 6px solid #003a8f; 
            animation: scaleIn 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        @keyframes scaleIn {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        .success-icon {
            font-size: 55px;
            color: #003a8f;
            margin-bottom: 10px;
            font-weight: bold;
        }

        h2 {
            color: #003a8f;
            margin: 0 0 10px 0;
            font-size: 24px;
            font-weight: 800;
        }

        p {
            color: #003a8f; 
            font-size: 15px;
            margin-bottom: 25px;
            line-height: 1.5;
            font-weight: 500;
        }

        button {
            background: #003a8f;
            color: white;
            border: none;
            width: 100%;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 800;
            transition: background 0.3s, transform 0.2s;
        }

        button:hover {
            background: #002b6f;
            transform: translateY(-2px);
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
    <div class="overlay">
        <div class="popup">
            <div class="success-icon">✓</div>
            <h2>Success!</h2>
            <p>Your transaction was successful.<br>The amount has been updated.</p>
            
            <button onclick="goDashboard()">OK</button>

            <div class="footer-text">© 2026 FinNexa. All Rights Reserved.</div>
        </div>
    </div>

    <script>
        function goDashboard() {
            // Session clear ke liye request bhejna (optional, simple method JSP me)
            <% 
                session.removeAttribute("txAmount"); 
                session.removeAttribute("receiverAcc"); 
            %>
            window.location.href = "dashboard.jsp";
        }
    </script>
</body>
</html>
