package com.vinaya.web;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
@WebServlet("/ApproveDonationServlet")
public class ApproveDonationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sno = Integer.parseInt(request.getParameter("sno"));

        try {
            PreparedStatement ps = null;

            Class.forName("org.postgresql.Driver");


            String url = "jdbc:postgresql://dpg-d1elv22li9vc73a8803g-a.oregon-postgres.render.com:5432/vinayaka?sslmode=require";
            String dbUser = "vinayaka_user";
            String dbPassword = "HhFenu7cRf5ZdOHYN7bQxUZOTMm6DApZ";

            Connection con = DriverManager.getConnection(url,dbUser,dbPassword);


            String sql = ("UPDATE donations SET status = 'approved' WHERE id = ?");
            ps = con.prepareStatement(sql);
            ps.setInt(1, sno);
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("update_donations.jsp");  // reload the page
    }
}