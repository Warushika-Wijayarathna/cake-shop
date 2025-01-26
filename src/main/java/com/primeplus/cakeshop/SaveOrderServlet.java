package com.primeplus.cakeshop;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

@WebServlet(name = "SaveOrderServlet", value = "/save-order-servlet")
public class SaveOrderServlet extends HttpServlet {
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            System.out.println("Save Order Servlet is initialized");
            Context initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/pool");
        } catch (NamingException e) {
            throw new ServletException("Failed to lookup DataSource", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Save Order Servlet doPost method called");
        String userId = request.getParameter("username");
        String productList = request.getParameter("productList");
        String total = request.getParameter("total");

        try (Connection connection = dataSource.getConnection()) {
            String sql = "INSERT INTO orders (username, product_list, total) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, userId);
                statement.setString(2, productList);
                statement.setString(3, total);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Failed to save order");
            throw new ServletException("Failed to save order", e);
        }

        response.sendRedirect(request.getContextPath() + "/order.jsp");
    }
}
