<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="my.career.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="my.career.model.Application" %>
<%@ page import="my.career.model.Subject" %>
<%@ page import="my.career.model.Career" %>
<%@ page import="my.career.model.UserSubject" %>
<%@ page import="my.career.model.Program" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard - Career Path</title>

        <script>
            // Function to submit the grade change
            function saveGrade(userSubjectId) {
                // Get the value of the updated grade from the input field
                const grade = document.getElementById("grade_" + userSubjectId).value;

                // Update the hidden field with the new grade value
                document.getElementById("newGrade_" + userSubjectId).value = grade;

                // Get the form and submit it
                const form = document.getElementById("gradeForm_" + userSubjectId);
                form.submit();
            }

            function confirmDelete(userSubjectId, subjectName) {
                return confirm("Are you sure you want to delete the subject: " + subjectName + "?");
            }
        </script>


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

            table {
                width: 100%; /* Make the table take up full width */
                border-collapse: collapse; /* Optional: Makes the borders merge into one */
            }

            th, td {
                padding: 4px; /* Optional: Add padding for better spacing */
                text-align: left; /* Optional: Align text to the left */
            }

            th {
                background-color: #f2f2f2; /* Optional: Add a background color for the header row */
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
                        out.println(user.getFirstName() + " " + user.getLastName());
                    }
                %>
            </h2>

        </header>

        <div class="content">
            <% if (request.getAttribute("errorMessage") != null) {%>
            <p style="color: red;"><%= request.getAttribute("errorMessage")%></p>
            <% } %>

            <div class="section">
                <h2>About Career Paths</h2>
                <p>Career Path provides you with insights and guidance to help you decide on a fulfilling career. Explore a variety of industries, understand required skills, and learn about opportunities in your field of interest.</p>
            </div>

            <div class="section">
                <h2>Your Subjects</h2>
                <table border="1">
                    <tr>
                        <th>Subject Name</th>
                        <th>Grade</th>
                        <th>Actions</th>
                    </tr>
                    <%
                        List<UserSubject> userSubjects = (List<UserSubject>) request.getAttribute("userSubjects");
                        for (UserSubject userSubject : userSubjects) {
                    %>
                    <tr>
                        <td><%= userSubject.getSubjectName()%></td>
                        <td>
                            <!-- Editable grade field -->
                            <select type="text" id="grade_<%= userSubject.getId()%>">
                                <option value="A" <%= "A".equals(userSubject.getGrade()) ? "selected" : ""%>>A</option>
                                <option value="B" <%= "B".equals(userSubject.getGrade()) ? "selected" : ""%>>B</option>
                                <option value="C" <%= "C".equals(userSubject.getGrade()) ? "selected" : ""%>>C</option>
                                <option value="D" <%= "D".equals(userSubject.getGrade()) ? "selected" : ""%>>D</option>
                                <option value="E" <%= "E".equals(userSubject.getGrade()) ? "selected" : ""%>>E</option>
                                <option value="G" <%= "G".equals(userSubject.getGrade()) ? "selected" : ""%>>G</option>
                            </select>
                        </td>
                        <td>
                            <!-- Form to save the updated grade -->
                            <form id="gradeForm_<%= userSubject.getId()%>" action="updateGrade" method="POST">
                                <input type="hidden" name="userSubjectId" value="<%= userSubject.getId()%>">
                                <input type="hidden" name="newGrade" id="newGrade_<%= userSubject.getId()%>" value="<%= userSubject.getGrade()%>">
                                <button type="button" onclick="saveGrade(<%= userSubject.getId()%>)">Save</button>
                            </form>

                            <form action="deleteSubject" method="POST"        onsubmit="return confirmDelete(<%= userSubject.getId()%>, '<%= userSubject.getSubjectName()%>');">

                                <input type="hidden" name="userSubjectId" value="<%= userSubject.getId()%>">
                                <button type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </table>

                <h3>Add Subject</h3>

                <form action="addSubject" method="POST">
                    <label for="subject">Subject:</label>
                    <select name="subjectId" id="subject">
                        <%
                            List<Subject> subjects = (List<Subject>) request.getAttribute("subjects");
                            for (Subject subject : subjects) {
                        %>
                        <option value="<%= subject.getSubjectId()%>"><%= subject.getSubjectName()%></option>
                        <% } %>
                    </select><br>

                    <label for="subjectGrade">Grade:</label>
                    <select type="text" id="subjectGrade" name="subjectGrade" required>
                        <option value="A">A</option> 
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                        <option value="E">E</option>
                        <option value="G">G</option>
                    </select><br><br>

                    <button type="submit">Add Subject</button>
                </form>
            </div>

            <div class="section">
                <h2>Courses Programs</h2>
                <div class="career-grid">
                <%
                    // Retrieve the suggestedPrograms list from request attribute
                    List<Program> suggestedPrograms = (List<Program>) request.getAttribute("suggestedPrograms");

                    // Iterate over the list and display each program
                    if (suggestedPrograms != null) {
                        for (Program program : suggestedPrograms) {
                %>
                <div class="career-card">
                    <h3><%= program.getProgramName()%></h3>
                    <p><%= program.getProgramDescription()%></p>
                    <p><%= program.getEntranceRequirement()%></p>
                    <a href="#">Apply Now</a>
                </div> 

                <%
                        }
                    }
                %>
                </div>
                </br>
                <h2>Future Careers</h2>

                <%
                    // Get the suggested careers from the request attribute
                    List<Career> suggestedCareers = (List<Career>) request.getAttribute("suggestedCareers");
                    if (suggestedCareers != null && !suggestedCareers.isEmpty()) {
                %>
                <div class="career-grid">
                    <%
                        // Iterate through the list of suggested careers
                        for (Career career : suggestedCareers) {
                    %>

                    <div class="career-card">
                        <img src="img/bio.jpg" alt="Career Image"> 
                        <h3><%= career.getCareerName()%></h3>
                        <p><%= career.getDescription()%></p>

                    </div>                  

                    <%
                        }
                    %>
                </div>
                <%
                } else {
                %>
                <p>No careers found for the selected criteria.</p>
                <%
                    }
                %>


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
                            <button onclick="window.location.href = 'events.html'" class="join-button">Join Now</button>
                        </div>
                        <!-- Event 2 -->
                        <div class="event-card">
                            <img src="img/ai.jpeg" alt="Event Image">
                            <h3>Webinar: Navigating Your Career Path</h3>
                            <p>Attend our free webinar to learn how to choose the best career path for you!</p>
                            <button onclick="window.location.href = 'events.html'" class="join-button">Join Now</button>
                        </div>
                    </div>
                </div>

            </div>

            <footer>
                <p>&copy; 2024 Career Path. All rights reserved.</p>
            </footer>
    </body>
</html>