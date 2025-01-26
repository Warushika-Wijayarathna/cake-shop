package com.primeplus.cakeshop;

import com.primeplus.cakeshop.entity.Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "loadAllAdminsServlet", value = "/load-all-admins")
public class loadAllAdminsServlet extends HttpServlet {
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            System.out.println("Load All Admins Servlet is initialized");
            Context initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/pool");
        } catch (NamingException e) {
            throw new ServletException("Failed to lookup DataSource", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Load All Admins Servlet: POST");
        List<Admin> admins = new ArrayList<>();
        String query = "SELECT id, username, email FROM Admin";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Admin admin = new Admin();
                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));
                admin.setEmail(rs.getString("email"));
                admins.add(admin);
            }

            System.out.println("Fetched Admins: " + admins.size());

        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }

        if (admins.isEmpty()) {
            System.out.println("No admins found.");
        }

        request.setAttribute("admins", admins);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}
