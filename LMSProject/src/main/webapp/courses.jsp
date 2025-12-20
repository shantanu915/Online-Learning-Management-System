<%@ page import="java.util.List" %>
<%@ page import="com.lms.model.Course" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Courses</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>

<div class="table-wrapper">
    <h2>All Approved Courses</h2>

    <table class="table-courses">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Instructor ID</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <!-- Temporary demo subjects (frontend only) -->
        <tr>
            <td>1</td>
            <td>Mathematics</td>
            <td>Algebra and basic calculus</td>
            <td>101</td>
            <td>approved</td>
            <td>
                <form action="<%= request.getContextPath() %>/EnrollCourseServlet" method="post">
                    <input type="hidden" name="courseId" value="1">
                    <input type="submit" value="Enroll" class="btn-secondary">
                </form>
            </td>
        </tr>
        <tr>
            <td>2</td>
            <td>Physics</td>
            <td>Mechanics and waves</td>
            <td>102</td>
            <td>approved</td>
            <td>
                <form action="<%= request.getContextPath() %>/EnrollCourseServlet" method="post">
                    <input type="hidden" name="courseId" value="2">
                    <input type="submit" value="Enroll" class="btn-secondary">
                </form>
            </td>
        </tr>
        <tr>
            <td>3</td>
            <td>Chemistry</td>
            <td>Organic and inorganic basics</td>
            <td>103</td>
            <td>approved</td>
            <td>
                <form action="<%= request.getContextPath() %>/EnrollCourseServlet" method="post">
                    <input type="hidden" name="courseId" value="3">
                    <input type="submit" value="Enroll" class="btn-secondary">
                </form>
            </td>
        </tr>

        <%-- Dynamic courses from backend --%>
        <%
            List<Course> approvedCourses = (List<Course>) request.getAttribute("approvedCourses");
            if (approvedCourses != null) {
                for (Course course : approvedCourses) {
        %>
        <tr>
            <td><%= course.getId() %></td>
            <td><%= course.getTitle() %></td>
            <td><%= course.getDescription() %></td>
            <td><%= course.getInstructorId() %></td>
            <td><%= course.getStatus() %></td>
            <td>
                <form action="<%= request.getContextPath() %>/EnrollCourseServlet" method="post">
                    <input type="hidden" name="courseId" value="<%= course.getId() %>">
                    <input type="submit" value="Enroll" class="btn-secondary">
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
    <p style="color:green; margin-top:10px;"><%= message %></p>
    <%
        }
    %>
</div>

<style>
        /* Optional inline CSS if you don't want to edit styles.css */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .success-container {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            border-radius: 8px;
            padding: 30px;
            width: 50%;
            margin: 100px auto;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .success-container h2 {
            margin: 0;
            font-size: 26px;
            font-weight: bold;
        }

        .success-container a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #28a745;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .success-container a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="success-container">
   
    <a href="${pageContext.request.contextPath}/login.jsp">Back to Login</a>
</div>

</body>
</html>
