<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">
    <div class="card p-4">
        <h3 class="text-center">Farmer Registration</h3>

        <form action="/register" method="post">

            <input type="text" name="name" placeholder="Full Name" class="form-control mb-3" required>

            <input type="text" name="mobile" placeholder="Mobile Number" class="form-control mb-3" required>

            <input type="text" name="aadhaar" placeholder="Aadhaar Number" class="form-control mb-3" required>

            <button class="btn btn-success w-100">Register</button>

        </form>

    </div>
</div>

</body>
</html>