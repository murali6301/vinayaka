package com.vinaya.web; // 👈 you define this
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Load PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Connect to your PostgreSQL DB (change details accordingly)
          //  Connection conn = DriverManager.getConnection(
            //        "jdbc:postgresql://localhost:5432/vinayaka",
             //       "vinayaka_user",
             //       "HhFenu7cRf5ZdOHYN7bQxUZOTMm6DApZ"
         //   );

            // Prepare the SQL insert query
            //String sql = "INSERT INTO user_credentials (username, password, email) VALUES (?, ?, ?)";
            PreparedStatement ps = null;



            String url = "jdbc:postgresql://dpg-d1elv22li9vc73a8803g-a.oregon-postgres.render.com:5432/vinayaka?sslmode=require";
            String dbUser = "vinayaka_user";
            String dbPassword = "HhFenu7cRf5ZdOHYN7bQxUZOTMm6DApZ";

            Connection con = DriverManager.getConnection(url,dbUser,dbPassword);

            String sql = ("INSERT INTO user_credentials (username, password, email) VALUES (?, ?, ?)");
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password); // You can hash the password here for better security
            ps.setString(3, email);

            int rowsInserted = ps.executeUpdate();
            String message;

            if (rowsInserted > 0) {
                message = "✅ Registration successful! Wait for admin approval.";
            } else {
                message = "❌ Registration failed. Please try again.";
            }

            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);

            ps.close();


        }  catch (SQLException e) {
        // PostgreSQL unique constraint violation (email already exists)
        if ("23505".equals(e.getSQLState())) {
            request.setAttribute("message", "❌ This email is already registered.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        } else {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error: " + e.getMessage() + "'); window.location='register.jsp';</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
       // response.getWriter().println("<script>alert('Error: " + e.getMessage() + "'); window.location='register.jsp';</script>");
    }
    }
}