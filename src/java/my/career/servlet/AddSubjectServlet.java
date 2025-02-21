package my.career.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import my.career.util.DatabaseConnection;
import my.career.model.User;

@WebServlet("/addSubject")
public class AddSubjectServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the parameters from the form
        int subjectId = Integer.parseInt(request.getParameter("subjectId"));
        String subjectGrade = request.getParameter("subjectGrade");

        // Assuming user_id is stored in session
        int userId = ((User) request.getSession().getAttribute("user")).getId();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO user_subjects (user_id, subject_id, subject_grade) VALUES (?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                stmt.setInt(2, subjectId);
                stmt.setString(3, subjectGrade);

                // Execute the insert
                int rowsInserted = stmt.executeUpdate();
                
                if (rowsInserted > 0) {
                    response.sendRedirect("dashboard");  // Redirect to dashboard to see the updated list of subjects
                } else {
                    response.getWriter().println("Error adding subject.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error adding subject.");
        }
    }
}
