<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Expenses</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f1f5f9;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #0ea5e9;
            color: white;
        }

        tr:hover {
            background-color: #f0f9ff;
        }

        form {
            margin: 0;
        }

        button {
            background-color: #22c55e;
            color: white;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.2s ease-in-out;
        }

        button:hover {
            background-color: #16a34a;
        }

        @media screen and (max-width: 600px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            th {
                position: absolute;
                top: -9999px;
                left: -9999px;
            }

            tr {
                margin: 10px 0;
                border-bottom: 2px solid #ccc;
                border-radius: 8px;
                background-color: white;
            }

            td {
                padding: 10px;
                text-align: left;
                border: none;
                position: relative;
            }

            td:before {
                content: attr(data-label);
                font-weight: bold;
                display: block;
                color: #555;
            }
        }
    </style>
</head>
<body>

<h2>Update Expenses</h2>

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


       String sql = "SELECT id, product_name, remaining_pending FROM expenses WHERE remaining_pending >= 1";
         ps = con.prepareStatement(sql);
         rs = ps.executeQuery();
%>

<table>
    <tr>
        <th>Product Name</th>
        <th>Remaining Pending</th>
        <th>Action</th>
    </tr>

    <%
        while (rs.next()) {
    %>
    <tr>
        <td data-label="Product Name"><%= rs.getString("product_name") %></td>
        <td data-label="Remaining Pending"><%= rs.getDouble("remaining_pending") %></td>
        <td>
            <form method="post" action="UpdateExpenseServlet">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                <button type="submit">Update</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>

<%
    } catch (Exception e) {
        out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

</body>
</html>