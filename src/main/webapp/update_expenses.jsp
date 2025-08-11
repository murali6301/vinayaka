<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Expenses</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f4f4; padding: 20px; }
        table { width: 90%; margin: auto; border-collapse: collapse; background: white; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background: #0ea5e9; color: white; }
        .btn { padding: 5px 10px; border: none; border-radius: 4px; cursor: pointer; }
        .edit { background: #22c55e; color: white; }
        .delete { background: #ef4444; color: white; }
    </style>
</head>
<body>

<h2 style="text-align:center;">Manage Expenses</h2>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://dpg-d2cnci9r0fns73e3qbpg-a.oregon-postgres.render.com:5432/murali6301?sslmode=require";
        String dbUser = "murali6301_user";
        String dbPassword = "Fg6IBfBAIi4fESlW7djIgXK9BKlraxMh";
        con = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql = "SELECT id, product_name, total_amount, paid_amount, remaining_pending FROM expenses ORDER BY id ASC";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
%>

<table>
    <tr>
        <th>Product Name</th>
        <th>Total Amount</th>
        <th>Paid Amount</th>
        <th>Remaining Pending</th>
        <th>Actions</th>
    </tr>
    <%
        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("product_name") %></td>
        <td><%= rs.getDouble("total_amount") %></td>
        <td><%= rs.getDouble("paid_amount") %></td>
        <td><%= rs.getDouble("remaining_pending") %></td>
        <td>
            <form action="editexpenses.jsp" method="post" style="display:inline;">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                <button type="submit" class="btn edit">Edit</button>
            </form>
            <form action="delete_expenses.jsp" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this expense?');">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                <button type="submit" class="btn delete">Delete</button>
            </form>
        </td>
    </tr>
    <% } %>
</table>

<%
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

</body>
</html>