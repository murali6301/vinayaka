package com.vinaya.web;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/RemainingAmountServlet")
public class RemainingAmountServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double approvedAmount = 0;
        double pendingAmount = 0;
        double expensePaid = 0;
        double expensePending = 0;
        double currentbalance = 0;

        PreparedStatement ps = null;

        try {
            Class.forName("org.postgresql.Driver");

            String url = "jdbc:postgresql://dpg-d1elv22li9vc73a8803g-a.oregon-postgres.render.com:5432/vinayaka?sslmode=require";
            String dbUser = "vinayaka_user";
            String dbPassword = "HhFenu7cRf5ZdOHYN7bQxUZOTMm6DApZ";

            Connection con = DriverManager.getConnection(url, dbUser, dbPassword);

            // Approved Donations
            String sql = "SELECT SUM(amount) FROM donations WHERE status = 'approved'";
            ps = con.prepareStatement(sql);
            ResultSet result = ps.executeQuery();
            if (result.next()) {
                approvedAmount = result.getDouble(1);
            }

            // Pending Donations
            String sql1 = "SELECT SUM(amount) FROM donations WHERE status = 'pending'";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                pendingAmount = rs.getDouble(1);
            }

            // Paid Expenses
            String sql3 = "SELECT SUM(paid_amount) FROM expenses";
            PreparedStatement ps3 = con.prepareStatement(sql3);
            ResultSet rs3 = ps3.executeQuery();
            if (rs3.next()) {
                expensePaid = rs3.getDouble(1);
            }

            // Pending Expenses
            String sql4 = "SELECT SUM(remaining_pending) FROM expenses";
            PreparedStatement ps4 = con.prepareStatement(sql4);
            ResultSet rs4 = ps4.executeQuery();
            if (rs4.next()) {
                expensePending = rs4.getDouble(1);
            }

            // Calculate current balance
            currentbalance = approvedAmount - expensePaid;

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Pass values to JSP
        request.setAttribute("paid", approvedAmount);
        request.setAttribute("pending", pendingAmount);
        request.setAttribute("paidexpense", expensePaid);
        request.setAttribute("pendingexpense", expensePending);
        request.setAttribute("pendingbal", currentbalance);

        RequestDispatcher rd = request.getRequestDispatcher("remaining_amount.jsp");
        rd.forward(request, response);
    }
}