<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Donations</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 15px;
            background: linear-gradient(to bottom right, #e0f7fa, #f0f8ff);
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .card p {
            margin: 6px 0;
        }

        .approve-btn {
            background-color: #4caf50;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 10px;
            width: 100%;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
    </style>
</head>
<body>

<h2>Pending Donations</h2>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("org.postgresql.Driver");

        String url = "jdbc:postgresql://dpg-d1elv22li9vc73a8803g-a.oregon-postgres.render.com:5432/vinayaka?sslmode=require";
        String dbUser = "vinayaka_user";
        String dbPassword = "HhFenu7cRf5ZdOHYN7bQxUZOTMm6DApZ";

        con = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql = "SELECT * FROM donations WHERE status = 'pending'";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            double amount = rs.getDouble("amount");
            String status = rs.getString("status");
%>
    <div class="card">
        <p><strong>S.No:</strong> <%= id %></p>
        <p><strong>Name:</strong> <%= name %></p>
        <p><strong>Amount:</strong> ₹<%= amount %></p>
        <p><strong>Status:</strong> <%= status %></p>
        <form action="ApproveDonationServlet" method="post">
            <input type="hidden" name="sno" value="<%= id %>">
            <button class="approve-btn" type="submit">Approve</button>
        </form>
    </div>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
    <p style="color:red;">Error loading data: <%= e.getMessage() %></p>
<%
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>