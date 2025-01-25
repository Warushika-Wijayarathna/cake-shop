package com.primeplus.cakeshop;

import javax.sql.DataSource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

@WebServlet(name = "AddItemServlet", value = "/add-item-servlet")
@MultipartConfig
public class AddItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(AddItemServlet.class.getName());

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        System.out.println("AddItemServlet is initialized");
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
        System.out.println("AddItemServlet doPost method is called");

        System.out.println("Name: " + request.getParameter("name"));
        System.out.println("Description: " + request.getParameter("description"));
        System.out.println("Price: " + request.getParameter("price"));
        System.out.println("Discount: " + request.getParameter("discount"));
        System.out.println("Quantity: " + request.getParameter("quantity"));
        System.out.println("Category ID: " + request.getParameter("category_id"));
        System.out.println("Image: " + request.getPart("image").getSubmittedFileName());

        Part filePart = request.getPart("image");
        InputStream inputStream = null;
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }

        // Convert InputStream to byte array
        byte[] imageBytes = null;
        if (inputStream != null) {
            imageBytes = inputStream.readAllBytes();
        }

        // Save the item to the database
        try (Connection connection = dataSource.getConnection()) {
            String query = "INSERT INTO Item (name, description, image, price, discount, quantity, category_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, request.getParameter("name"));
                statement.setString(2, request.getParameter("description"));
                statement.setBytes(3, imageBytes); // Save byte array
                statement.setBigDecimal(4, new BigDecimal(request.getParameter("price")));
                statement.setBigDecimal(5, new BigDecimal(request.getParameter("discount")));
                statement.setInt(6, Integer.parseInt(request.getParameter("quantity")));
                statement.setInt(7, Integer.parseInt(request.getParameter("category_id")));
                statement.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("Failed to save item");
            throw new ServletException("Failed to save item", e);
        }

        System.out.println("Item saved successfully");
        response.sendRedirect(request.getContextPath() + "/item.jsp");
    }
}
