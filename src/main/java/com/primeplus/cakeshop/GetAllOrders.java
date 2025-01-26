package com.primeplus.cakeshop;

import com.primeplus.cakeshop.entity.Order;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Get All Orders Servlet: GET");
        List<Order> orders = new ArrayList<>();
        String query = "SELECT id, username, product_list, total, order_date FROM orders";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUsername(rs.getString("username"));
                order.setProductList(rs.getString("product_list"));
                order.setTotal(rs.getBigDecimal("total"));
                order.setOrderDate(rs.getTimestamp("order_date"));

                // Split product list into array
                String[] products = order.getProductList().split(",");
                request.setAttribute("products_" + order.getId(), products);

                orders.add(order);
            }

            System.out.println("Fetched Orders: " + orders.size());

        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }

        if (orders.isEmpty()) {
            System.out.println("No orders found.");
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("order.jsp").forward(request, response);
    }
}
