package Service;

import Beans.Account;
import Beans.Product;
import DAO.AccountDAO;
import DAO.ProductDAO;

import java.util.List;

public class AccountService {
    private AccountDAO accountDAO = new AccountDAO();
    private static AccountService instance;

    public AccountService() {
        // private constructor to prevent instantiation outside the class
    }

    public static AccountService getInstance() {
        if (instance == null) {
            instance = new AccountService();
        }
        return instance;
    }

    public Account checkLogin(String username, String password) {
        Account account = accountDAO.accountByUsername(username);
        if (account != null && account.getUsername().equals(username) && account.getPassword().equals(password)) {
            return account;
        }

        return null;
    }

    public Account getAccountInfo(String username) {
        if (username == null) {
            return null; // or throw an IllegalArgumentException
        }

        return accountDAO.accountByUsername(username);
    }
    }
