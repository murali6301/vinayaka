<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Access - Vinaya Donations</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to bottom right, #a1c4fd, #c2e9fb);
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h2 {
            margin-top: 30px;
            color: #2c3e50;
        }

        .container {
            padding: 20px;
            max-width: 400px;
            margin: auto;
        }

        .button {
            display: block;
            background-color: #2c3e50;
            color: white;
            padding: 15px;
            margin: 15px 0;
            border: none;
            border-radius: 10px;
            text-decoration: none;
            font-size: 18px;
            transition: 0.3s;
        }

        .button:hover {
            background-color: #34495e;
        }
    </style>
</head>
<body>

    <h2>Admin Dashboard</h2>

    <div class="container">
        <a href="update_donation.jsp" class="button">Update Donation</a>
        <a href="update_expenses.jsp" class="button">Update Expenses</a>
        <a href="user_approvals.jsp" class="button">User Approvals</a>
        <a href="remaining_amount.jsp" class="button">Remaining Amount</a>
        <a href="homepage.jsp" class="button" style="background-color: #e74c3c;">Back</a>
    </div>

</body>
</html>