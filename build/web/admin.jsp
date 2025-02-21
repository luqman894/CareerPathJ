<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="my.career.model.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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

        .container {
            display: flex;
            flex-wrap: wrap;
            padding: 20px;
            gap: 20px;
            justify-content: center;
        }

        .section {
            background: #fff;
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: calc(33% - 40px);
            min-width: 280px;
            flex-grow: 1;
        }

        .section h2 {
            margin-top: 0;
            color: #2575fc;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #2575fc;
            color: white;
        }

        .actions button {
            padding: 8px 12px;
            background: #2575fc;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
        }

        .actions button:hover {
            background: #6a11cb;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-button {
            padding: 10px 20px;
            background: #2575fc;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-button:hover {
            background: #6a11cb;
        }

        /* Mobile-friendly */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }

            .section {
                width: 100%;
            }
        }
    </style>
</head>
<body>

<header>
    <h1>Admin Dashboard</h1>
    <p>Manage Users, Career Paths, Courses, Events, and Skills</p>
</header>

<div class="container">

    <!-- Users Section -->
    <div class="section" id="users-section">
        <h2>Users</h2>
        <table id="user-table">
    <thead>
        <tr>
            <th>User ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Password</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <% 
            // Fetch the list of users from the request scope
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null) {
                for (User user : users) {
        %>
        <tr>
            <td><%= user.getUser_id() %></td>
            <td><%= user.getFirst_name() %></td>
            <td><%= user.getLast_name() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getPassword() %></td>
            <td>
                <button onclick="editUser(<%= user.getUser_id() %>)">Edit</button>
                <button onclick="deleteUser(<%= user.getUser_id() %>)">Delete</button>
            </td>
        </tr>
        <% 
                }
            } else {
        %>
        <tr>
            <td colspan="6">No users found</td>
        </tr>
        <% } %>
    </tbody>
</table>
        <div class="actions">
            <button onclick="addUserForm()">Add User</button>
        </div>
    </div>

    <!-- Career Paths Section -->
    <div class="section" id="career-paths-section">
        <h2>Career Paths</h2>
        <table id="career-path-table">
            <thead>
                <tr>
                    <th>Career ID</th>
                    <th>Career Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="career-path-list">
                <!-- Sample Data for Career Paths -->
                <!-- Data will be inserted here -->
            </tbody>
        </table>
        <div class="actions">
            <button onclick="addCareerPathForm()">Add Career Path</button>
        </div>
    </div>

    <!-- Courses Section -->
    <div class="section" id="courses-section">
        <h2>Courses</h2>
        <table id="course-table">
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="course-list">
                <!-- Sample Data for Courses -->
                <!-- Data will be inserted here -->
            </tbody>
        </table>
        <div class="actions">
            <button onclick="addCourseForm()">Add Course</button>
        </div>
    </div>

    <!-- Events Section -->
    <div class="section" id="events-section">
        <h2>Events</h2>
        <table id="event-table">
            <thead>
                <tr>
                    <th>Event ID</th>
                    <th>Event Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="event-list">
                <!-- Sample Data for Events -->
                <!-- Data will be inserted here -->
            </tbody>
        </table>
        <div class="actions">
            <button onclick="addEventForm()">Add Event</button>
        </div>
    </div>

    <!-- Skills Section -->
    <div class="section" id="skills-section">
        <h2>Skills</h2>
        <table id="skill-table">
            <thead>
                <tr>
                    <th>Skill ID</th>
                    <th>Skill Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="skill-list">
                <!-- Sample Data for Skills -->
                <!-- Data will be inserted here -->
            </tbody>
        </table>
        <div class="actions">
            <button onclick="addSkillForm()">Add Skill</button>
        </div>
    </div>

</div>

<!-- Add User Form Modal -->
<div id="add-user-modal" style="display:none;">
    <h3>Add New User</h3>
    <input type="text" id="first_name" class="form-input" placeholder="First Name">
    <input type="text" id="last_name" class="form-input" placeholder="Last Name">
    <input type="email" id="email" class="form-input" placeholder="Email">
    <input type="password" id="password" class="form-input" placeholder="Password">
    <button class="form-button" onclick="saveUser()">Save</button>
    <button class="form-button" onclick="closeModal('add-user-modal')">Cancel</button>
</div>

<script>
    // Sample data for Users, Career Paths, Courses, Events, and Skills
    const users = Array.from({ length: 50 }, (_, index) => ({
    user_id: index + 1,
    first_name: `First${index + 1}`,
    last_name: `Last${index + 1}`,
    email: `user${index + 1}@example.com`,
    password: `pass${index + 1}`, // Placeholder password (should be encrypted in a real app)
}));

    const careerPaths = ['Software Engineer', 'Nurse', 'Mechanical Engineer', 'Doctor', 'Teacher'];
    const courses = ['Math 101', 'Biology 202', 'English Literature', 'Computer Science 301', 'Physics 404'];
    const events = ['Tech Conference', 'Healthcare Symposium', 'Education Forum', 'Finance Workshop', 'Career Expo'];
    const skills = ['JavaScript', 'Python', 'Nursing', 'Teaching', 'Accounting'];

    // Populate data into the tables
    ffunction populateData() {
    const userList = document.getElementById('user-list');
    userList.innerHTML = ""; // Clear existing data

    users.forEach(user => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${user.user_id}</td>
            <td>${user.first_name}</td>
            <td>${user.last_name}</td>
            <td>${user.email}</td>
            <td>${user.password}</td>
            <td>
                <button onclick="editUser(${user.user_id})">Edit</button> 
                <button onclick="deleteUser(${user.user_id})">Delete</button>
            </td>
        `;
        userList.appendChild(row);
    });
}

        // Populate Career Paths Table
        const careerPathList = document.getElementById('career-path-list');
        careerPaths.forEach((career, index) => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${index + 1}</td>
                <td>${career}</td>
                <td><button onclick="editCareerPath(${index})">Edit</button> <button onclick="deleteCareerPath(${index})">Delete</button></td>
            `;
            careerPathList.appendChild(row);
        });

        // Populate Courses Table
        const courseList = document.getElementById('course-list');
        courses.forEach((course, index) => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${index + 1}</td>
                <td>${course}</td>
                <td><button onclick="editCourse(${index})">Edit</button> <button onclick="deleteCourse(${index})">Delete</button></td>
            `;
            courseList.appendChild(row);
        });

        // Populate Events Table
        const eventList = document.getElementById('event-list');
        events.forEach((event, index) => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${index + 1}</td>
                <td>${event}</td>
                <td><button onclick="editEvent(${index})">Edit</button> <button onclick="deleteEvent(${index})">Delete</button></td>
            `;
            eventList.appendChild(row);
        });

        // Populate Skills Table
        const skillList = document.getElementById('skill-list');
        skills.forEach((skill, index) => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${index + 1}</td>
                <td>${skill}</td>
                <td><button onclick="editSkill(${index})">Edit</button> <button onclick="deleteSkill(${index})">Delete</button></td>
            `;
            skillList.appendChild(row);
        });
    }

    function addUserForm() {
        document.getElementById('add-user-modal').style.display = 'block';
    }

    function saveUser() {
    const firstName = document.getElementById("first_name").value;
    const lastName = document.getElementById("last_name").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;

    if (!firstName || !lastName || !email || !password) {
        alert("All fields are required!");
        return;
    }

    const newUser = {
        user_id: users.length + 1,
        first_name: firstName,
        last_name: lastName,
        email: email,
        password: password, // In a real app, use hashing before storing
    };

    users.push(newUser);
    populateData();
    closeModal('add-user-modal');
}

    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }

    function editUser(id) {
        alert(`Editing User ${id}`);
    }

    function deleteUser(id) {
        users.splice(id - 1, 1);
        populateData();
    }

    // Initialize
    populateData();
</script>

</body>
</html>