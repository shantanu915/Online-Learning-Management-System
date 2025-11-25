package com.lms.servlets;

import com.lms.dao.CourseDao;
import com.lms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ApproveCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String courseIdStr = request.getParameter("courseId");
        User user = (User) request.getSession().getAttribute("currentUser");

        if (user != null && "admin".equals(user.getRole())) {
            int courseId = Integer.parseInt(courseIdStr);
            CourseDao courseDao = new CourseDao();
            courseDao.approveCourse(courseId);

            request.setAttribute("message", "Course approved.");
            request.getRequestDispatcher("jsp/courses.jsp").forward(request, response);
        } else {
            response.sendRedirect("jsp/login.jsp");
        }
    }
}
