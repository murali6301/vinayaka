<%@ page import="java.sql.*" %>
<%@ page import="com.vinaya.web.DBConnection" %>
<%
    String fullname = request.getParameter("fullname");
    float amount = Float.parseFloat(request.getParameter("amount"));
    String status = request.getParameter("status");

    PreparedStatement ps = null;

    try {
        Connection con = DBConnection.getConnection();

        String sql = "INSERT into donations (full_name,amount,status)VALUES (?,?,?)";
        ps = con.prepareStatement(sql);
        ps.setString(1, fullname);
        ps.setFloat(2, amount);
        ps.setString(3, status);

        int result = ps.executeUpdate();
        con.close();

        if (result > 0) {
            request.setAttribute("message","Donation Saved Successfully");
            request.getRequestDispatcher("add_donation.jsp").forward(request,response);
        } else {
            out.println("Failed to save donation.");
        }

    } catch (Exception e) {
        e.printStackTrace();
       out.println(e);

    }
%>