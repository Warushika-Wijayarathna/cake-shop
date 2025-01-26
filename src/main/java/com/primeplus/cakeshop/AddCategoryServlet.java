package com.primeplus.cakeshop;

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
import java.util.logging.Logger;

@WebServlet(name = "AddCategoryServlet", value = "/add-category-servlet")
public class AddCategoryServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(RegisterServlet.class.getName());

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        logger.info("Add Category Servlet is initialized");
        try {
            Context initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/pool");
            logger.info("Add Category Servlet initialized successfully");
            logger.info("datasource>>>>> " + dataSource);
        } catch (NamingException e) {
            throw new ServletException("Failed to lookup DataSource", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category = req.getParameter("category").trim();

        // Validate input
        if (category == null || category.isEmpty()) {
            req.getSession().setAttribute("message", "Category is required.");
            resp.sendRedirect(req.getContextPath() + "/item.jsp");
            return;
        }

        // Check if category already exists
        try (Connection connection = dataSource.getConnection()) {
            String checkQuery = "SELECT COUNT(*) FROM Category WHERE name = ?";
            try (PreparedStatement checkStatement = connection.prepareStatement(checkQuery)) {
                checkStatement.setString(1, category);
                try (ResultSet resultSet = checkStatement.executeQuery()) {
                    if (resultSet.next() && resultSet.getInt(1) > 0) {
                        req.getSession().setAttribute("message", "Category already exists.");
                        resp.sendRedirect(req.getContextPath() + "/item.jsp");
                        return;
                    }
                }
            }

            // Add category to database
            String insertQuery = "INSERT INTO Category (name) VALUES (?)";
            try (PreparedStatement insertStatement = connection.prepareStatement(insertQuery)) {
                insertStatement.setString(1, category);
                insertStatement.executeUpdate();
            }
        } catch (Exception e) {
            logger.severe("Failed to add category: " + e.getMessage());
            req.getSession().setAttribute("message", "Failed to add category.");
            resp.sendRedirect(req.getContextPath() + "/item.jsp");
            return;
        }

        req.getSession().setAttribute("message", "Category added successfully.");
        resp.sendRedirect(req.getContextPath() + "/item.jsp");
    }


}
