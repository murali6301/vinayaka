package com.vinaya.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ApproveUserServlet")
public class ApproveUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        try {

            PreparedStatement ps = null;

            Connection con = DBConnection.getConnection();

            String sql = ("UPDATE user_credentials SET approved = true WHERE id = ?");
            ps = con.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();

            ps.close();
            con.close();

            response.sendRedirect("user_approvals.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}