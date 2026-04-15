<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Bank Dashboard</title>

    <!-- Bootstrap + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #f4f7fb;
            font-family: 'Segoe UI';
        }

        /* SIDEBAR */
        .sidebar {
            width: 230px;
            height: 100vh;
            position: fixed;
            background: #0b3d91;
            color: white;
            padding-top: 20px;
        }

        .sidebar h4 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
        }

        .sidebar a:hover {
            background: #1565c0;
        }

        /* MAIN */
        .main {
            margin-left: 230px;
            padding: 20px;
        }

        .header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* CARDS */
        .card-box {
            padding: 20px;
            border-radius: 10px;
            color: white;
            text-align: center;
        }

        .total { background: #1565c0; }
        .approved { background: #2e7d32; }
        .pending { background: #f9a825; }
        .rejected { background: #c62828; }

        /* TABLE */
        table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background: #1565c0;
            color: white;
        }

        td, th {
            padding: 10px;
            text-align: center;
        }

        .btn-process {
            background: green;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
        }

        .btn-processed {
            background: gray;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
        }

        .status-approved { color: green; font-weight: bold; }
        .status-rejected { color: red; font-weight: bold; }
        .status-pending { color: orange; font-weight: bold; }

    </style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <h4>🏦 Bank Panel</h4>

    <a href="/bank-dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="#"><i class="bi bi-file-earmark-text"></i> Loan Requests</a>
    <a href="#"><i class="bi bi-graph-up"></i> Reports</a>
    <a href="/logout"><i class="bi bi-box-arrow-right"></i> Logout</a>
</div>

<!-- MAIN -->
<div class="main">

    <div class="header">
        Welcome Bank Officer 👋
    </div>

    <!-- 🔥 STATS -->
    <div class="row mb-4">

        <div class="col-md-3">
            <div class="card-box total">
                <h5>Total Loans</h5>
                <h2>${total}</h2>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box approved">
                <h5>Approved</h5>
                <h2>${approved}</h2>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box pending">
                <h5>Pending</h5>
                <h2>${pending}</h2>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card-box rejected">
                <h5>Rejected</h5>
                <h2>${rejected}</h2>
            </div>
        </div>

    </div>

    <!-- 🔥 TABLE -->
    <table class="table table-bordered">

        <tr>
            <th>Mobile</th>
            <th>Amount</th>
            <th>Credit Score</th>
            <th>Eligible Amount</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <c:forEach var="loan" items="${loans}">
            <tr>

                <td>${loan.mobile}</td>
                <td>₹ ${loan.amount}</td>
                <td>
    <c:if test="${loan.creditScore == 0}">
        Not Calculated
    </c:if>
    <c:if test="${loan.creditScore != 0}">
        ${loan.creditScore}
    </c:if>
</td>
                <td>₹ ${loan.eligibleAmount}</td>

                <td>
                    <c:choose>
                        <c:when test="${loan.status == 'Approved'}">
                            <span class="status-approved">Approved</span>
                        </c:when>
                        <c:when test="${loan.status == 'Rejected'}">
                            <span class="status-rejected">Rejected</span>
                        </c:when>
                        <c:otherwise>
                            <span class="status-pending">Pending</span>
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>

        <c:choose>

    <c:when test="${loan.status == 'Verified'}">
       <form action="/process-loan/${loan.id}" method="post">
    <input type="text" name="remark" placeholder="Enter Remark" required>
    <button class="btn-process">Process</button>
</form>
    </c:when>

    <c:otherwise>
        <span class="btn-processed">Processed</span>
    </c:otherwise>

</c:choose>
</td>

            </tr>
        </c:forEach>

    </table>

</div>

</body>
</html>