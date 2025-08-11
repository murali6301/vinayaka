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
        String fullName = request.getParameter("full_name");
        String amount = request.getParameter("amount");
        String status = request.getParameter("status");

        String updateSQL = "UPDATE donations SET full_name=?, amount=?, status=? WHERE id=?";
        PreparedStatement psUpdate = con.prepareStatement(updateSQL);
        psUpdate.setString(1, fullName);
        psUpdate.setDouble(2, Double.parseDouble(amount));
        psUpdate.setString(3, status);
        psUpdate.setInt(4, id);

        int updated = psUpdate.executeUpdate();
        if (updated > 0) {
            message = "Donation updated successfully!";

        } else {
            message = "Update failed!";
        }
        psUpdate.close();
    }

    // Fetch existing data
    String sql = "SELECT full_name, amount, status FROM donations WHERE id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();

    String fullName = "";
    double amount = 0.0;
    String status = "";

    if (rs.next()) {
        fullName = rs.getString("full_name");
        amount = rs.getDouble("amount");
        status = rs.getString("status");
    }

    rs.close();
    ps.close();
    con.close();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Donation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 15px;
        }
        h2 {
            text-align: center;
        }
        form {
            max-width: 400px;
            margin: auto;
            background: #f4f4f4;
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

<h2>Edit Donation</h2>

<% if (!message.isEmpty()) { %>
    <p class="msg"><%= message %></p>
<% } %>

<form method="post">
    <label>Full Name</label>
    <input type="text" name="full_name" value="<%= fullName %>" required>

    <label>Amount</label>
    <input type="number" step="0.01" name="amount" value="<%= amount %>" required>

    <label>Status</label>
    <select name="status">
        <option value="pending" <%= "pending".equals(status) ? "selected" : "" %>>Pending</option>
        <option value="approved" <%= "approved".equals(status) ? "selected" : "" %>>Approved</option>
        <option value="rejected" <%= "rejected".equals(status) ? "selected" : "" %>>Rejected</option>
    </select>

    <button type="submit" onclick="window.location.href='update_donations.jsp'">Save Changes</button>
    <button type="button" class="back-btn" onclick="window.location.href='update_donations.jsp'">Back</button>
</form>

</body>
</html>