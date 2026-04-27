package com.vinaya.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // The user provided Supabase credentials
    // Using the regional pooler with prepareThreshold=0 to fix Java connection issues
    private static final String URL = "jdbc:postgresql://aws-1-ap-south-1.pooler.supabase.com:6543/postgres?sslmode=require&prepareThreshold=0";
    private static final String USER = "postgres.ulkquivmetozxixebbhg";
    private static final String PASSWORD = "balamurali@123";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
