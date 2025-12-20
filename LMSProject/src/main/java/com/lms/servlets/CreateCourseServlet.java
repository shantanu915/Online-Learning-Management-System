package com.lms.servlets;

import com.lms.dao.CourseDao;
import com.lms.model.Course;
import com.lms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CreateCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        User user = (User) request.getSession().getAttribute("currentUser");

        if (user != null && "instructor".equals(user.getRole())) {

            Course course = new Course();
            course.setTitle(title);
            course.setDescription(description);
            course.setStatus("pending");
            course.setInstructorId(user.getId());

            CourseDao courseDao = new CourseDao();
            courseDao.createCourse(course);

            // ✅ CHANGE 1: redirect to success page (NOT forward)
            response.sendRedirect(request.getContextPath() + "/courseSuccess.jsp");

        } else {
            // ✅ CHANGE 2: fix context path (avoid 404)
            response.sendRedirect(request.getContextPath() + "/createCourse.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/createCourse.jsp").forward(request, response);
    }
}
