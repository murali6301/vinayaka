package com.vinaya.web;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // ✅ Hardcoded admin credentials
        String adminUsername = "admin";
        String adminPassword = "Murali@9405"; // change to your preferred one

        if (username.equals(adminUsername) && password.equals(adminPassword)) {
            // Admin logged in
            HttpSession session = request.getSession();
            session.setAttribute("admin", true);
            response.sendRedirect("admin_access.jsp"); // or any admin dashboard page
        } else {
            request.setAttribute("error", "Invalid admin username or password.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin_login.jsp");
            dispatcher.forward(request, response);
        }
    }
}