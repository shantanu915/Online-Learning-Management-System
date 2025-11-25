// LoginServlet.java
package com.lms.servlets;

import com.lms.dao.UserDao;
import com.lms.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDao userDao = new UserDao();
        User user = userDao.findByUsernameAndPassword(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);

            // SUCCESS: go to CoursesServlet (not directly to JSP)
            response.sendRedirect(request.getContextPath() + "/courses");
        } else {
            request.setAttribute("error", "Invalid Username or Password");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // when /LoginServlet is opened directly, show login page
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
