<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Expenses List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background: linear-gradient(to bottom right, #dbeafe, #f0fdf4);
            margin: 0;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #222;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
            font-size: 14px;
        }

        th {
            background-color: #22c55e;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        @media (max-width: 600px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            thead tr {
                display: none;
            }

            tr {
                margin-bottom: 15px;
                border: 1px solid #ccc;
                padding: 10px;
            }

            td {
                padding-left: 50%;
                position: relative;
                text-align: left;
                border: none;
                border-bottom: 1px solid #eee;
            }

            td::before {
                content: attr(data-label);
                position: absolute;
                left: 10px;
                font-weight: bold;
                color: #333;
            }
        }
    </style>
</head>
<body>
    <h2>Expenses List</h2>
    <table>
        <thead>
            <tr>
                <th>S.No</th>
                <th>Product</th>
                <th>Total Amount</th>
                <th>Paid Amount</th>
                <th>Date & Time</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                int count = 1;

                try {
                    Class.forName("org.postgresql.Driver");
                    String url = "jdbc:postgresql://dpg-d1elv22li9vc73a8803g-a.oregon-postgres.render.com:5432/vinayaka?sslmode=require";
                    String dbUser = "vinayaka_user";
                    String dbPassword = "HhFenu7cRf5ZdOHYN7bQxUZOTMm6DApZ";

                    con = DriverManager.getConnection(url, dbUser, dbPassword);
                    String sql = "SELECT id, product_name, total_amount, paid_amount, created_at FROM expenses ORDER BY id";
                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();

                    while (rs.next()) {
            %>
            <tr>
                <td data-label="S.No"><%= count++ %></td>
                <td data-label="Product"><%= rs.getString("product_name") %></td>
                <td data-label="Total Amount"><%= rs.getBigDecimal("total_amount") %></td>
                <td data-label="Paid Amount"><%= rs.getBigDecimal("paid_amount") %></td>
                <td data-label="Date & Time"><%= rs.getTimestamp("created_at") %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (con != null) con.close();
                    } catch (Exception ex) {
                        out.println("<tr><td colspan='5'>Closing Error: " + ex.getMessage() + "</td></tr>");
                    }
                }
            %>
        </tbody>
    </table>
</body>
</html>