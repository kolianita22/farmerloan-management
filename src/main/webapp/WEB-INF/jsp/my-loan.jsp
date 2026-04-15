<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>My Loan Applications</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fb;
            margin: 0;
        }

        
        .header {
            background-color: #0b3d91;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
        }

        /* CONTAINER */
        .container {
            width: 90%;
            margin: 30px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #0b3d91;
        }

        /* TABLE */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th {
            background-color: #0b3d91;
            color: white;
            padding: 12px;
            text-align: center;
        }

        td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* STATUS COLORS */
        .approved {
            color: green;
            font-weight: bold;
        }

        .rejected {
            color: red;
            font-weight: bold;
        }

        .pending {
            color: orange;
            font-weight: bold;
        }

        /* IMAGE */
        img {
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        /* LINKS */
        a {
            text-decoration: none;
            color: #0b3d91;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        /* NO DATA */
        .no-data {
            text-align: center;
            color: red;
            font-weight: bold;
            margin-top: 20px;
        }

    </style>
</head>

<body>

<div class="header">
     Farmer Loan Management System - Government Portal
</div>

<div class="container">

<h2>My Loan Applications</h2>

<table>
    <tr>
        <th>Crop</th>
        <th>Amount</th>
        <th>Season</th>
        <th>Status</th>
        <th>Photo</th>
        <th>Documents</th>
    </tr>

    <c:forEach var="loan" items="${loans}">
        <tr>
            <td>${loan.crop}</td>
            <td>₹ ${loan.amount}</td>
            <td>${loan.season}</td>

            <td class="
                ${loan.status == 'Approved' ? 'approved' :
                  loan.status == 'Rejected' ? 'rejected' : 'pending'}">
                ${loan.status}
            </td>

            <td>
                <img src="/view/photo/${loan.id}" width="80" height="80"/>
            </td>

            <td>
                <a href="/download/aadhaar/${loan.id}">Aadhaar</a><br>
                <a href="/download/land/${loan.id}">7/12</a>
            </td>
        </tr>
    </c:forEach>

</table>

<c:if test="${empty loans}">
    <p class="no-data">No loan applications found</p>
</c:if>

</div>

</body>
</html>