<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Course</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>

<header class="site-header">
    <h1>Online Learning Management System</h1>
</header>

<div class="page-wrapper">
    <div class="card">
        <h2>Create a New Course</h2>

        <form action="${pageContext.request.contextPath}/CreateCourseServlet" method="post">
            <div class="form-row">
                <label>Title</label>
                <input type="text" name="title" required>
            </div>

            <div class="form-row">
                <label>Description</label>
                <textarea name="description" rows="4" style="width:100%; padding:8px 10px;
                          border:1px solid #ccc; border-radius:4px; box-sizing:border-box;" required></textarea>
            </div>

            <input type="submit" value="Create Course" class="btn-primary">
        </form>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
        <p class="error-msg" style="color:green;"><%= message %></p>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
