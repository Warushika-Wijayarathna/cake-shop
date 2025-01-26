package com.primeplus.cakeshop;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.primeplus.cakeshop.entity.CartItem;
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

@WebServlet(name = "CartItemServlet", value = "/cart-item-servlet")
public class CartItemServlet extends HttpServlet {

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("CartItemServlet doPost");

        // Read the JSON request body
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = req.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (IOException e) {
            System.err.println("Error reading request body: " + e.getMessage());
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request body");
            return;
        }

        // Convert the JSON string to List<CartItem> using Gson
        Gson gson = new Gson();
        List<CartItem> cartItems;
        try {
            System.out.println("sb.toString() = " + sb.toString());
            cartItems = gson.fromJson(sb.toString(), new TypeToken<List<CartItem>>(){}.getType());
        } catch (Exception e) {
            System.err.println("Error parsing JSON: " + e.getMessage());
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid JSON format");
            return;
        }

        // Print the received cart items for debugging
        System.out.println("Cart items received: " + cartItems);

        // Set the cart items in the session
        req.getSession().setAttribute("cartItems", cartItems);

        // Forward the request to the cart.jsp page
        req.getRequestDispatcher("/cart.jsp").forward(req, resp);
    }
}
