package my.career.servlet;

import my.career.dao.UserDAO;
import my.career.model.User;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmail(email); // Fetch user from DB
        
        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            // Password matches, create session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("dashboard"); // Redirect to dashboard or home
        } else {
            // Login failed, redirect back to login page with error
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}



