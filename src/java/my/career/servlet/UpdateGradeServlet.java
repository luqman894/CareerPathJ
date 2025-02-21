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

@WebServlet("/updateGrade")
public class UpdateGradeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the parameters from the form
        int userSubjectId = Integer.parseInt(request.getParameter("userSubjectId"));
        String newGrade = request.getParameter("newGrade");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE user_subjects SET subject_grade = ? WHERE user_subject_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, newGrade);
                stmt.setInt(2, userSubjectId);
                
                // Execute the update
                int rowsUpdated = stmt.executeUpdate();
                
                if (rowsUpdated > 0) {
                    response.sendRedirect("dashboard");  // Redirect back to dashboard after update
                } else {
                    response.getWriter().println("Error updating grade.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating grade.");
        }
    }
}