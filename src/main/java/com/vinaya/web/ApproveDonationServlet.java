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


            String url = "jdbc:postgresql://dpg-d2cnci9r0fns73e3qbpg-a.oregon-postgres.render.com:5432/murali6301?sslmode=require";
            String dbUser = "murali6301_user";
            String dbPassword = "Fg6IBfBAIi4fESlW7djIgXK9BKlraxMh";

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