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

</body>
</html>
