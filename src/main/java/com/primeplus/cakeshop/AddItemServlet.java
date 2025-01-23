package com.primeplus.cakeshop;

import javax.sql.DataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

@WebServlet(name = "AddItemServlet", value = "/add-item-servlet")
public class AddItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(AddItemServlet.class.getName());

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        logger.info("AddItemServlet is initialized");
        try {
            Context initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/pool");
            logger.info("AddItemServlet initialized successfully");
        } catch (NamingException e) {
            throw new ServletException("Failed to lookup DataSource", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name").trim();
        String price = request.getParameter("price").trim();
        String description = request.getParameter("description").trim();
        String category = request.getParameter("category").trim();
        String image = request.getParameter("image").trim();

        // Validate input
        if (name == null || name.isEmpty()) {
            request.setAttribute("message", "Name is required.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        if (price == null || price.isEmpty()) {
            request.setAttribute("message", "Price is required.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        if (description == null || description.isEmpty()) {
            request.setAttribute("message", "Description is required.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        if (category == null || category.isEmpty()) {
            request.setAttribute("message", "Category is required.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        if (image == null || image.isEmpty()) {
            request.setAttribute("message", "Image is required.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        try (Connection connection = dataSource.getConnection()) {
            // Insert item
            String sql = "INSERT INTO Item (name, price, description, category, image) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, price);
            statement.setString(3, description);
            statement.setString(4, category);
            statement.setString(5, image);
            statement.executeUpdate();

            request.setAttribute("message", "Item added successfully.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error occurred: " + e.getMessage());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }
}
