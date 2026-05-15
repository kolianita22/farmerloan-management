<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Talathi Dashboard</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
        }

        /* Navbar */
        .navbar {
            background-color: #1b5e20;
        }

        .navbar-brand {
            color: white;
            font-weight: bold;
        }

        .navbar .btn {
            background: white;
            color: #1b5e20;
        }

        /* Cards */
        .card {
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        /* Table */
        .table {
            background: white;
            border-radius: 10px;
        }
    </style>
</head>

<body>

<!-- 🔹 NAVBAR -->
<nav class="navbar navbar-expand-lg px-4">
    <span class="navbar-brand">🌱 Kisan Rin Yojana</span>

    <div class="ms-auto">
        <span class="text-white me-3">Talathi</span>
        <a href="/logout" class="btn btn-sm">Logout</a>
    </div>
</nav>

<div class="container mt-4">

    <!-- 🔹 TITLE -->
    <h3 class="mb-3">Talathi Dashboard</h3>
    <p class="text-muted">Verify farmer land records for loan applications</p>

    
    <!-- 🔹 TABLE -->
    <div class="card p-3">

        <h5 class="mb-3">Pending Document Verifications</h5>

        <table class="table table-hover text-center">

            <thead class="table-success">
            <tr>
                <th>Mobile</th>
                <th>Crop</th>
                <th>Amount</th>
                <th>Season</th>
                <th>Status</th>
                <th>Documents</th>
                <th>Action</th>
                <th>Details</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach var="loan" items="${loans}">
                <tr>

                    <td>${loan.mobile}</td>
                    <td>${loan.crop}</td>
                    <td>₹ ${loan.amount}</td>
                    <td>${loan.season}</td>

                    <!-- STATUS -->
                    <td>
                        <c:choose>
                            <c:when test="${loan.status == 'Approved'}">
                                <span class="badge bg-success">Approved</span>
                            </c:when>
                            <c:when test="${loan.status == 'Rejected'}">
                                <span class="badge bg-danger">Rejected</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-warning text-dark">Pending</span>
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <!-- DOCUMENTS -->
                    <td>
                        <a class="btn btn-outline-primary btn-sm" href="/download/aadhaar/${loan.id}">Aadhaar</a><br><br>
                        <a class="btn btn-outline-primary btn-sm" href="/download/land/${loan.id}">7/12</a><br><br>
                        <a class="btn btn-outline-primary btn-sm" href="/view/photo/${loan.id}">Photo</a>
                    </td>

                    <!-- ACTION -->
                    <td>

                        <a class="btn btn-success btn-sm" href="/verify/${loan.id}">Verify</a>

                        <br><br>

                        <form action="/reject/${loan.id}" method="post">
                            <input type="text" name="reason" class="form-control form-control-sm"
                                   placeholder="Reason" required>
                            <br>
                            <button class="btn btn-danger btn-sm">Reject</button>
                        </form>

                    </td>

                    <!-- DETAILS -->
                    <td>
                        <a class="btn btn-info btn-sm" href="/loan-details/${loan.id}">
                            View
                        </a>
                    </td>

                </tr>
            </c:forEach>

            </tbody>

        </table>

        <!-- EMPTY -->
        <c:if test="${empty loans}">
            <div class="text-center p-4">
                <h5>No Pending Verifications</h5>
                <p class="text-muted">All documents have been verified</p>
            </div>
        </c:if>

    </div>

</div>

</body>
</html>