package com.vinaya.web;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");



        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = null;

            String sql = ("SELECT * FROM user_credentials WHERE username = ? AND password = ?");

            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                boolean approved = rs.getBoolean("approved");

                if (approved) {
                    // Approved - login success
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    response.sendRedirect("homepage.jsp"); // success page
                } else {
                    // Not approved yet
                    request.setAttribute("error", "Your account is waiting for admin approval.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                // Invalid credentials
                request.setAttribute("error", "Invalid username or password.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
          //  try { if (rs != null) rs.close(); } catch (Exception e) {}
            //try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            //try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}