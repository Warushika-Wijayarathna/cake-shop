package com.primeplus.cakeshop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.security.crypto.bcrypt.BCrypt;

@WebServlet(name = "RegisterServlet", value = "/register-servlet")
public class RegisterServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(RegisterServlet.class.getName());

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        logger.info("RegisterServlet is initialized");
        try {
            Context initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/pool");
            logger.info("RegisterServlet initialized successfully");
            logger.info("datasource>>>>> " + dataSource);
        } catch (NamingException e) {
            throw new ServletException("Failed to lookup DataSource", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        // Validate input
        if (username == null || username.isEmpty()) {
            request.setAttribute("message", "Username is required.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        if (email == null || email.isEmpty() || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            request.setAttribute("message", "Valid email is required.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        if (password == null || password.isEmpty() || password.length() < 8) {
            request.setAttribute("message", "Password is required and must be at least 8 characters long.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        // Hash the password using BCrypt
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        try (Connection connection = dataSource.getConnection()) {
            // Insert new user
            String sql;
            boolean isAdmin = email.endsWith("@cravex.com");
            if (isAdmin) {
                sql = "INSERT INTO Admin (username, email, password) VALUES (?, ?, ?)";
            } else {
                sql = "INSERT INTO Follower (username, email, password) VALUES (?, ?, ?)";
            }

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, username);
                statement.setString(2, email);
                statement.setString(3, hashedPassword);

                int rows = statement.executeUpdate();
                if (rows > 0) {
                    if (isAdmin) {
                        response.sendRedirect("admin-portal.jsp");
                    } else {
                        response.sendRedirect("user-portal.jsp");
                    }
                } else {
                    request.setAttribute("message", "Registration failed.");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                if (e.getSQLState().equals("23000")) { // SQL state for unique constraint violation
                    request.setAttribute("message", "Email is already registered.");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                } else {
                    e.printStackTrace();
                    request.setAttribute("message", "Error occurred: " + e.getMessage());
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Error occurred: " + e.getMessage());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
