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
import java.sql.SQLException;

@WebServlet(name = "GetAllOrders", value = "/get-all-orders")
public class GetAllOrders extends HttpServlet {
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            System.out.println("Get All Orders Servlet is initialized");
            Context initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/pool");
        } catch (NamingException e) {
            throw new ServletException("Failed to lookup DataSource", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Get All Orders Servlet doGet method called");
        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT * FROM orders";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        System.out.println("Order ID: " + resultSet.getInt("id"));
                        System.out.println("Username: " + resultSet.getString("username"));
                        System.out.println("Product List: " + resultSet.getString("product_list"));
                        System.out.println("Total: " + resultSet.getString("total"));
                        System.out.println("Order Date: " + resultSet.getTimestamp("order_date"));
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Failed to get all orders");
            throw new ServletException("Failed to get all orders", e);
        }
    }
}
