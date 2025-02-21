<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career Path</title>
 
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            overflow-x: hidden;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        /* Header */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 50px;
            background: rgba(0, 0, 0, 0.4);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        header .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
        }
        header nav ul {
            display: flex;
            gap: 20px;
        }
        header nav ul li {
            padding: 10px 20px;
            border-radius: 5px;
            transition: background 0.3s;
        }
        header nav ul li:hover {
            background: #ffffff30;
        }

        /* Hero Section */
        .hero {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            padding: 100px 20px;
        }
        .hero h1 {
            font-size: 3rem;
            margin-bottom: 10px;
        }
        .hero p {
            font-size: 1.2rem;
            max-width: 600px;
            line-height: 1.8;
            margin-bottom: 30px;
        }
        .hero .cta {
            padding: 15px 30px;
            background: #fff;
            color: #2575fc;
            font-weight: bold;
            border-radius: 5px;
            transition: background 0.3s, transform 0.3s;
        }
        .hero .cta:hover {
            background: #ddd;
            transform: scale(1.05);
        }

        /* Features Section */
        .features {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 50px 20px;
            gap: 20px;
        }
        .feature {
            background: rgba(0, 0, 0, 0.3);
            border-radius: 10px;
            padding: 20px;
            width: 300px;
            text-align: center;
            transition: transform 0.3s;
        }
        .feature img {
            width: 200px;
            margin-bottom: 10px;
        }
        .feature h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }
        .feature p {
            font-size: 1rem;
            line-height: 1.6;
        }
        .feature:hover {
            transform: scale(1.05);
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 20px;
            background: rgba(0, 0, 0, 0.5);
        }
        footer p {
            margin: 0;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <header>
        <div class="logo">Career Path</div>
        <nav>
            <ul>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
            </ul>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <h1>Shape Your Future</h1>
        <p>Explore career opportunities, enhance your skills, and unlock your true potential. Let's pave the path to your dream career.</p>
        <a href="login.jsp" class="cta">Get Started</a>
    </section>

    <!-- Features Section -->
    <section id="features" class="features">
        <div class="feature">
            <img src="img/finance.jpg" alt="Skill Assessment">
            <h3>Skill Assessment</h3>
            <p>Discover your strengths and areas of improvement through our personalized skill assessment tools.</p>
        </div>
        <div class="feature">
            <img src="img/engineering.jpg" alt="Career Guidance">
            <h3>Career Guidance</h3>
            <p>Receive expert advice on selecting the right career path tailored to your interests and skills.</p>
        </div>
        <div class="feature">
            <img src="img/tech.jpg" alt="Online Courses">
            <h3>Online Courses</h3>
            <p>Upskill with our range of certified courses designed to prepare you for the competitive job market.</p>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <p>© 2024 Career Path. All rights reserved.</p>
    </footer>

</body>
</html>