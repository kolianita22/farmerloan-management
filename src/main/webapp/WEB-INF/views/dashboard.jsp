<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
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
            background: #f4f7fb;
        }

        /* SIDEBAR */
        .sidebar {
            width: 240px;
            height: 100vh;
            position: fixed;
            background: linear-gradient(180deg, #0b3d91, #1565c0);
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
            background: rgba(255,255,255,0.2);
            padding-left: 25px;
        }

        /* MAIN */
        .main {
            margin-left: 240px;
            padding: 20px;
        }

        /* TOP NAV */
        .topbar {
            background: white;
            padding: 10px 20px;
            border-radius: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
        }

        /* CARDS */
        .card-box {
            padding: 20px;
            border-radius: 12px;
            color: white;
            text-align: center;
            box-shadow: 0px 3px 10px rgba(0,0,0,0.1);
        }

        .total { background: #1565c0; }
        .approved { background: #2e7d32; }
        .pending { background: #f9a825; }
        .rejected { background: #c62828; }

        .card-box h3 {
            margin: 0;
            font-size: 28px;
        }

        /* TABLE */
        .table-box {
            background: white;
            margin-top: 25px;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
        }

        th {
            background: #1565c0;
            color: white;
        }

        td, th {
            text-align: center;
            vertical-align: middle;
        }

        /* STATUS COLORS */
        .approved-text { color: green; font-weight: bold; }
        .pending-text { color: orange; font-weight: bold; }
        .rejected-text { color: red; font-weight: bold; }

    </style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <h4> Loan Portal</h4>

    <a href="/dashboard"><i class="bi bi-house"></i> Dashboard</a>
    <a href="/loan"><i class="bi bi-file-earmark-plus"></i> Apply Loan</a>
    <a href="/myLoan?mobile=${mobile}"><i class="bi bi-list"></i> My Loans</a>
    <a href="/talathi-dashboard"><i class="bi bi-check2-square"></i> Verify Loans</a>

    <c:if test="${role == 'BANK'}">
        <a href="/bank-dashboard"><i class="bi bi-bank"></i> Bank Panel</a>
    </c:if>

    <a href="/logout"><i class="bi bi-box-arrow-right"></i> Logout</a>
</div>

<!-- MAIN -->
<div class="main">

    <!-- TOP BAR -->
    <div class="topbar">
        <h5>Welcome, ${user}</h5>
        <span>Government Loan System</span>
    </div>

    <!-- STATS -->
    <div class="row mt-4 text-center">

        <div class="col-md-3">
            <div class="card-box total">
                <h6>Total</h6>
                <h3>${total}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box approved">
                <h6>Approved</h6>
                <h3>${approved}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box pending">
                <h6>Pending</h6>
                <h3>${pending}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box rejected">
                <h6>Rejected</h6>
                <h3>${rejected}</h3>
            </div>
        </div>

    </div>

    <!-- TABLE -->
    <div class="table-box">

        <h5 class="mb-3">Loan Applications</h5>

        <table class="table table-bordered">
            <tr>
                <th>Mobile</th>
                <th>Crop</th>
                <th>Amount</th>
                <th>Status</th>
            </tr>

            <c:forEach var="loan" items="${loans}">
                <tr>
                    <td>${loan.mobile}</td>
                    <td>${loan.crop}</td>
                    <td>${loan.amount}</td>

                    <td>
                        <c:choose>
                            <c:when test="${loan.status == 'Approved'}">
                                <span class="approved-text">Approved</span>
                            </c:when>
                            <c:when test="${loan.status == 'Rejected'}">
                                <span class="rejected-text">Rejected</span>
                            </c:when>
                            <c:otherwise>
                                <span class="pending-text">Pending</span>
                            </c:otherwise>
                        </c:choose>
                    </td>

                </tr>
            </c:forEach>
        </table>

    </div>

</div>

</body>
</html>