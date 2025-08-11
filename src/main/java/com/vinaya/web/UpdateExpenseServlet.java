package com.vinaya.web;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateExpenseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("org.postgresql.Driver");

            String url = "jdbc:postgresql://dpg-d2cnci9r0fns73e3qbpg-a.oregon-postgres.render.com:5432/murali6301?sslmode=require";
            String dbUser = "murali6301_user";
            String dbPassword = "Fg6IBfBAIi4fESlW7djIgXK9BKlraxMh";

            Connection con = DriverManager.getConnection(url, dbUser, dbPassword);

            // Step 1: Get current paid_amount and remaining_pending
            String selectSql = "SELECT paid_amount, remaining_pending FROM expenses WHERE id = ?";
            PreparedStatement selectPs = con.prepareStatement(selectSql);
            selectPs.setInt(1, id);
            ResultSet rs = selectPs.executeQuery();

            if (rs.next()) {
                double paidAmount = rs.getDouble("paid_amount");
                double pendingAmount = rs.getDouble("remaining_pending");

                // Step 2: Calculate new paid_amount
                double newPaidAmount = paidAmount + pendingAmount;

                // Step 3: Update both paid_amount and remaining_pending
                String updateSql = "UPDATE expenses SET paid_amount = ?, remaining_pending = 0 WHERE id = ?";
                PreparedStatement updatePs = con.prepareStatement(updateSql);
                updatePs.setDouble(1, newPaidAmount);
                updatePs.setInt(2, id);
                updatePs.executeUpdate();
                updatePs.close();
            }

            rs.close();
            selectPs.close();
            con.close();

            // Redirect to view the updated table
            response.sendRedirect("update_expenses.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}