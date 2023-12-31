package controller;

import dao.AccountDAO;
import model.Account;

public class AccountService {
    static AccountService userService = getInstance();

    public static AccountService getInstance() {
        if (userService == null) userService = new AccountService();
        return userService;
    }

    public static Account checkLogin(String username, String password) {
        Account account = AccountDAO.accountByUsername(username);
        if (account != null) {
            if (account.getUsername().equals(username) && account.getPassword().equals(password)){
                return account;
            }
        }

        return null;
    }

    public boolean isCustomer(Account account) {
        return account.getStatus() == 0;
    }
}
