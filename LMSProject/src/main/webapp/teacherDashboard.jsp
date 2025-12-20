<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Dashboard</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 50px;
            color: #333;
            font-size: 32px;
        }

        .container {
            width: 100%;
            max-width: 500px;
            margin: 60px auto;
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
        }

        button {
            width: 100%;
            padding: 12px;
            margin: 15px 0;
            background-color: #4a90e2;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background-color: #357abd;
        }
    </style>
</head>
<body>

<h2>Teacher Dashboard</h2>

<div class="container">

    <!-- Button to go to courses -->
    <form action="${pageContext.request.contextPath}/courses" method="get">
        <button type="submit">View Courses</button>
    </form>

    <!-- Button to go to create course page -->
    <form action="${pageContext.request.contextPath}/createCourse" method="get">
        <button type="submit">Create New Course</button>
    </form>

</div>

</body>
</html>
