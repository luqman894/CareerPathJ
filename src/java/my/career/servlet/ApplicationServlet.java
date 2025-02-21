package my.career.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import my.career.model.Application;
import my.career.model.Program;
import my.career.model.User;
import my.career.model.Subject;
import my.career.model.UserSubject;
import my.career.util.DatabaseConnection;
import java.util.HashSet;
import java.util.Set;

@WebServlet("/dashboard")
public class ApplicationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve the user object from the session
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not logged in
            return;
        }

        int userId = user.getId();

        // Fetch user subjects and suggested programs
        List<UserSubject> userSubjects = new ArrayList<>();
        List<Program> suggestedPrograms = new ArrayList<>();
        List<Application> applications = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM applications WHERE user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int programId1 = rs.getInt("program_id_1");
                int programId2 = rs.getInt("program_id_2");
                int programId3 = rs.getInt("program_id_3");

                Program program1 = fetchProgramDetails(conn, programId1);
                Program program2 = fetchProgramDetails(conn, programId2);
                Program program3 = fetchProgramDetails(conn, programId3);

                applications.add(new Application(
                        rs.getInt("application_id"),
                        rs.getInt("user_id"),
                        program1,
                        program2,
                        program3,
                        rs.getString("application_date"),
                        rs.getString("application_status")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Fetch list of all available subjects for the dropdown
        List<Subject> subjects = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            // SQL to fetch subjects not selected by the current user
            String sql = "SELECT subject_id, subject_name FROM subjects "
                    + "WHERE subject_id NOT IN (SELECT subject_id FROM user_subjects WHERE user_id = ?) "
                    + "ORDER BY subject_name ASC";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    subjects.add(new Subject(
                            rs.getInt("subject_id"),
                            rs.getString("subject_name")
                    ));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Fetch user subjects
            String userSubjectsSql = "SELECT us.user_subject_id, s.subject_name, us.subject_grade, s.subject_id "
                    + "FROM user_subjects us "
                    + "JOIN subjects s ON us.subject_id = s.subject_id "
                    + "WHERE us.user_id = ?";
            PreparedStatement userSubjectsStmt = conn.prepareStatement(userSubjectsSql);
            userSubjectsStmt.setInt(1, userId);
            ResultSet userSubjectsRs = userSubjectsStmt.executeQuery();

            while (userSubjectsRs.next()) {
                UserSubject userSubject = new UserSubject(
                        userSubjectsRs.getInt("user_subject_id"),
                        userSubjectsRs.getString("subject_name"),
                        userSubjectsRs.getString("subject_grade")
                );
                userSubjects.add(userSubject);
            }

            Set<Integer> seenProgramIds = new HashSet<>();

            // Fetch suggested programs based on the user subject grades and filter by subject_id
            for (UserSubject userSubject : userSubjects) {
                // Suggest programs based on subject_grade and subject_id
                String suggestedProgramsSql = "SELECT DISTINCT p.id, p.program_id, p.program_name, p.program_description, p.entrance_requirement "
                        + "FROM programs p "
                        + "JOIN user_subjects us ON us.subject_id = p.subject_id "
                        + "WHERE us.user_id = ? "
                        + "AND us.subject_grade = 'A'";

                // Prepare and execute the query
                PreparedStatement suggestedProgramsStmt = conn.prepareStatement(suggestedProgramsSql);
                suggestedProgramsStmt.setInt(1, userId);  // Set user ID parameter
                ResultSet suggestedProgramsRs = suggestedProgramsStmt.executeQuery();

                while (suggestedProgramsRs.next()) {
                    int programId = suggestedProgramsRs.getInt("program_id");

                    // Check if the program_id has already been added
                    if (!seenProgramIds.contains(programId)) {
                        // Create the Program object
                        Program program = new Program(
                                suggestedProgramsRs.getInt("id"),
                                programId,
                                suggestedProgramsRs.getString("program_name"),
                                suggestedProgramsRs.getString("program_description"),
                                suggestedProgramsRs.getString("entrance_requirement")
                        );
                        // Add the program to the list
                        suggestedPrograms.add(program);
                        // Mark this program_id as seen
                        seenProgramIds.add(programId);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("applications", applications);
        request.setAttribute("subjects", subjects);
        request.setAttribute("userSubjects", userSubjects);
        request.setAttribute("suggestedPrograms", suggestedPrograms);

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }

    private Program fetchProgramDetails(Connection conn, int programId) {
        if (programId == 0) {
            return null; // No program selected
        }
        String sql = "SELECT * FROM programs WHERE program_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, programId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Program(
                        rs.getInt("program_id"),
                        rs.getString("program_name"),
                        rs.getString("program_description"),
                        rs.getString("entrance_requirement")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
