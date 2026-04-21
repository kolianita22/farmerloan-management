<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>

    <!-- Bootstrap + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f1f5f9;
        }

        /* SIDEBAR */
        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            background: linear-gradient(180deg, #0f172a, #1e3a8a);
            color: white;
            padding-top: 20px;
        }

        .sidebar h4 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: bold;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: rgba(255,255,255,0.15);
            padding-left: 25px;
        }

        /* MAIN */
        .main {
            margin-left: 250px;
            padding: 20px;
        }

        /* TOPBAR */
        .topbar {
            background: white;
            padding: 12px 20px;
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 2px 10px rgba(0,0,0,0.08);
        }

        /* CARDS */
        .card-box {
            padding: 20px;
            border-radius: 15px;
            color: white;
            text-align: center;
            transition: 0.3s;
        }

        .card-box:hover {
            transform: translateY(-5px);
        }

        .card-box i {
            font-size: 30px;
            margin-bottom: 10px;
        }
         .total { background: linear-gradient(135deg, #3b82f6, #1d4ed8); }
        .approved { background: linear-gradient(135deg, #22c55e, #15803d); }
        .pending { background: linear-gradient(135deg, #f59e0b, #b45309); }
        .rejected { background: linear-gradient(135deg, #ef4444, #991b1b); }

        /* TABLE */
        .table-box {
            background: white;
            margin-top: 25px;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0px 2px 10px rgba(0,0,0,0.08);
        }

        th {
            background: #1e3a8a;
            color: white;
        }

        td, th {
            text-align: center;
            vertical-align: middle;
        }

        /* STATUS */
        .badge-approved { background: #22c55e; }
        .badge-pending { background: #f59e0b; }
        .badge-rejected { background: #ef4444; }

    </style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <h4>🌾 Loan Portal</h4>

    <a href="/dashboard"><i class="bi bi-house"></i> Dashboard</a>
    <a href="/loan"><i class="bi bi-file-earmark-plus"></i> Apply Loan</a>
    <a href="/myLoan?mobile=${mobile}"><i class="bi bi-list"></i> My Loans</a>
    <a href="/track-loan"><i class="bi bi-graph-up"></i> Track Loan</a>

    <c:if test="${role == 'BANK'}">
        <a href="/bank-dashboard"><i class="bi bi-bank"></i> Bank Panel</a>
    </c:if>

    <a href="/logout"><i class="bi bi-box-arrow-right"></i> Logout</a>
</div>

<!-- MAIN -->
<div class="main">

    <!-- TOPBAR -->
    <div class="topbar">
        <h5>Welcome, ${user}</h5>
        <span class="text-muted">Farmer Loan Management System</span>
    </div>

    <!-- STATS -->
    <div class="row mt-4">

        <div class="col-md-3">
            <div class="card-box total">
                <i class="bi bi-collection"></i>
                <h6>Total Loans</h6>
                <h3>${total}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box approved">
                <i class="bi bi-check-circle"></i>
                <h6>Approved</h6>
                <h3>${approved}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box pending">
                <i class="bi bi-hourglass-split"></i>
                <h6>Pending</h6>
                <h3>${pending}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box rejected">
                <i class="bi bi-x-circle"></i>
                <h6>Rejected</h6>
                <h3>${rejected}</h3>
            </div>
        </div>

    </div>

    <!-- TABLE -->
    <div class="table-box">

        <h5 class="mb-3">📄 Loan Applications</h5>

        <table class="table table-hover">

            <thead>
                <tr>
                    <th>Mobile</th>
                    <th>Crop</th>
                    <th>Amount</th>
                    <th>Status</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="loan" items="${loans}">
                    <tr>
                        <td>${loan.mobile}</td>
                        <td>${loan.crop}</td>
                        <td>₹ ${loan.amount}</td>

                        <td>
                            <c:choose>
                                <c:when test="${loan.status == 'Approved'}">
                                    <span class="badge badge-approved">Approved</span>
                                </c:when>
                                <c:when test="${loan.status == 'Rejected'}">
                                    <span class="badge badge-rejected">Rejected</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge badge-pending">Pending</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>

    </div>

</div>

</body>
</html>