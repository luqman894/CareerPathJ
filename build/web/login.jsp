<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Career Path</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .login-container {
            background: rgba(0, 0, 0, 0.5);
            padding: 40px;
            border-radius: 10px;
            width: 350px;
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 20px;
        }
        .login-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: none;
        }
        .login-container button {
            width: 100%;
            padding: 10px;
            margin: 20px 0;
            border-radius: 5px;
            background: #fff;
            color: #2575fc;
            font-weight: bold;
            cursor: pointer;
            border: none;
        }
        .login-container button:hover {
            background: #ddd;
        }
        .error {
            color: #ff6666;
            font-size: 0.9rem;
            margin-top: 10px;
        }
        .success {
            color: #66ff66;
            font-size: 0.9rem;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login to Career Path</h2>
        
        <!-- Display error message -->
    <% if (request.getAttribute("errorMessage") != null) { %>
        <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
    <% } %>

        <form action="login" method="post">
            <input type="email" name="email" placeholder="Enter your email" required>
            <input type="password" name="password" placeholder="Enter your password" required autocomplete="off">
            <button type="submit">Login</button>
        </form>

        <p>Don't have an account? <a href="register.jsp" style="color: #fff;">Register here</a></p>
    </div>
</body>
</html>
