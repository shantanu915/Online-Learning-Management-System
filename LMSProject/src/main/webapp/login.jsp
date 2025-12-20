<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>

<header class="site-header">
    <h1>Online Learning Management System</h1>
</header>

<div class="page-wrapper">
    <div class="card">
        <h2>Login</h2>
        <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
            <div class="form-row">
                <label>Username</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-row">
                <label>Password</label>
                <input type="password" name="password" required>
            </div>
            <div class="form-row">
               <label>Select Role:</label>
                 <select name="role" required>
                 <option value="student">Student</option>
                 <option value="instructor">instructor</option>
                 </select>
            </div>
            <input type="submit" value="Login" class="btn-primary">
        </form>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <div class="error-msg"><%= error %></div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
