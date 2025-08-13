<%@ page import="java.sql.*" %>
<%
    String idParam = request.getParameter("id");
    String message = "";
    if (idParam == null) {
        out.println("No ID provided!");
        return;
    }

    int id = Integer.parseInt(idParam);

    Class.forName("org.postgresql.Driver");
    String url ="jdbc:postgresql://dpg-d2cnci9r0fns73e3qbpg-a.oregon-postgres.render.com:5432/murali6301?sslmode=require";
    String dbUser = "murali6301_user";
    String dbPassword = "Fg6IBfBAIi4fESlW7djIgXK9BKlraxMh";

    Connection con = DriverManager.getConnection(url, dbUser, dbPassword);

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String ProductName = request.getParameter("product_name");
        String totalAmountStr = request.getParameter("total_amount");
        String PaidAmountStr = request.getParameter("paid_amount");
        String RemainingAmountStr = request.getParameter("remaining_pending");

        if (ProductName != null && totalAmountStr != null && PaidAmountStr != null && RemainingAmountStr != null) {
            String updateSQL = "UPDATE expenses SET product_name=?, total_amount=?, paid_amount=?, remaining_pending=? WHERE id=?";
            PreparedStatement psUpdate = con.prepareStatement(updateSQL);
            psUpdate.setString(1, ProductName);
            psUpdate.setDouble(2, Double.parseDouble(totalAmountStr));
            psUpdate.setDouble(3, Double.parseDouble(PaidAmountStr));
            psUpdate.setDouble(4, Double.parseDouble(RemainingAmountStr));
            psUpdate.setInt(5, id);

            int updated = psUpdate.executeUpdate();
            if (updated > 0) {
                message = "Expenses updated successfully!";
            } else {
                message = "Update failed!";
            }
            psUpdate.close();
        } else {
            message = "All fields are required!";
        }
    }

    // Fetch existing data
    String sql = "SELECT product_name, total_amount, paid_amount, remaining_pending FROM expenses WHERE id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();

    String ProductName = "";
    double totalAmount = 0.0;
    double PaidAmount = 0.0;
    double RemainingAmount = 0.0;

    if (rs.next()) {
        ProductName = rs.getString("product_name");
        totalAmount = rs.getDouble("total_amount");
        PaidAmount = rs.getDouble("paid_amount");
        RemainingAmount = rs.getDouble("remaining_pending");
    }

    rs.close();
    ps.close();
    con.close();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Expense</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
                   font-family: Arial, sans-serif;
                    background: linear-gradient(135deg, #a1c4fd, #c2e9fb, #fbc2eb, #a6c1ee);
                    background-repeat : no-repeat;
                    background-size:cover;
                    min-height:100vh;
                    margin:0;
               }
        h2 {
            text-align: center;
        }
        form {
            max-width: 400px;
             background: linear-gradient(135deg, #a1c4fd, #c2e9fb, #fbc2eb, #a6c1ee);
            margin: auto;

            padding: 15px;
            border-radius: 8px;
        }
        input, select, button {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
        }
        button {
            background-color: #4CAF50;
            border: none;
            color: white;
            cursor: pointer;
        }
        .back-btn {
            background-color: gray;
            margin-top: 5px;
        }
        .msg {
            text-align: center;
            color: green;
        }
    </style>
</head>
<body>

<h2>Edit Expense</h2>



<% if (!message.isEmpty()) { %>
    <p class="msg">&#9989;<%= message %></p>
<% } %>

<form method="post">
    <!-- Hidden field to send ID back on POST -->
    <input type="hidden" name="id" value="<%= id %>">

    <label>Product Name</label>
    <input type="text" name="product_name" value="<%= ProductName %>" required>

    <label>Total Amount</label>
    <input type="number" step="0.01" name="total_amount" value="<%= totalAmount %>" required>

    <label>Paid Amount</label>
    <input type="number" step="0.01" name="paid_amount" value="<%= PaidAmount %>" required>

    <label>Remaining Amount</label>
    <input type="number" step="0.01" name="remaining_pending" value="<%= RemainingAmount %>" required>

    <button type="submit">Save Changes</button>
    <button type="button" class="back-btn" onclick="window.location.href='update_expenses.jsp'">Back</button>
</form>

</body>
</html>