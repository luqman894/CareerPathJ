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
    <title>Dashboard - Career Path</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f4f9;
            color: #333;
        }
        header {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        header h1 {
            margin: 0;
            font-size: 2rem;
        }
        header p {
            margin: 5px 0 20px;
            font-size: 1.2rem;
        }
        .greeting {
            font-size: 1.5rem;
            color: #fff;
            margin-bottom: 20px;
        }
        .content {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }
        .section {
            background: #fff;
            padding: 20px;
            margin: 20px 0;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .section h2 {
            margin-top: 0;
            color: #2575fc;
        }
        .section p {
            line-height: 1.6;
            margin: 10px 0;
        }
        .career-grid, .event-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        .career-card, .event-card {
            background: #f9f9ff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .career-card img, .event-card img {
            width: 100px;
            height: 100px;
            margin-bottom: 10px;
            border-radius: 50%;
            border: 2px solid #2575fc;
        }
        .career-card h3, .event-card h3 {
            margin: 10px 0;
            color: #333;
        }
        .career-card p, .event-card p {
            font-size: 0.9rem;
            color: #555;
        }
        .career-card a, .event-card a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: #fff;
            background: #2575fc;
            border-radius: 5px;
            font-size: 0.9rem;
        }
        .career-card a:hover, .event-card a:hover {
            background: #6a11cb;
        }
        footer {
            background: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            margin-top: 20px;
        }
        .stats {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .stat-card {
            background: #fff;
            border-radius: 10px;
            padding: 20px;
            width: 22%;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .stat-card h3 {
            color: #2575fc;
        }
        .stat-card p {
            font-size: 1.5rem;
            color: #333;
            margin-top: 10px;
        }
        
    .section {
        margin: 40px 20px;
    }

    .event-grid {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
    }

    .event-card {
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        text-align: center;
        flex: 1 1 calc(45% - 20px);
    }

    .event-card img {
        max-width: 100px;
        border-radius: 50%;
    }

    .event-card h3 {
        font-size: 1.2rem;
        margin: 10px 0;
    }

    .event-card p {
        font-size: 1rem;
        color: #666;
    }

    .join-button {
        background: #2575fc;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1rem;
    }

    .join-button:hover {
        background: #6a11cb;
    }


    
    </style>
</head>
<body>
 
    <a href="logout.jsp">Logout</a>
    
    <body>
    
    <header>
        <h1>Welcome to Your Dashboard</h1>
        <p>Explore your career options and find the path that suits you best!</p>
        <div class="greeting" id="greeting"></div>
        <h2>
        <% 
            User user = (User) session.getAttribute("user");
            if (user != null) {
                out.println(user.getFirstName() + " " + user.getLastName() );
            }
        %>
        </h2>
        
    </header>

    <div class="content">
                <% if (request.getAttribute("errorMessage") != null) { %>
            <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
        <% } %>

        
        <div class="section">
            <h2>About Career Paths</h2>
            <p>Career Path provides you with insights and guidance to help you decide on a fulfilling career. Explore a variety of industries, understand required skills, and learn about opportunities in your field of interest.</p>
        </div>

        <div class="section">
            <h2>Career Path Recommendations</h2>
            <div class="career-grid">
            <%
                List<Application> applications = (List<Application>) request.getAttribute("applications");
                if (applications != null && !applications.isEmpty()) {
                    for (Application app : applications) {
            %>
 
    
                    <%
                        Program p1 = app.getProgram1();
                        if (p1 != null) {
                    %>
                    
                    <div class="career-card">
                    <img src="img/bio.jpg" alt="Career Image"> 
                    <h3><%= p1.getProgramName() %></h3>
                    <p><%= p1.getProgramDescription() %></p>
                    <a href="#">Learn More</a>
                    </div>
                  
                    <%
                        } else { out.print("N/A"); }
                    %>
                    
                               <%
                        Program p2 = app.getProgram2();
                        if (p1 != null) {
                    %>
                    
                    <div class="career-card">
                    <img src="img/science.jpg" alt="Career Image">
                    <h3><%= p2.getProgramName() %></h3>
                    <p><%= p2.getProgramDescription() %></p>
                    <a href="#">Learn More</a>
                    </div>
                  
                    <%
                        } else { out.print("N/A"); }
                    %>
     
                    
                               <%
                        Program p3 = app.getProgram3();
                        if (p1 != null) {
                    %>
                    
                    <div class="career-card">
                    <img src="img/computer.jpg" alt="Career Image">
                    <h3><%= p3.getProgramName() %></h3>
                    <p><%= p3.getProgramDescription() %></p>
                    <a href="#">Learn More</a>
                    </div>
                  
                    <%
                        } else { out.print("N/A"); }
                    %>
           
            <%
                    }
                } else {
            %>
            <div>
            No applications found.                
            </div> 
            <% } %>
            </div>
        
        
        <div class="section">
            <h2>Career Path Recommendations</h2>
            <div class="career-grid">
                <!-- Career 1 -->
                <div class="career-card">
                    <img src="img/computer.jpg" alt="Career Image">
                    <h3>Software Engineer</h3>
                    <p>Develop and maintain software systems to solve problems and improve processes.</p>
                    <a href="#">Learn More</a>
                </div>
                <!-- Career 2 -->
                <div class="career-card">
                    <img src="img/computer.jpg" alt="Career Image">
                    <h3>Data Scientist</h3>
                    <p>Analyze complex data to help businesses make informed decisions.</p>
                    <a href="#">Learn More</a>
                </div>
                <!-- Career 3 -->
                <div class="career-card">
                    <img src="img/computer.jpg" alt="Career Image">
                    <h3>Graphic Designer</h3>
                    <p>Use creativity and technology to design visual concepts for branding and marketing.</p>
                    <a href="#">Learn More</a>
                </div>
                <!-- More careers can be added here -->
            </div>
        </div>

        <div class="section">
            <h2>Skill Development Progress</h2>
            <div class="stats">
                <div class="stat-card">
                    <h3>Completed Courses</h3>
                    <p>5/10</p>
                </div>
                <div class="stat-card">
                    <h3>Certifications Earned</h3>
                    <p>2/5</p>
                </div>
                <div class="stat-card">
                    <h3>Skill Progress</h3>
                    <p>80%</p>
                </div>
                <div class="stat-card">
                    <h3>Saved Careers</h3>
                    <p>10</p>
                </div>
            </div>
        </div>

        <div class="section">
            <h2>Industry News</h2>
            <div class="event-grid">
                <!-- News 1 -->
                <div class="event-card">
                    <img src="img/ai.jpeg" alt="News Image">
                    <h3>Technology in 2024: The Future of AI</h3>
                    <p>Stay updated on the latest trends in artificial intelligence and its impact on various industries.</p>
                    <a href="#">Read More</a>
                </div>
                <!-- News 2 -->
                <div class="event-card">
                    <img src="img/ai.jpeg" alt="News Image">
                    <h3>Top Skills for Data Scientists</h3>
                    <p>Learn the key skills needed to become a successful data scientist in today’s job market.</p>
                    <a href="#">Read More</a>
                </div>
            </div>
        </div>

        <div class="section">
            <h2>Upcoming Events</h2>
            <div class="event-grid">
                <!-- Event 1 -->
                <div class="event-card">
                    <img src="img/ai.jpeg" alt="Event Image">
                    <h3>Career Fair 2024</h3>
                    <p>Join us at the annual career fair to meet industry professionals and learn about job opportunities.</p>
                    <button onclick="window.location.href='events.html'" class="join-button">Join Now</button>
                </div>
                <!-- Event 2 -->
                <div class="event-card">
                    <img src="img/ai.jpeg" alt="Event Image">
                    <h3>Webinar: Navigating Your Career Path</h3>
                    <p>Attend our free webinar to learn how to choose the best career path for you!</p>
                    <button onclick="window.location.href='events.html'" class="join-button">Join Now</button>
                </div>
            </div>
        </div>
        
    </div>

    <footer>
        <p>&copy; 2024 Career Path. All rights reserved.</p>
    </footer>

   
</body>
</html>