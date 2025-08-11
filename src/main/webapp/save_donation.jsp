<%@ page import="java.sql.*" %>
<%
    String fullname = request.getParameter("fullname");
    float amount = Float.parseFloat(request.getParameter("amount"));
    String status = request.getParameter("status");

    PreparedStatement ps = null;

    try {
        Class.forName("org.postgresql.Driver");

String url = "jdbc:postgresql://dpg-d2cnci9r0fns73e3qbpg-a.oregon-postgres.render.com:5432/murali6301?sslmode=require";
String dbUser = "murali6301_user";
String dbPassword = "Fg6IBfBAIi4fESlW7djIgXK9BKlraxMh";

        Connection con = DriverManager.getConnection(url,dbUser,dbPassword);

        String sql = "INSERT into donations (full_name,amount,status)VALUES (?,?,?)";
        ps = con.prepareStatement(sql);
        ps.setString(1, fullname);
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