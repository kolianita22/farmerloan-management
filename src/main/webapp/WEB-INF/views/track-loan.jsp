<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Track Loan</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f4f7fb;
            font-family: 'Segoe UI', sans-serif;
        }

        .card-box {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }

        .step {
            width: 25%;
            text-align: center;
            font-size: 13px;
        }

        .active {
            color: green;
            font-weight: bold;
        }

        .progress {
            height: 20px;
        }
    </style>
</head>

<body>

<div class="container mt-5">

    <!-- 🔍 TRACK FORM -->
    <div class="card-box mb-4">
        <h3 class="text-center mb-3">Track Your Loan</h3>

        <form method="post" action="/track-loan">
            <input type="text" name="mobile" class="form-control mb-3" placeholder="Enter Mobile Number" required>
            <button class="btn btn-primary w-100">Track Loan</button>
        </form>
    </div>

    <!-- 📊 RESULT -->
    <c:if test="${not empty loans}">
        <c:forEach var="loan" items="${loans}">

            <div class="card-box mb-4">

                <h5>Loan Details</h5>
                <p><b>Mobile:</b> ${loan.mobile}</p>
                <p><b>Amount:</b> ₹${loan.amount}</p>
                <p><b>Status:</b> ${loan.status}</p>

                <!-- 🔥 STATUS STEPS -->
                <div class="d-flex justify-content-between mt-4">

                    <div class="step active">Applied</div>

                    <div class="step 
                        ${loan.status == 'Verified' || loan.status == 'Approved' ? 'active' : ''}">
                        Verified
                    </div>

                    <div class="step 
                        ${loan.status == 'Approved' ? 'active' : ''}">
                        Approved
                    </div>

                    <div class="step 
                        ${loan.status == 'Approved' ? 'active' : ''}">
                        Completed
                    </div>

                </div>

                <!-- 🔥 PROGRESS BAR -->
                <div class="progress mt-3">

                    <div class="progress-bar bg-success"
                        style="width:
                        <c:choose>
                            <c:when test="${loan.status == 'Pending'}">25%</c:when>
                            <c:when test="${loan.status == 'Verified'}">60%</c:when>
                            <c:when test="${loan.status == 'Approved'}">100%</c:when>
                            <c:otherwise>10%</c:otherwise>
                        </c:choose>">
                    </div>

                </div>

            </div>

        </c:forEach>
    </c:if>

    <!-- ❌ NO DATA -->
    <c:if test="${empty loans}">
        <h5 class="text-center text-danger">Enter mobile number to track loan</h5>
    </c:if>

</div>

</body>
</html>