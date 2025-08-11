<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donation Records</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 10px;
            margin: 0;
        }

        h2 {
            text-align: center;
            font-size: 22px;
            margin-bottom: 15px;
        }

        .table-container {
            overflow-x: auto;
            max-width: 100%;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #333;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        @media screen and (max-width: 600px) {
            th, td {
                padding: 8px;
                font-size: 13px;
            }

            h2 {
                font-size: 18px;
            }

            table {
                min-width: 100%;
            }
        }
    </style>
</head>
<body>

<h2>Donation Records</h2>

<div class="table-container">
    <table>
        <tr>
            <th>S.No</th>
            <th>Full Name</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Date & Time</th>
        </tr>

<%
    try {
      PreparedStatement ps = null;


        Class.forName("org.postgresql.Driver");


String url ="jdbc:postgresql://dpg-d2cnci9r0fns73e3qbpg-a.oregon-postgres.render.com:5432/murali6301?sslmode=require";
String dbUser = "murali6301_user";
String dbPassword = "Fg6IBfBAIi4fESlW7djIgXK9BKlraxMh";


         Connection con = DriverManager.getConnection(url,dbUser,dbPassword);


       String sql = ("SELECT full_name, amount, status,created_at  FROM donations ORDER BY id ASC");

       ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        int sno = 1;
        while (rs.next()) {
%>
        <tr>
            <td><%= sno++ %></td>
            <td><%= rs.getString("full_name") %></td>
            <td><%= rs.getFloat("amount") %></td>
            <td><%= rs.getString("status") %></td>
            <td><%= rs.getTimestamp("created_at") %></td>
        </tr>
<%
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
%>
        <tr><td colspan="5">Error: <%= e.getMessage() %></td></tr>
<%
    }
%>
    </table>
</div>

</body>
</html>