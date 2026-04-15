<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Talathi Dashboard</title>

    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #eef2f7;
            margin: 0;
        }

        .header {
            background: #1b5e20;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 22px;
        }

        .container {
            width: 95%;
            margin: 20px auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        th {
            background: #2e7d32;
            color: white;
            padding: 10px;
        }

        td {
            padding: 10px;
            text-align: center;
        }

        tr:hover {
            background: #f1f8e9;
        }

        .btn {
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 12px;
            color: white;
        }

        .verify { background: green; }
        .reject { background: red; }
        .view { background: blue; }

        .approved { color: green; font-weight: bold; }
        .rejected { color: red; font-weight: bold; }
        .pending { color: orange; font-weight: bold; }
    </style>
</head>

<body>

<div class="header">
    Talathi Verification Dashboard
</div>

<div class="container">


<table border="1">
<tr>
    <th>Mobile</th>
    <th>Crop</th>
    <th>Amount</th>
    <th>Season</th>
    <th>Status</th>
    <th>Documents</th>
    <th>Action</th>
</tr>

<c:forEach var="loan" items="${loans}">
<tr>
    <td>${loan.mobile}</td>
    <td>${loan.crop}</td>
    <td>₹ ${loan.amount}</td>
    <td>${loan.season}</td>

    
    <!-- ✅ DOCUMENTS -->
    <td>
        <a class="btn view" href="/download/aadhaar/${loan.id}">Aadhaar</a><br><br>
        <a class="btn view" href="/download/land/${loan.id}">7/12</a><br><br>
        <a class="btn view" href="/view/photo/${loan.id}">Photo</a>
    </td>

    <!-- ✅ ACTION -->
    <td>

        <!-- Verify -->
        <a class="btn verify" href="/verify/${loan.id}">Verify</a>

        <br><br>

        <!-- Reject with reason -->
        <form action="/reject/${loan.id}" method="post">
            <input type="text" name="reason" placeholder="Reason" required style="width:100px;">
            <br><br>
            <button class="btn reject" type="submit">Reject</button>
        </form>

    </td>
    <td>
    <a class="btn view" href="/loan-details/${loan.id}">
    View Full Form
</a></td>

</tr>

</c:forEach>

</table>

<c:if test="${empty loans}">
    <h3 style="text-align:center;">No Pending Loans</h3>
</c:if>

</div>

</body>
</html>