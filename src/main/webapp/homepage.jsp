<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vinaya Donations</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
            justify-content: center;
            min-height: 100vh;
        }

        /* Gradient Animation */
        @keyframes gradientBG {
            0% {background-position: 0% 50%;}
            50% {background-position: 100% 50%;}
            100% {background-position: 0% 50%;}
        }

        /* Logo Styling */
        .logo-container {
            margin-top: 20px;
            animation: fadeInLogo 2s ease-in-out;
        }

        .logo-image {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 3px solid white;
            object-fit: cover;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
            animation: bounce 1s ease infinite alternate;
        }

        @keyframes bounce {
            0% { transform: scale(1); }
            100% { transform: scale(1.08); }
        }

        @keyframes fadeInLogo {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Title */
        h1 {
            font-size: 32px;
            margin: 15px 0 25px;
            text-align: center;
            color: #ffffff;
            text-shadow: 1px 1px 2px #00000044;
        }

        /* Buttons */
        .btn {
            width: 80%;
            max-width: 320px;
            padding: 14px;
            margin: 10px auto;
            font-size: 18px;
            background-color: rgba(255, 255, 255, 0.85);
            border: none;
            border-radius: 12px;
            color: #004d40;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            transition: all 0.3s ease;
            display: block;
        }

        .btn:hover {
            background-color: #ffffff;
            transform: scale(1.05);
            box-shadow: 0 6px 14px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>

    <!-- Vinayaka Logo -->
    <div class="logo-container">
        <img src="ganesha.jpg" alt="Vinayaka Logo" class="logo-image">
    </div>

    <!-- Title -->
    <h1>Vinayaka Donations</h1>

    <!-- Navigation Buttons -->
    <a href="add_donation.jsp" class="btn">Add Donation</a>
    <a href="add_expense.jsp" class="btn">Add Expenses</a>
    <a href="view_donations.jsp" class="btn">Village Data</a>
    <a href="expenses_list.jsp" class="btn">Expenses List</a>
    <a href="total_pending.jsp" class="btn">Total Pending</a>
    <a href="admin_login.jsp" class="btn">Admin Access</a>

</body>
</html>