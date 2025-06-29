<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Expense</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .container {
            width: 90%;
            max-width: 400px;
            background-color: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            margin-top: 15px;
            display: block;
        }

        input, select, button {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
        }

        button {
            background-color: #007bff;
            color: white;
            border: none;
        }

        button:hover {
            background-color: #0069d9;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Add Expense</h2>

        <form action="AddExpenseServlet" method="post">
            <label for="product">Product Name</label>
            <input type="text" id="product" name="productName" required>

            <label for="fullamount">Total Amount</label>
            <input type="number" id="totalamount" name="totalAmount" required>

            <label for="amount">Paid Amount</label>
            <input type="number" id="amount" name="paidAmount" required>

            <label for="amount">Remaining Pending</label>
            <input type="number" id="remainamount" name="remainingPending" required>


            </select>

            <button type="submit">Submit Expense</button>
        </form>
    </div>

</body>
</html>