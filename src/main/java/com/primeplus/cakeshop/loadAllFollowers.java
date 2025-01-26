package com.primeplus.cakeshop;

import com.primeplus.cakeshop.entity.Follower;
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

@WebServlet(name = "loadAllFollowers", value = "/load-all-followers")
public class loadAllFollowers extends HttpServlet {
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        try {
            System.out.println("Load All Followers Servlet is initialized");
            Context initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/pool");
        } catch (NamingException e) {
            throw new ServletException("Failed to lookup DataSource", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Load All Followers Servlet: POST");
        List<Follower> followers = new ArrayList<>();
        String query = "SELECT id, username, email FROM Follower";

        try (Connection connection = dataSource.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Follower follower = new Follower();
                follower.setId(rs.getInt("id"));
                follower.setUsername(rs.getString("username"));
                follower.setEmail(rs.getString("email"));
                followers.add(follower);
            }

            System.out.println("Fetched Followers: " + followers.size());

        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        }

        if (followers.isEmpty()) {
            System.out.println("No followers found.");
        }

        request.setAttribute("followers", followers);
        request.getRequestDispatcher("followers.jsp").forward(request, response);
    }
}
