<!DOCTYPE html>
<html>
<head>
    <title>Verify OTP</title>

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

        /* Card */
        .otp-box {
            width: 400px;
            margin: 80px auto;
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
    OTP Verification - Farmer Portal
</div>


<div class="otp-box">

    <h2 class="text-center mb-4">Verify OTP</h2>

    <form action="verify-otp" method="post">

        <!-- Hidden Fields -->
        <input type="hidden" name="name" value="${name}">
        <input type="hidden" name="mobile" value="${mobile}">
        <input type="hidden" name="aadhaar" value="${aadhaar}">

        <div class="mb-3">
            <label>Enter OTP</label>
            <input type="text" name="otp" class="form-control"
                   placeholder="Enter 6-digit OTP"
                   pattern="[0-9]{6}" maxlength="6" required>
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-custom">Verify OTP</button>
        </div>

    </form>

</div>

<div class="footer">
    © 2026 Government of India | Secure Login
</div>

</body>
</html>