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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User existingUser = userDAO.getUserByEmail(email);
        if (existingUser != null) {
            // If email already exists, set error message
            request.setAttribute("errorMessage", "Email already in use.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
     
            User newUser = new User();
            newUser.setFirstName(first_name);           
            newUser.setLastName(last_name);
            newUser.setEmail(email);
            newUser.setPassword(password);
            
            if (userDAO.registerUser(newUser)) {
                response.sendRedirect("login.jsp");  // Redirect to login page after successful registration
            } else {
                // If registration fails, set error message
                request.setAttribute("errorMessage", "Error registering the user. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }
}