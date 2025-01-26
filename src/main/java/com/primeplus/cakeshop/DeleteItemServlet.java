package com.primeplus.cakeshop;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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
import java.util.HashMap;
import java.util.logging.Logger;

@WebServlet(name = "DeleteItemServlet", value = "/delete-item-servlet")
@MultipartConfig
public class DeleteItemServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(DeleteItemServlet.class.getName());

    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        System.out.println("DeleteItemServlet is initialized");
        logger.info("DeleteItemServlet is initialized");
        try {
            Context initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/pool");
            logger.info("DeleteItemServlet initialized successfully");
        } catch (NamingException e) {
            throw new ServletException("Failed to lookup DataSource", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("DeleteItemServlet doPost method is called");

        String id = req.getParameter("itemId");
        System.out.println("itemId: " + id);


        try (Connection connection = dataSource.getConnection()) {
            String sql = "DELETE FROM Item WHERE id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, Integer.parseInt(id));
                preparedStatement.executeUpdate();
            }
        } catch (Exception e) {
            req.getSession().setAttribute("message", "Delete unsuccessfully.");
            res.sendRedirect(req.getContextPath() + "/item.jsp");
            e.printStackTrace();
        }

        req.getSession().setAttribute("message", "Delete added successfully.");
        res.sendRedirect(req.getContextPath() + "/item.jsp");
    }
}
