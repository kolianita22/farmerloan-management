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
         footer{
            background: #1b5e20;
            
         }
         footer a:hover {
           text-decoration: underline;
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
        The Farmer Crop Loan Management System is a centralized digital platform designed to provide hassle-free crop loans to farmers across India. Through this portal, farmers can apply for loans, upload necessary documents, track their application status, and manage EMI payments - all from one place.
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
                    <p>Get loans at competitive interest rates starting from 7% per annum with government subsidies.</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="icon">✔</div>
                    <h5>Quick Approval</h5>
                    <p>Digital verification process ensures faster loan approval within 7-10 working days</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="icon">🌱</div>
                    <h5>Flexible Repayment</h5>
                    <p>Choose repayment tenure based on your crop cycle and income pattern.</p>
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
                <p>Create account with Aadhaar and mobile number</p>
            </div>

            <div class="col-md-3">
                <div class="step">2</div>
                <h6>Upload Docs</h6>
                <p>Submit 7/12 land record for verification</p>
            </div>

            <div class="col-md-3">
                <div class="step">3</div>
                <h6>Apply Loan</h6>
                <p>Fill loan application with crop details</p>
            </div>

            <div class="col-md-3">
                <div class="step">4</div>
                <h6>Get Approval</h6>
                <p>Receive loan after verification</p>
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
            <p>The maximum loan amount varies based on land size and crop type. Generally, it ranges from ₹50,000 to ₹5,00,000.</p>
        </div>

        <div class="faq-box">
            <b>Approval time?</b><br>
          <p>After document verification by Talathi and credit assessment by bank, approval typically takes 7-10 working days.</p>
        </div>

        <div class="faq-box">
            <b>Multiple loans allowed?</b><br>
            <p>Yes, you can apply for a new loan after successfully repaying your existing loan.</p>
        </div>

    </div>
</div>
<footer class="text-white mt-5 pt-4 pb-3">
    <div class="container">

        <div class="row">

            <!-- ABOUT -->
            <div class="col-md-4">
                <h5>🌾 Farmer Loan Portal</h5>
                <p>
                    This portal helps farmers apply for crop loans easily,
                    track application status, and get government support.
                </p>
            </div>

            <!-- QUICK LINKS -->
            <div class="col-md-4">
                <h5>🔗 Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="/" class="text-white text-decoration-none">Home</a></li>
                    <li><a href="/loan" class="text-white text-decoration-none">Apply Loan</a></li>
                    <li><a href="/track-loan" class="text-white text-decoration-none">Track Status</a></li>
                    <li><a href="/login" class="text-white text-decoration-none">Login</a></li>
                </ul>
            </div>

            <!-- FEEDBACK -->
            <div class="col-md-4">
                <h5>📝 We Value Your Feedback</h5>
                <p>Help us improve our services by sharing your experience.</p>

                <form action="/submit-feedback" method="post">
                    <textarea name="feedback" class="form-control mb-2" 
                              placeholder="Write your feedback..." required></textarea>
                    <button class="btn btn-success btn-sm">
                        Submit Feedback
                    </button>
                </form>
            </div>

        </div>

        <hr style="background:white;">

        <!-- BOTTOM -->
        <div class="text-center">
            <p class="mb-0">
                © 2024 Government of India | Ministry of Agriculture & Farmers Welfare
            </p>
        </div>

    </div>
</footer>

</body>
</html>