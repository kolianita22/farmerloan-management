<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Loan Details</title>
    <meta charset="UTF-8">

    <!-- Bootstrap + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #f1f5f9;
            font-family: 'Segoe UI';
        }

        .header {
            background: #0b3d91;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
        }

        .card-box {
            background: white;
            padding: 25px;
            border-radius: 10px;
            margin-top: 25px;
            box-shadow: 0px 2px 10px rgba(0,0,0,0.1);
        }

        .section-title {
            border-left: 5px solid #0b3d91;
            padding-left: 10px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 5px;
            color: white;
        }

        .approved { background: green; }
        .rejected { background: red; }
        .pending { background: orange; }

        .btn {
            margin: 5px;
        }

        /* PRINT STYLE */
        @media print {
            body {
                background: white;
            }

            .header, .btn {
                display: none;
            }

            .card-box {
                box-shadow: none;
                border: 1px solid black;
            }

            .section-title {
                border-left: none;
                text-decoration: underline;
            }
        }
    </style>
</head>

<body>

<div class="header">
    Farmer Loan Application Details
</div>

<div class="container">

    <div class="card-box">

        <!-- PRINT BUTTON -->
        <div class="text-end mb-3">
            <button onclick="window.print()" class="btn btn-dark">
                Print Form
            </button>
        </div>

        <!-- STATUS -->
        <div class="text-end">
            <c:choose>
                <c:when test="${loan.status == 'Approved'}">
                    <span class="status-badge approved">Approved</span>
                </c:when>
                <c:when test="${loan.status == 'Rejected'}">
                    <span class="status-badge rejected">Rejected</span>
                </c:when>
                <c:otherwise>
                    <span class="status-badge pending">Pending</span>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- GOVT HEADER -->
        <div class="text-center mb-3">
            
            <h4>Government of India</h4>
            <h5>Farmer Crop Loan Application</h5>
        </div>

        <hr>

        <!-- FARMER DETAILS -->
        <h5 class="section-title">Farmer Details</h5>
        <p><b>Mobile:</b> ${loan.mobile}</p>
        <p><b>Crop:</b> ${loan.crop}</p>
        <p><b>Season:</b> ${loan.season}</p>
        <p><b>Land Size:</b> ${loan.landSize} acres</p>
        <p><b>Annual Income:</b> ${loan.income}</p>

        <hr>

        <!-- LOAN DETAILS -->
        <h5 class="section-title">Loan Information</h5>
        <p><b>Requested Amount:</b> ${loan.amount}</p>
        <p><b>Eligible Amount:</b> ${loan.eligibleAmount}</p>
        <p><b>Credit Score:</b> ${loan.creditScore}</p>
        <p><b>Status:</b> ${loan.status}</p>

        <hr>

        <!-- DOCUMENTS -->
        <h5 class="section-title">📄 Documents Submitted</h5>
        <ul>
            <li>Aadhaar Card</li>
            <li>7/12 Land Record</li>
            <li>Farmer Photo</li>
        </ul>

        <!-- VIEW LINKS (hidden in print) -->
        <div>
            <a href="/download/aadhaar/${loan.id}" class="btn btn-primary">
                <i class="bi bi-file-earmark"></i> Aadhaar
            </a>

            <a href="/download/land/${loan.id}" class="btn btn-primary">
                <i class="bi bi-file-earmark"></i> 7/12
            </a>

            <a href="/view/photo/${loan.id}" class="btn btn-primary">
                <i class="bi bi-image"></i> Photo
            </a>
        </div>

        <hr>

        <!-- SIGNATURE SECTION -->
        <h5 class="section-title">Verification</h5>

        <p>Farmer Signature: __________________________</p><br>
        <p>Talathi Signature: __________________________</p><br>
        <p>Bank Officer Signature: _____________________</p><br>
        <p>Date: __________________________</p>

        <hr>

        <!-- ACTION BUTTONS -->
        <c:if test="${loan.status == 'Pending'}">

            <a href="/verify/${loan.id}" class="btn btn-success">
                <i class="bi bi-check-circle"></i> Verify
            </a>

            <form action="/reject/${loan.id}" method="post" style="max-width:300px;">
                <input type="text" name="reason" placeholder="Reject Reason"
                       required class="form-control mb-2">
                <button class="btn btn-danger">
                    <i class="bi bi-x-circle"></i> Reject
                </button>
            </form>

        </c:if>

        <c:if test="${loan.status != 'Pending'}">
            <button class="btn btn-secondary" disabled>Already Processed</button>
        </c:if>

    </div>

</div>

</body>
</html>