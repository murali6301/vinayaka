<%@ page import="java.sql.*" %>
<%
    String idParam = request.getParameter("id");
    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        try {
            Class.forName("org.postgresql.Driver");
            String url ="jdbc:postgresql://dpg-d2cnci9r0fns73e3qbpg-a.oregon-postgres.render.com:5432/murali6301?sslmode=require";
            String dbUser = "murali6301_user";
            String dbPassword = "Fg6IBfBAIi4fESlW7djIgXK9BKlraxMh";

            Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
            PreparedStatement ps = con.prepareStatement("DELETE FROM donations WHERE id=?");
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            ps.close();
            con.close();

            if (rows > 0) {
                out.print("Donation deleted successfully.");
            } else {
                out.print("No record found.");
            }
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        }
    } else {
        out.print("Invalid ID.");
    }
%>