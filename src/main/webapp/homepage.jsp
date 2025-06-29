<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vinaya Donations</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #e0f7fa, #80deea, #26c6da);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h1 {
            font-size: 28px;
            margin-top: 20px;
            margin-bottom: 30px;
            text-align: center;
            color: #004d40;
            animation: fadeIn 1.5s ease-in-out;
        }

        .btn {
            width: 80%;
            max-width: 300px;
            padding: 15px;
            margin: 10px auto;
            font-size: 18px;
            background-color: #ffffff;
            border: 2px solid #004d40;
            border-radius: 10px;
            text-align: center;
            text-decoration: none;
            color: #004d40;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            display: block;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #b2ebf2;
            transform: scale(1.05);
            box-shadow: 0px 6px 14px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

    <h1>Vinaya Donations</h1>

    <a href="add_donation.jsp" class="btn">Add Donation</a>
    <a href="add_expense.jsp" class="btn">Add Expenses</a>
    <a href="view_donations.jsp" class="btn">Village Data</a>
    <a href="expenses_list.jsp" class="btn">Expenses List</a>

    <a href="total_pending.jsp" class="btn">Total Pending</a>
    <a href="admin_login.jsp" class="btn">Admin Access</a>

</body>
</html>