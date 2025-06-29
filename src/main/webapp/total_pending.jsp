<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Total Pending</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #ffdde1, #ee9ca7);
            padding: 20px;
        }
        h2 {
            text-align: center;

            color: #444;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #f7f7f7;
        }
    </style>
</head>
<body>

<h2>Pending Expenses</h2>

<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("org.postgresql.Driver");

        String url = "jdbc:postgresql://dpg-d1elv22li9vc73a8803g-a.oregon-postgres.render.com:5432/vinayaka?sslmode=require";
        String dbUser = "vinayaka_user";
        String dbPassword = "HhFenu7cRf5ZdOHYN7bQxUZOTMm6DApZ";

        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql = "SELECT id, product_name, remaining_pending FROM expenses WHERE remaining_pending > 0";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
%>

<table>
    <tr>
        <th>ID</th>
        <th>Product Name</th>
        <th>Remaining Pending</th>
    </tr>

<%
        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("product_name") %></td>
        <td><%= rs.getDouble("remaining_pending") %></td>
    </tr>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>

</table>

</body>
</html>