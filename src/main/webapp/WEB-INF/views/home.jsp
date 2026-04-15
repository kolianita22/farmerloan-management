<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Farmer Loan Portal</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f7fb;
        }

        /* TOP BAR */
        .top-bar {
            background: #0b3d91;
            color: white;
            padding: 8px;
            text-align: center;
            font-size: 14px;
        }

        /* NAVBAR */
        .navbar {
            background: white;
            border-bottom: 2px solid #ddd;
        }

        .navbar-brand {
            font-weight: bold;
            color: #0b3d91;
        }

        /* 🔥 MOVING BANNER */
        .news-ticker {
            background: #ffcc00;
            overflow: hidden;
            white-space: nowrap;
        }

        .ticker-move {
            display: inline-block;
            padding-left: 100%;
            animation: scroll 25s linear infinite;
        }

        .ticker-move span {
            margin-right: 40px;
            font-weight: bold;
        }

        @keyframes scroll {
            0% { transform: translateX(0); }
            100% { transform: translateX(-100%); }
        }

        /* CAROUSEL */
        .carousel img {
            height: 420px;
            object-fit: cover;
        }

        .carousel-caption {
            background: rgba(0,0,0,0.6);
            padding: 15px;
            border-radius: 10px;
        }

        .carousel-caption h2 {
            font-size: 28px;
        }

        /* BUTTON */
        .btn-main {
            margin-top: 10px;
        }

        /* FEATURES */
        .feature-box {
            padding: 25px;
            border-radius: 10px;
            background: white;
            box-shadow: 0px 2px 10px rgba(0,0,0,0.1);
            transition: 0.3s;
        }
        

        .feature-box:hover {
            transform: translateY(-5px);
        }

        /* IMAGE SECTION */
        .image-section img {
            width: 100%;
            border-radius: 10px;
        }

        /* FOOTER */
        .footer {
            background: #0b3d91;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
        }
    </style>
</head>

<body>

<!-- TOP BAR -->
<div class="top-bar">
     Government of India | Agriculture Department
</div>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand"> Farmer Loan Portal</a>
        <a href="/login" class="btn btn-primary">Login</a>
    </div>
</nav>

<!-- 🔥 MOVING TEXT -->
<div class="news-ticker">
    <div class="ticker-move">
        <span> PM-Kisan Scheme Applications Open</span>
        <span>Apply for Crop Loan Easily</span>
        <span>Government Subsidy Available</span>
        <span>Upload Aadhaar & 7/12 Documents</span>
        <span>Track Loan Status Online</span>
        
    </div>
</div>

<!-- 🔥 CAROUSEL -->
<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">

    <div class="carousel-indicators">
        <button data-bs-target="" data-bs-slide-to="0" class="active"></button>
        <button data-bs-target="#carouselExample" data-bs-slide-to="1"></button>
        <button data-bs-target="#carouselExample" data-bs-slide-to="2"></button>
    </div>

    <div class="carousel-inner">

        <!-- Slide 1 -->
        <div class="carousel-item active">
            <img src="/images/home.png" class="d-block w-100">
            <div class="carousel-caption">
                <h2>Empowering Farmers Digitally</h2>
                <p>Apply & Track Loans Easily</p>
                <a href="/login" class="btn btn-success btn-main">Apply Now</a>
            </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item">
            <img src="/images/talthi.png" class="d-block w-100">
            <div class="carousel-caption">
                <h2>Government Support for Farmers</h2>
                <p>Easy Access to Crop Loans</p>
                <a href="/login" class="btn btn-success btn-main">Apply Loan</a>
            </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item">
            <img src="/images/bank.png" class="d-block w-100">
            <div class="carousel-caption">
                <h2>Fast Loan Approval</h2>
                <p>Track Status Anytime</p>
                <a href="/track-loan" class="btn btn-success btn-main">Track Loan</a>
            </div>
        </div>
       
    </div>
</div>
<!-- 🌾 SCHEME DETAILS SECTION -->
<div class="container mt-5">
    
    <div class="text-center mb-4">
        <h2 style="font-weight:bold;">Crop Loan Scheme Details</h2>
        <p style="max-width:800px; margin:auto; color:#555;">
            The Farmer Crop Loan Portal is an initiative by the Government of India 
            to provide financial assistance to farmers for agricultural needs. 
            Farmers can apply online, upload documents, and track their loan status easily.
        </p>
    </div>

    <!-- FEATURES LIST -->
    <div class="row justify-content-center">
        <div class="col-md-8">
            <ul style="font-size:16px; line-height:30px;">
                <li>Easy online loan application</li>
                <li>Talathi verification for land records</li>
                <li>Bank eligibility & credit score check</li>
                <li>Direct benefit transfer to bank account</li>
                <li>SMS alerts and real-time tracking</li>
            </ul>
        </div>
    </div>

    <!-- CARDS -->
    <div class="row mt-4 text-center">

        <div class="col-md-4 mb-3">
            <div class="feature-box">
                <h4>Apply Loan</h4>
                <p>Quick and easy crop loan application</p>
                <a href="/login" class="btn btn-success">Apply Now</a>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="feature-box">
                <h4>Track Status</h4>
                <p>Real-time loan tracking system</p>
                <a href="/track-loan" class="btn btn-primary">Track Loan</a>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="feature-box">
                <h4>Govt Schemes</h4>
                <p>Access agriculture schemes & benefits</p>
                <a href="#" class="btn btn-warning">View Schemes</a>
            </div>
        </div>

    </div>

</div>

<!-- IMAGE SECTION -->
<div class="container mt-5 text-center image-section">
    <h3>Digital Farmer Services</h3>
    <img src="/images/home.png" class="shadow mt-3">
</div>

<!-- FOOTER -->
<div class="footer">
    © 2026 Government of India | Farmer Loan Portal
</div>

<!-- Bootstrap JS (IMPORTANT) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>