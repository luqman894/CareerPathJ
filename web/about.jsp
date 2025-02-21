<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="my.career.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="my.career.model.Application" %>
<%@ page import="my.career.model.Program" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - Career Path</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            text-align: center;
            padding: 50px;
        }
        header {
            background: rgba(0, 0, 0, 0.5);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        header img {
            width: 100px;
            border-radius: 50%;
            margin-bottom: 20px;
        }
        h1 {
            font-size: 2.5rem;
            margin: 20px 0;
        }
        p {
            font-size: 1.2rem;
            line-height: 1.8;
            margin: 20px 0;
        }
        .section {
            margin-top: 30px;
            padding: 20px;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            text-align: left;
            width: 70%;
            margin-left: auto;
            margin-right: auto;
        }
        .section h2 {
            text-align: center;
        }
        .section img {
            width: 100%;
            height: auto;
            margin-top: 10px;
            border-radius: 10px;
        }
        ul {
            list-style: none;
            padding: 0;
        }
        ul li {
            background: rgba(255, 255, 255, 0.2);
            margin: 10px 0;
            padding: 15px;
            border-radius: 10px;
            font-size: 1rem;
        }
        blockquote {
            font-style: italic;
            color: #ddd;
            margin: 10px 0;
            padding: 15px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
        }
        .testimonials cite {
            display: block;
            font-weight: bold;
            text-align: right;
            margin-top: 10px;
        }
        a {
            text-decoration: none;
            padding: 15px 30px;
            background: #fff;
            color: #2575fc;
            font-weight: bold;
            border-radius: 5px;
            margin-top: 30px;
            display: inline-block;
        }
        a:hover {
            background: #ddd;
        }
    </style>
</head>
<body>
    <header>
        <img src="img/logo.png" alt="Career Path Logo">
        <h1>About Career Path</h1>
        <p>Welcome to Career Path! This application is designed to empower students by helping them discover and pursue their ideal career paths. Whether you are exploring options or seeking a clear direction, we are here to guide you.</p>
    </header>

    <div class="section mission">
        <h2>Our Mission</h2>
        <p>Career Path aims to provide students with the tools and resources they need to make informed career decisions. By aligning personal interests and skills with professional opportunities, we help users achieve their career aspirations with confidence.</p>
        <img src="img/logo.png" alt="Mission Illustration">
    </div>

    <div class="section features">
        <h2>Key Features</h2>
        <ul>
            <li>Interactive career suggestions tailored to your interests and skills.</li>
            <li>User-friendly dashboard to explore and manage career options.</li>
            <li>Personalized career profiles for tracking goals and progress.</li>
            <li>Access to valuable resources, tips, and industry insights.</li>
            <li>Flexible and intuitive interface designed specifically for students.</li>
        </ul>
        <img src="img/logo2.jpg" alt="Features Illustration">
    </div>

    <div class="section testimonials">
        <h2>User Testimonials</h2>
        <blockquote>
            "Career Path helped me discover my passion for Data Science. The interactive suggestions and easy-to-use interface made it so simple!" 
            <cite>- Aisyah, University Student</cite>
        </blockquote>
        <blockquote>
            "Thanks to Career Path, I am now pursuing a career in Graphic Design with confidence. This app is a game-changer for students!" 
            <cite>- Raj, College Graduate</cite>
        </blockquote>
        <img src="img/logo3.jpg" alt="Happy Students Illustration">
    </div>

    <a href="index.jsp">Go to Homepage</a>
</body>
</html>
