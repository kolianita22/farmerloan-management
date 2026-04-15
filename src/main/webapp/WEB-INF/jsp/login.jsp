<!DOCTYPE html>
<html>
<head>
    <title>Farmer Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #e6f0ff, #f5f5f5);
            font-family: Arial, sans-serif;
        }

        /* Header */
        .header {
            background-color: #0b3d91;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
        }

        /* Login Box */
        .login-box {
            width: 420px;
            margin: 70px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0,0,0,0.2);
        }

        h2 {
            color: #0b3d91;
            font-weight: bold;
        }

        label {
            font-weight: 600;
        }

        /* Button */
        .btn-custom {
            background-color: #0b3d91;
            color: white;
            font-weight: bold;
        }

        .btn-custom:hover {
            background-color: #072c6b;
        }

        /* Footer */
        .footer {
            text-align: center;
            margin-top: 30px;
            padding: 10px;
            color: gray;
        }
    </style>
</head>
<body>

<div class="header">
     Farmer Crop Loan Portal - Government of India
</div>

<div class="login-box">

    <h2 class="text-center mb-4">Farmer Login</h2>

    <form action="send-otp" method="post">

        <div class="mb-3">
            <label>Full Name</label>
            <input type="text" name="name" class="form-control" placeholder="Enter your name" required>
        </div>

        <div class="mb-3">
            <label>Mobile Number</label>
            <input type="text" name="mobile" class="form-control"
                   placeholder="Enter 10-digit mobile"
                   pattern="[0-9]{10}" maxlength="10" required>
        </div>

        <div class="mb-3">
            <label>Aadhaar Number</label>
            <input type="text" name="aadhaar" class="form-control"
                   placeholder="Enter 12-digit Aadhaar"
                   pattern="[0-9]{12}" maxlength="12" required>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-custom">Send OTP</button>
        </div>

    </form>

</div>

<div class="footer">
    © 2026 Government of India | Digital Agriculture Mission
</div>

</body>
</html>