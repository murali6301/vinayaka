<%@ page import="java.sql.*" %>
<%@ page import="com.vinaya.web.DBConnection" %>
<%
    String idParam = request.getParameter("id");
    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        try {
            Connection con = DBConnection.getConnection();
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