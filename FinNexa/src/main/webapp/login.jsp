<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>FinNexa | Login</title>

  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, Helvetica, sans-serif;
      background-color: #f3f7fb; /* SBI-like background */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .container {
      background: #ffffff;
      width: 360px;
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

    label {
      font-weight: bold;
      color: #333;
      font-size: 14px;
    }

    input[type="email"], input[type="password"] {
      width: 100%;
      padding: 11px;
      margin-top: 6px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 14px;
      transition: border-color 0.3s, box-shadow 0.3s;
    }

    input::placeholder {
      color: #aaa;
    }

    input:focus {
      outline: none;
      border-color: #003a8f;
      box-shadow: 0 0 6px rgba(0, 58, 143, 0.3);
    }

    .login-btn {
      background: #003a8f;
      color: #fff;
      border: none;
      padding: 12px;
      font-size: 16px;
      border-radius: 5px;
      cursor: pointer;
      width: 100%;
      margin-top: 18px;
      transition: background 0.3s, transform 0.2s;
    }

    .login-btn:hover {
      background: #002b6f;
      transform: translateY(-2px);
    }

    .register-link {
      text-align: center;
      margin-top: 18px;
      font-size: 14px;
    }

    .register-link a {
      color: #003a8f;
      text-decoration: none;
      font-weight: bold;
    }

    .register-link a:hover {
      text-decoration: underline;
    }

    .footer-text {
      text-align: center;
      font-size: 12px;
      color: #666;
      margin-top: 20px;
    }
  </style>
</head>

<body>
  <div class="container">
    <h1>FinNexa</h1>
    <div class="subtitle">Secure Digital Banking Platform</div>

    <form action="login" method="post">
      <label for="email">Email</label>
      <input
        type="email"
        id="email"
        name="email"
        placeholder="Enter your email address"
        required
      /><br /><br />

      <label for="password">Password</label>
      <input
        type="password"
        id="password"
        name="password"
        placeholder="Enter your password"
        required
      /><br />

      <input type="submit" value="Login" class="login-btn" />
    </form>

    <div class="register-link">
      Don't have an account? <a href="register.jsp">Register</a>
    </div>

    <div class="footer-text">© 2026 FinNexa. All Rights Reserved.</div>
  </div>
</body>
</html>
