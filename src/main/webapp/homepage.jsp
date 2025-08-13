<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vinayaka Donations</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style>
        /* Gradient Background */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #a1c4fd, #c2e9fb, #fbc2eb, #a6c1ee);
            background-size: 400% 400%;
            animation: gradientBG 12s ease infinite;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        /* Background Animation */
        @keyframes gradientBG {
            0% {background-position: 0% 50%;}
            50% {background-position: 100% 50%;}
            100% {background-position: 0% 50%;}
        }

        /* Logo */
        .logo-container {
            margin-top: 20px;
            text-align: center;
        }

        .logo-image {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            border: 3px solid white;
            object-fit: cover;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        /* Title */
        h1 {
            font-size: 28px;
            color: white;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.4);
            margin: 15px 0 5px;
        }

        p.subtitle {
            font-size: 14px;
            color: #004d40;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* Button Grid */
        .btn-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(110px, 1fr));
            gap: 15px;
            padding: 0 15px 30px;
            width: 100%;
            max-width: 400px;
        }

        /* Square Tile Buttons */
        .btn {
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 12px;
            padding: 30px 5px;
            text-align: center;
            color: #004d40;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease;
        }

        .btn i {
            font-size: 28px;
            color: #004d40;
            margin-bottom: 8px;
        }

        .btn:hover {
            background-color: #ffffff;
            transform: translateY(-4px);
            box-shadow: 0 6px 14px rgba(0, 0, 0, 0.25);
        }

        /* Mobile Friendly */
        @media (max-width: 480px) {
            .btn-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>

    <!-- Logo -->
    <div class="logo-container">
        <img src="ganesha.jpg" alt="Vinayaka Logo" class="logo-image">
    </div>

    <!-- Title -->
    <h1>Vinayaka Donations</h1>
    <p class="subtitle">Donation & Expense Management</p>

    <!-- Buttons -->
    <div class="btn-container">
        <a href="add_donation.jsp" class="btn">
            <i class="material-icons">add_circle</i>
            Add Donation
        </a>
        <a href="view_donations.jsp" class="btn">
            <i class="material-icons">list</i>
            View Donations
        </a>
        <a href="add_expense.jsp" class="btn">
            <i class="material-icons">currency_rupee</i>
            Add Expense
        </a>
        <a href="expenses_list.jsp" class="btn">
            <i class="material-icons">receipt</i>
            View Expenses
        </a>
        <a href="RemainingAmountServlet" class="btn">
            <i class="material-icons">bar_chart</i>
            View Summary
        </a>
        <a href="admin_login.jsp" class="btn">
            <i class="material-icons">admin_panel_settings</i>
            Admin Access
        </a>
    </div>

</body>
</html>