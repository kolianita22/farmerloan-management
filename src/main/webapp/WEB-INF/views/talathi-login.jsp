<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Talathi Login</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>

body{
    background: linear-gradient(to right,#d4fc79,#96e6a1);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    font-family: Arial, sans-serif;
}

.login-card{
    width:400px;
    background:white;
    border-radius:15px;
    padding:35px;
    box-shadow:0px 5px 20px rgba(0,0,0,0.2);
}

.logo{
    text-align:center;
    margin-bottom:20px;
}

.logo img{
    width:80px;
}

.title{
    text-align:center;
    font-size:28px;
    font-weight:bold;
    color:#2e7d32;
    margin-bottom:25px;
}

.form-control{
    height:50px;
    border-radius:10px;
}

.btn-login{
    background:#2e7d32;
    color:white;
    width:100%;
    height:50px;
    border:none;
    border-radius:10px;
    font-size:18px;
    font-weight:bold;
    transition:0.3s;
}

.btn-login:hover{
    background:#1b5e20;
}

.footer-text{
    text-align:center;
    margin-top:20px;
    color:gray;
    font-size:14px;
}

.error{
    color:red;
    text-align:center;
    margin-bottom:15px;
}

</style>
</head>

<body>

<div class="login-card">

    <div class="logo">
        <img src="https://cdn-icons-png.flaticon.com/512/2909/2909763.png">
    </div>

    <div class="title">
        Talathi Login
    </div>

    <!-- Error Message -->
    <% if(request.getAttribute("error") != null){ %>
        <div class="error">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <form action="talathiLogin" method="post">

        <!-- Username -->
        <div class="mb-3">
            <label class="form-label">
                <i class="bi bi-person-fill"></i> Username
            </label>

            <input type="text"
                   name="username"
                   class="form-control"
                   placeholder="Enter username"
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

