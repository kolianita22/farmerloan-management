<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Apply Crop Loan</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fb;
            margin: 0;
        }

        /* Header */
        .header {
            background-color: #0b3d91;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
        }

        /* Container */
        .container {
            width: 50%;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #0b3d91;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="file"] {
            padding: 5px;
        }

        /* Button */
        button {
            width: 100%;
            background-color: #0b3d91;
            color: white;
            padding: 12px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #072c6b;
        }

        /* Footer */
        .footer {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            color: gray;
        }
    </style>
</head>

<body>

<div class="header">
     Farmer Crop Loan Portal - Government Scheme
</div>

<div class="container">

    <h2>Apply Crop Loan</h2>

    <form action="applyLoan" method="post" enctype="multipart/form-data">

        <label>Mobile Number</label>
        <input type="text" name="mobile" required>

        <label>Crop</label>
        <select name="crop">
            <option>Wheat</option>
            <option>Rice</option>
            <option>Cotton</option>
        </select>

        <label>Loan Amount</label>
        <input type="number" name="amount" required>

        <label>Season</label>
        <select name="season">
            <option>Kharif</option>
            <option>Rabi</option>
        </select>
        <div class="mb-3">
   

        <label>Annual Income</label>
          <input type="number" name="income" class="form-control" required>
        </div>

      <div class="mb-3">
        <label>Land Size</label>
        <input type="number" step="0.1" name="landSize" class="form-control" required>
      </div>

       <div class="mb-3">
    <label>Previous Loan Taken?</label>
    <select name="hasPreviousLoan" class="form-control">
        <option value="true">Yes</option>
        <option value="false">No</option>
    </select>
    </div>

        <label>Aadhaar Document (PDF only)</label>
        <input type="file" name="aadhaarFile" accept="application/pdf" required>

        <label>7/12 Land Document (PDF only)</label>
        <input type="file" name="landFile" accept="application/pdf" required>

        <label>BankPass Book Document (PDF only</label>
        <input type="file" name="bankFile" accept="application/pdf" required>

        <button type="submit">Apply Loan</button>

    </form>

</div>

<div class="footer">
    © 2026 Government of India | Agriculture Department
</div>

</body>
</html>