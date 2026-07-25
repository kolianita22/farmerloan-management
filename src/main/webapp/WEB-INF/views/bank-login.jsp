<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Bank Officer Login</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
body {
    background: linear-gradient(to right, #0b3d91, #1565c0);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: 'Segoe UI', sans-serif;
}

.login-card {
    width: 400px;
    background: white;
    border-radius: 15px;
    padding: 35px;
    box-shadow: 0px 5px 20px rgba(0,0,0,0.3);
}

.logo {
    text-align: center;
    font-size: 24px;
    font-weight: bold;
    color: #0b3d91;
    margin-bottom: 10px;
}

.title {
    text-align: center;
    font-size: 22px;
    font-weight: bold;
    color: #333;
    margin-bottom: 25px;
}

.form-control {
    height: 48px;
    border-radius: 8px;
}

.btn-login {
    background: #0b3d91;
    color: white;
    width: 100%;
    height: 48px;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    transition: 0.3s;
}

.btn-login:hover {
    background: #072c6b;
}

.footer-text {
    text-align: center;
    margin-top: 20px;
    color: gray;
    font-size: 13px;
}

.error {
    color: red;
    text-align: center;
    margin-bottom: 15px;
    font-weight: 600;
}
</style>
</head>

<body>

<div class="login-card">

    <div class="logo">
        🏦 Bank Portal
    </div>
    <div class="title">
        Officer Login
    </div>

    <!-- Error Message -->
    <c:if test="${not empty error}">
        <div class="error">
            ${error}
        </div>
    </c:if>

    <form action="/bankLogin" method="post">

        <!-- Username -->
        <div class="mb-3">
            <label class="form-label">
                <i class="bi bi-person-fill"></i> Username
            </label>
            <input type="text"
                   name="username"
                   class="form-control"
                   placeholder="Enter bank username"
                   required>
        </div>

        <!-- Password -->
        <div class="mb-4">
            <label class="form-label">
                <i class="bi bi-lock-fill"></i> Password
            </label>
            <input type="password"
                   name="password"
                   class="form-control"
                   placeholder="Enter password"
                   required>
        </div>

        <!-- Login Button -->
        <button type="submit" class="btn-login">
            Login
        </button>

    </form>

    <div class="footer-text">
        Farmer Crop Loan Management System
    </div>

</div>

</body>
</html>
