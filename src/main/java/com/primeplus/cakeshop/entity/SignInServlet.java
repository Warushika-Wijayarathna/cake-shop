package com.primeplus.cakeshop.entity;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

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

@WebServlet(name = "SignInServlet", value = "/sign-in-servlet")
public class SignInServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(SignInServlet.class.getName());

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        logger.info("SignInServlet is initialized");
        try {
            Context initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/pool");
            logger.info("SignInServlet initialized successfully");
        } catch (NamingException e) {
            throw new ServletException("Failed to lookup DataSource", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        // Validate input
        if (email == null || email.isEmpty() || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            request.setAttribute("message", "Valid email is required.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        if (password == null || password.isEmpty()) {
            request.setAttribute("message", "Password is required.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        try (Connection connection = dataSource.getConnection()) {
            // Check user credentials
            String sql = "SELECT password, 'Admin' AS role FROM Admin WHERE email = ? UNION SELECT password, 'Follower' AS role FROM Follower WHERE email = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, email);
                statement.setString(2, email);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String storedPassword = resultSet.getString("password");
                        String role = resultSet.getString("role");
                        if (BCrypt.checkpw(password, storedPassword)) {
                            // Successful login
                            if ("Admin".equals(role)) {
                                response.sendRedirect("admin-portal.jsp");
                            } else {
                                response.sendRedirect("user-portal.jsp");
                            }
                        } else {
                            // Invalid password
                            request.setAttribute("message", "Invalid email or password.");
                            request.getRequestDispatcher("/index.jsp").forward(request, response);
                        }
                    } else {
                        // Email not found
                        request.setAttribute("message", "Invalid email or password.");
                        request.getRequestDispatcher("/index.jsp").forward(request, response);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Error occurred: " + e.getMessage());
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Error occurred: " + e.getMessage());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
