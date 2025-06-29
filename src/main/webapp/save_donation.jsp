<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    float amount = Float.parseFloat(request.getParameter("amount"));
    String status = request.getParameter("status");

    PreparedStatement ps = null;

    try {
        Class.forName("org.postgresql.Driver");

String url = "jdbc:postgresql://dpg-d1elv22li9vc73a8803g-a.oregon-postgres.render.com:5432/vinayaka?sslmode=require";
String dbUser = "vinayaka_user";
String dbPassword = "HhFenu7cRf5ZdOHYN7bQxUZOTMm6DApZ";

        Connection con = DriverManager.getConnection(url,dbUser,dbPassword);

        String sql = "INSERT into donations (name,amount,status)VALUES (?,?,?)";
        ps = con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setFloat(2, amount);
        ps.setString(3, status);

        int result = ps.executeUpdate();
        con.close();

        if (result > 0) {
            out.println("Donation saved successfully!");
        } else {
            out.println("Failed to save donation.");
        }

    } catch (Exception e) {
        e.printStackTrace();
       out.println(e);

    }
%>