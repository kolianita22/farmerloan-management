<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Farmer Loan System</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI';
        }

        /* NAVBAR */
        .navbar {
            background: white;
            padding: 10px 30px;
        }

        .navbar-brand {
            font-weight: bold;
            color: #1b5e20;
        }

        .btn-register {
            background: #1b5e20;
            color: white;
        }

        /* HERO */
        .hero {
            height: 90vh;
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                        url('https://images.unsplash.com/photo-1500382017468-9049fed747ef');
            background-size: cover;
            background-position: center;
            color: white;
            display: flex;
            align-items: center;
            text-align: center;
        }

        .hero h1 {
            font-size: 50px;
            font-weight: bold;
        }

        .hero p {
            font-size: 18px;
        }

        /* SECTIONS */
        .section {
            padding: 60px 0;
            text-align: center;
        }

        .section-title {
            color: #1b5e20;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* CARDS */
        .card {
            border-radius: 10px;
            padding: 20px;
        }

        .icon {
            font-size: 30px;
            color: #1b5e20;
        }

        /* STEPS */
        .step {
            background: #1b5e20;
            color: white;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            line-height: 60px;
            font-size: 20px;
            margin: auto;
        }

        .faq-box {
            background: #f1f5f9;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 10px;
            text-align: left;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar d-flex justify-content-between">
    <h4 class="navbar-brand">🌱 Kisan Rin Yojana</h4>

    <div>
        <a href="/login" class="btn btn-outline-success">Login</a>
        <a href="/register" class="btn btn-register">Register</a>
    </div>
</nav>

<!-- HERO -->
<div class="hero">
    <div class="container">
        <h1>Farmer Crop Loan Management System</h1>
        <p>Empowering Indian farmers with easy access to crop loans</p>

        <a href="/login" class="btn btn-success m-2">Login with OTP</a>
        <a href="/register" class="btn btn-light m-2">New Registration</a>
    </div>
</div>

<!-- ABOUT -->
<div class="section">
    <h2 class="section-title">About the Scheme</h2>
    <p class="container">
        The Farmer Crop Loan Management System is a digital platform designed to provide hassle-free
        crop loans. Farmers can apply, upload documents, and track status easily.
    </p>
</div>

<!-- BENEFITS -->
<div class="section bg-light">
    <h2 class="section-title">Key Benefits</h2>

    <div class="container">
        <div class="row">

            <div class="col-md-4">
                <div class="card">
                    <div class="icon">💰</div>
                    <h5>Low Interest Rates</h5>
                    <p>Loans starting from 7% with subsidies</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="icon">✔</div>
                    <h5>Quick Approval</h5>
                    <p>Approval within 7-10 days</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="icon">🌱</div>
                    <h5>Flexible Repayment</h5>
                    <p>Based on crop cycle</p>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- ELIGIBILITY -->
<div class="section">
    <h2 class="section-title">Eligibility Criteria</h2>

    <ul class="list-unstyled">
        <li>✔ Must be Indian citizen</li>
        <li>✔ Valid Aadhaar</li>
        <li>✔ Own agricultural land</li>
    </ul>
</div>

<!-- PROCESS -->
<div class="section bg-light">
    <h2 class="section-title">Application Process</h2>

    <div class="container">
        <div class="row">

            <div class="col-md-3">
                <div class="step">1</div>
                <h6>Register</h6>
            </div>

            <div class="col-md-3">
                <div class="step">2</div>
                <h6>Upload Docs</h6>
            </div>

            <div class="col-md-3">
                <div class="step">3</div>
                <h6>Apply Loan</h6>
            </div>

            <div class="col-md-3">
                <div class="step">4</div>
                <h6>Get Approval</h6>
            </div>

        </div>
    </div>
</div>

<!-- DOCUMENTS -->
<div class="section">
    <h2 class="section-title">Documents Required</h2>

    <p>📄 Aadhaar Card | 📄 7/12 Land Record | 📸 Photo</p>
</div>

<!-- FAQ -->
<div class="section bg-light">
    <h2 class="section-title">Frequently Asked Questions</h2>

    <div class="container">

        <div class="faq-box">
            <b>What is max loan amount?</b><br>
            ₹50,000 to ₹5,00,000
        </div>

        <div class="faq-box">
            <b>Approval time?</b><br>
            7–10 working days
        </div>

        <div class="faq-box">
            <b>Multiple loans allowed?</b><br>
            Yes, after repayment
        </div>

    </div>
</div>

</body>
</html>