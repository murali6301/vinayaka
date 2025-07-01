<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Remaining Amount</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            margin: 0;
            padding: 20px;
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom right, #dbeafe, #f0fdf4);
        }

        h1 {
            text-align: center;
            color: #111827;
            margin-bottom: 30px;
        }

        .box {
            background-color: #ffffff;
            padding: 20px;
            margin: 10px auto;
            border-radius: 16px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
            width: 90%;
            max-width: 400px;
            text-align: center;
        }

        .box h2 {
            color: #1e293b;
            margin-bottom: 10px;
            font-size: 18px;
        }

        .box p {
            font-size: 22px;
            color: #047857;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Remaining Amount</h1>
<form action="AddExpenseServlet" method="post">
    <div class="box">
        <h2>Donations Paid Amount</h2>
        <p>₹ ${paid}</p>
    </div>

    <div class="box">
        <h2>Donations Pending Amount</h2>
        <p>₹ ${pending}</p>
    </div>

    <div class="box">
            <h2>Expenses Paid Amount</h2>
            <p>₹ ${paidexpense}</p>
    </div>

    <div class="box">
            <h2>Expenses Pending Amount</h2>
            <p>₹ ${pendingexpense}</p>
    </div>

    <div class="box">
            <h2>Current Balance</h2>
            <p>₹ ${pendingbal}</p>
    </div>

    </form>
</body>
</html>