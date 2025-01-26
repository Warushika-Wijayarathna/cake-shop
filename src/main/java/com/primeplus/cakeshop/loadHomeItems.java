package com.primeplus.cakeshop;

import com.primeplus.cakeshop.entity.Item;
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
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@WebServlet(name = "loadHomeItems", value = "/load-home-items")
public class loadHomeItems extends HttpServlet {
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            System.out.println("Load Home Items Servlet is initialized");
            Context initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/pool");
        } catch (NamingException e) {
            throw new ServletException("Failed to lookup DataSource", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Load Home Items Servlet: GET");
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

                    // Encode byte array to Base64 string
                    byte[] imageBytes = resultSet.getBytes("image");
                    if (imageBytes != null) {
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                        item.setImage(base64Image.getBytes()); // Assuming the `image` property is still a byte array
                    }

                    item.setPrice(resultSet.getBigDecimal("price"));
                    item.setDiscount(resultSet.getBigDecimal("discount"));
                    item.setQuantity(resultSet.getInt("quantity"));
                    item.setCategoryId(resultSet.getInt("category_id"));
                    items.add(item);

                    System.out.println("Retrieved item: " + item);
                }

                System.out.println("Retrieved " + items.size() + " items");
            }
        } catch (Exception e) {
            System.out.println("Failed to load items");
            throw new ServletException("Failed to load items", e);
        }

        // Limit the items to 3 if there are more than 3
        List<Item> limitedItems = items.size() > 3 ? items.subList(0, 3) : items;

        request.setAttribute("home_items", limitedItems);
        request.getSession().setAttribute("home_items", limitedItems); // Store items in session if needed
        System.out.println("LoadItemsToMenuPage.doGet sending redirect to menuPage.jsp");
        response.sendRedirect(request.getContextPath() + "/user-portal.jsp");
    }


}
