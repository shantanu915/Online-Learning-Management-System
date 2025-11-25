package com.lms.dao;

import com.lms.model.Course;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDao {

    public void createCourse(Course course) {
        String sql = "INSERT INTO courses (title, description, status, instructor_id) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, course.getTitle());
            ps.setString(2, course.getDescription());
            ps.setString(3, course.getStatus());      // e.g. "pending"
            ps.setInt(4, course.getInstructorId());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void approveCourse(int courseId) {
        String sql = "UPDATE courses SET status = 'approved' WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, courseId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Use this from CoursesServlet to show courses.jsp
    public List<Course> getApprovedCourses() {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT * FROM courses WHERE status = 'approved'";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Course course = new Course(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("status"),
                        rs.getInt("instructor_id")
                );
                list.add(course);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
