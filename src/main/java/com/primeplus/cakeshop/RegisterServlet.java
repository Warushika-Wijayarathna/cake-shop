package com.primeplus.cakeshop;

import java.io.IOException;

import com.primeplus.cakeshop.dto.AdminDTO;
import com.primeplus.cakeshop.dto.FollowerDTO;
import jakarta.activation.DataSource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private EntityManagerFactory entityManagerFactory;

    @Override
    public void init() throws ServletException {
        try {
            Context initialContext = new InitialContext();
            javax.sql.DataSource ds = (javax.sql.DataSource) initialContext.lookup("java:comp/env/jdbc/pool");
            System.out.println("JNDI lookup successful.");
        } catch (NamingException e) {
            System.out.println("JNDI lookup failed: " + e.getMessage());
            throw new ServletException(e);
        }
        try {
            entityManagerFactory = Persistence.createEntityManagerFactory("CraveX");
            System.out.println("EntityManagerFactory initialized successfully.");
        } catch (Exception e) {
            System.out.println("Failed to initialize EntityManagerFactory: " + e.getMessage());
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            entityManager = entityManagerFactory.createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();

            if (email.endsWith("@cravex.com")) {
                AdminDTO admin = new AdminDTO(username, email, password);
                entityManager.persist(admin);
                System.out.println("Admin user registered: " + admin);
            } else {
                FollowerDTO follower = new FollowerDTO(username, email, password);
                entityManager.persist(follower);
                System.out.println("Follower user registered: " + follower);
            }

            transaction.commit();
            response.getWriter().println("User registered successfully!");
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            System.out.println("Error during database operation: " + e.getMessage());
            response.getWriter().println("Error occurred: " + e.getMessage());
        } finally {
            if (entityManager != null) {
                entityManager.close();
            }
        }
    }

    @Override
    public void destroy() {
        if (entityManagerFactory != null) {
            entityManagerFactory.close();
            System.out.println("EntityManagerFactory closed successfully.");
        }
    }
}
