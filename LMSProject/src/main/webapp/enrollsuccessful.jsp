<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Enrollment Successful</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
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
    <h2>You have successfully enrolled in the course!</h2>
    <a href="${pageContext.request.contextPath}/courses.jsp">Back to Courses</a>
</div>

</body>
</html>
