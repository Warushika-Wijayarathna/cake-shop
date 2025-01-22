package com.primeplus.cakeshop;

import java.io.IOException;
import com.primeplus.cakeshop.dto.AdminDTO;
import com.primeplus.cakeshop.dto.FollowerDTO;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.UserTransaction;

import com.primeplus.cakeshop.config.JtaConfiguration;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private EntityManagerFactory entityManagerFactory;
    private UserTransaction userTransaction;

    @Override
    public void init() throws ServletException {
        try {
            // Initialize Atomikos transaction manager via JtaConfiguration
            JtaConfiguration.init();
            userTransaction = JtaConfiguration.getUserTransaction();

            // Initialize EntityManagerFactory
            entityManagerFactory = Persistence.createEntityManagerFactory("CraveX");
            System.out.println("EntityManagerFactory initialized successfully.");
        } catch (Exception e) {
            System.out.println("Failed to initialize transaction manager or EntityManagerFactory: " + e.getMessage());
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        EntityManager entityManager = null;
        try {
            // Begin Atomikos transaction
            userTransaction.begin();

            entityManager = entityManagerFactory.createEntityManager();
            if (email.endsWith("@cravex.com")) {
                AdminDTO admin = new AdminDTO(username, email, password);
                entityManager.persist(admin);
                System.out.println("Admin user registered: " + admin);
            } else {
                FollowerDTO follower = new FollowerDTO(username, email, password);
                entityManager.persist(follower);
                System.out.println("Follower user registered: " + follower);
            }

            // Commit the transaction
            userTransaction.commit();
            response.getWriter().println("User registered successfully!");
        } catch (Exception e) {
            try {
                if (userTransaction != null) {
                    userTransaction.rollback();
                }
            } catch (Exception rollbackEx) {
                System.out.println("Error during rollback: " + rollbackEx.getMessage());
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

        // Shutdown Atomikos transaction manager
        JtaConfiguration.shutdown();
    }
}
