package com.primeplus.cakeshop;

import javax.sql.DataSource;

import com.primeplus.cakeshop.entity.Item;
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
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "LoadAllItemsServlet", value = "/load-all-items-servlet")
public class LoadAllItemsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            Context initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/pool");
        } catch (NamingException e) {
            throw new ServletException("Failed to lookup DataSource", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("LoadAllItemsServlet doPost method is called");
        List<Item> items = new ArrayList<>();
        try (Connection connection = dataSource.getConnection()) {
            String query = "SELECT * FROM Item";
            try (PreparedStatement statement = connection.prepareStatement(query);
                 ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Item item = new Item();
                    item.setId(resultSet.getInt("id"));
                    item.setName(resultSet.getString("name"));
                    item.setDescription(resultSet.getString("description"));
                    item.setImage(resultSet.getString("image").getBytes());
                    item.setPrice(resultSet.getBigDecimal("price"));
                    item.setDiscount(resultSet.getBigDecimal("discount"));
                    item.setQuantity(resultSet.getInt("quantity"));
                    item.setCategoryId(resultSet.getInt("category_id"));
                    items.add(item);
                }
            }
        } catch (Exception e) {
            System.out.println("Failed to load items");
            throw new ServletException("Failed to load items", e);
        }

        request.setAttribute("items", items);
        System.out.println("Items loaded successfully");
        request.getRequestDispatcher("/admin-portal.jsp#item-section").forward(request, response);
    }
}
