<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Farmer Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5f7fa;
            font-family: 'Segoe UI', sans-serif;
        }

        .container-box {
            max-width: 400px;
            margin: 80px auto;
            text-align: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #1a7f5a;
        }

        .login-card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            margin-top: 20px;
        }

        .btn-green {
            background: #145c44;
            color: white;
            font-weight: bold;
        }

        .btn-green:hover {
            background: #0f4734;
        }

        .link {
            font-size: 14px;
            margin-top: 10px;
        }

        .link a {
            color: #1a7f5a;
            font-weight: 600;
            text-decoration: none;
        }

        .link a:hover {
            text-decoration: underline;
        }

        .role-links {
            margin-top: 15px;
            font-size: 14px;
        }

        .role-links a {
            margin: 0 10px;
            color: #555;
            text-decoration: none;
        }

        .role-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="container-box">

    <!-- Logo -->
    <div class="logo">
        🌱 Kisan Rin
    </div>

    <h4 class="mt-2">Farmer Login</h4>
    <p class="text-muted">Login with OTP to access your account</p>

    <!-- Card -->
    <div class="login-card">

        <form action="/send-otp" method="post">
        <div class="mb-3 text-start">
                <label>Full Name</label>
                <input type="text" name="name" class="form-control"
                       placeholder="Enter Full Name"
                       required>
            </div>

            <div class="mb-3 text-start">
                <label>Aadhaar Number</label>
                <input type="text" name="aadhaar" class="form-control"
                       placeholder="Enter 12-digit Aadhaar"
                       pattern="[0-9]{12}" maxlength="12" required>
            </div>

            <div class="mb-3 text-start">
                <label>Mobile Number</label>
                <input type="text" name="mobile" class="form-control"
                       placeholder="Enter 10-digit mobile"
                       pattern="[0-9]{10}" maxlength="10" required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-green">
                    Send OTP
                </button>
            </div>

        </form>

    </div>

    <!-- Register -->
    <div class="link">
        New farmer? <a href="/register">Register here</a>
    </div>

    <!-- Roles -->
    <div class="role-links">
        <a href="/talathi-login">Talathi Login</a> |
        <a href="/bank-login">Bank Login</a>
    </div>

</div>

</body>
</html>