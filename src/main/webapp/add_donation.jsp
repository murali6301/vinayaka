<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Donation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
        }

        h2 {
            margin-top: 40px;
            margin-bottom: 20px;
        }

        form {
            width: 90%;
            max-width: 400px;
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input, select, button {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
        }

        button {
            margin-top: 20px;
            background-color: #28a745;
            color: white;
            border: none;
        }

        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <h2>Add Donation</h2>

    <form action="save_donation.jsp" method="post">
        <label for="fullname">Full Name</label>
        <input type="text" id="name" name="name" required>

        <label for="amount">Amount</label>
        <input type="number" id="amount" name="amount" required>

        <label for="status">Status</label>
        <select id="status" name="status">
            <option value="approved">Approved</option>
            <option value="pending">Pending</option>
        </select>

        <button type="submit">Submit Donation</button>
    </form>

</body>
</html>