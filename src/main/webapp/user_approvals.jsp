<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Approvals</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: #eaf6ff;
        }

        .container {
            padding: 20px;
            max-width: 500px;
            margin: auto;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        .card {
            background-color: white;
            border-radius: 10px;
            padding: 15px;
            margin: 15px 0;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .card-detail {
            margin: 5px 0;
            color: #555;
        }

        .approve-btn {
            display: inline-block;
            margin-top: 10px;
            background-color: #3498db;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
        }

        .approve-btn:hover {
            background-color: #2980b9;
        }

        .no-users {
            text-align: center;
            color: #888;
            font-style: italic;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>User Approvals</h2>

<%
    try {

        PreparedStatement ps = null;

        Class.forName("org.postgresql.Driver");


      String url ="jdbc:postgresql://dpg-d2cnci9r0fns73e3qbpg-a.oregon-postgres.render.com:5432/murali6301?sslmode=require";
      String dbUser = "murali6301_user";
      String dbPassword = "Fg6IBfBAIi4fESlW7djIgXK9BKlraxMh";

       Connection con = DriverManager.getConnection(url,dbUser,dbPassword);

        String sql = ("SELECT id, username, email FROM user_credentials WHERE approved = false");

        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();


        boolean hasUsers = false;

        while (rs.next()) {
            hasUsers = true;
            int id = rs.getInt("id");
            String username = rs.getString("username");
            String email = rs.getString("email");
%>
    <div class="card">
        <div class="card-title"><%= username %></div>
        <div class="card-detail">Email: <%= email %></div>
        <a href="ApproveUserServlet?id=<%= id %>" class="approve-btn">Approve</a>
    </div>
<%
        }

        if (!hasUsers) {
%>
    <div class="no-users">No pending users to approve.</div>
<%
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
%>
    <div class="no-users">Error: <%= e.getMessage() %></div>
<%
    }
%>

</div>

</body>
</html>