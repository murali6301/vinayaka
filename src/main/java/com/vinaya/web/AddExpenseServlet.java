package com.vinaya.web;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;

import static java.lang.System.out;
import static java.lang.System.setOut;

@WebServlet("/AddExpenseServlet")
public class AddExpenseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productName = request.getParameter("productName");
        String totalAmountStr = request.getParameter("totalAmount");
        String paidAmountStr = request.getParameter("paidAmount");
        String remainingPendingStr = request.getParameter("remainingPending");

        // Handle missing or blank inputs safely
       if (productName == null || totalAmountStr == null || paidAmountStr == null || remainingPendingStr == null ||
                productName.trim().isEmpty() || totalAmountStr.trim().isEmpty() ||
                paidAmountStr.trim().isEmpty() || remainingPendingStr.trim().isEmpty()) {
            response.getWriter().println("Error: Please fill in all fields.");
            return;
        }

        double totalAmount = Double.parseDouble(totalAmountStr);
        double paidAmount = Double.parseDouble(paidAmountStr);
        double remainingPending = Double.parseDouble(remainingPendingStr);


        PreparedStatement ps = null;

        try {
            Class.forName("org.postgresql.Driver");

            String url = "jdbc:postgresql://dpg-d2cnci9r0fns73e3qbpg-a.oregon-postgres.render.com:5432/murali6301?sslmode=require";
            String dbUser = "murali6301_user";
            String dbPassword = "Fg6IBfBAIi4fESlW7djIgXK9BKlraxMh";

            Connection con = DriverManager.getConnection(url,dbUser,dbPassword);



            String sql = ("INSERT INTO expenses (product_name, total_amount, paid_amount, remaining_pending) VALUES (?, ?, ?, ?)");
            ps = con.prepareStatement(sql);
            ps.setString(1, productName);
            ps.setDouble(2, totalAmount);
            ps.setDouble(3, paidAmount);
            ps.setDouble(4, remainingPending);

            int rowsInserted = ps.executeUpdate();
            con.close();

            if (rowsInserted > 0) {
                response.sendRedirect("add_expense.jsp");

            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("DB Error: " + e.getMessage());
        }
    }
}