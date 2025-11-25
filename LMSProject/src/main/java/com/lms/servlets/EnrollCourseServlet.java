package com.lms.servlets;

import com.lms.dao.EnrollmentDao;
import com.lms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EnrollCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String courseIdStr = request.getParameter("courseId");
        User user = (User) request.getSession().getAttribute("currentUser");

        if (user != null && "student".equals(user.getRole())) {
            int courseId = Integer.parseInt(courseIdStr);
            EnrollmentDao enrollmentDao = new EnrollmentDao();
            enrollmentDao.enrollStudentInCourse(user.getId(), courseId);

            request.setAttribute("message", "You have enrolled in the course.");
            request.getRequestDispatcher("/courses.jsp").forward(request, response);
        } else {
            response.sendRedirect("/login.jsp");
        }
    }
}
