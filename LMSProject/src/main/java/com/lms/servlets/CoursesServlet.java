package com.lms.servlets;



import com.lms.dao.CourseDao;
import com.lms.model.Course;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CoursesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       // CourseDao courseDao = new CourseDao();
        // implement this method in CourseDao to fetch only approved courses
       // List<Course> approvedCourses = courseDao.getApprovedCourses();

       // request.setAttribute("approvedCourses", approvedCourses);
        request.getRequestDispatcher("/courses.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
