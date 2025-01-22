package com.primeplus.cakeshop.config;

import com.atomikos.icatch.jta.UserTransactionManager;
import com.atomikos.icatch.jta.UserTransactionImp;
import jakarta.transaction.UserTransaction;

public class JtaConfiguration {
    private static UserTransactionManager transactionManager;
    private static UserTransaction userTransaction;

    public static void init() throws Exception {
        // Initialize Atomikos transaction manager
        transactionManager = new UserTransactionManager();
        transactionManager.init();

        // Create and assign UserTransaction
        UserTransactionImp utxImp = new UserTransactionImp();
        userTransaction = (UserTransaction) utxImp; // Assign the UserTransactionImp instance
        System.out.println("Atomikos transaction manager and UserTransaction initialized.");
    }

    public static void shutdown() {
        if (transactionManager != null) {
            transactionManager.close();
            System.out.println("Atomikos transaction manager shut down.");
        }
    }

    public static UserTransaction getUserTransaction() {
        return userTransaction;
    }
}
