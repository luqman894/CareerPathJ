<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register - Career Path</title>
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
        .register-container {
            background: rgba(0, 0, 0, 0.5);
            padding: 40px;
            border-radius: 10px;
            width: 350px;
            text-align: center;
        }
        .register-container h2 {
            margin-bottom: 20px;
        }
        .register-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: none;
        }
        .register-container button {
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
        .register-container button:hover {
            background: #ddd;
        }
        .error {
            color: #ff6666;
            font-size: 0.9rem;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Register for Career Path</h2>
        <form action="register" method="post">
            <input type="text" name="first_name" placeholder="Enter your First Name" required>
            <input type="text" name="last_name" placeholder="Enter your Last Name" required>
            <input type="password" name="password" placeholder="Enter your password" required>
            <input type="email" name="email" placeholder="Enter your email" required>
            <button type="submit">Register</button>
        </form>
        
        <% if (request.getAttribute("errorMessage") != null) { %>
            <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
        <% } %>

        <p>Already have an account? <a href="login.jsp" style="color: #fff;">Login here</a></p>
    </div>
</body>
</html>