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

@WebServlet("/deleteSubject")
public class DeleteSubjectServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the userSubjectId from the form
        int userSubjectId = Integer.parseInt(request.getParameter("userSubjectId"));

        // Perform the deletion in the database
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM user_subjects WHERE user_subject_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userSubjectId);

                int rowsDeleted = stmt.executeUpdate();
                if (rowsDeleted > 0) {
                    response.sendRedirect("dashboard");  // Redirect to the dashboard to see the updated list
                } else {
                    response.getWriter().println("Error deleting subject.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting subject.");
        }
    }
}
