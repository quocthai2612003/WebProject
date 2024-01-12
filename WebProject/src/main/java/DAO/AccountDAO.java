package DAO;

import Beans.Account;
import JDBIConnector.ConnectJDBI;
import org.jdbi.v3.core.Jdbi;

import java.util.Date;
import java.util.Map;
import java.util.Optional;

public class AccountDAO {
    private static Jdbi JDBI;
    public static Account accountByUsername(String username) {
        JDBI = ConnectJDBI.connector();
        Optional<Account> account = JDBI.withHandle(handle ->
                handle.createQuery("Select id, username, password,email, fullname, number_phone, status From account where username = ?")
                        .bind(0, username).mapToBean(Account.class).stream().findFirst()
        );
        return account.isEmpty() ? null : account.get();
    }

    public static Account accountByUsernameAndEmail(String username, String email) {
        JDBI = ConnectJDBI.connector();
        Optional<Account> account = JDBI.withHandle(handle ->
                handle.createQuery("Select id, username, password,email, fullname, number_phone, status From account where username = ? And email = ?")
                        .bind(0, username).bind(1, email).mapToBean(Account.class).stream().findFirst()
        );
        return account.isEmpty() ? null : account.get();
    }

    public static boolean createAccount(String username, String password, String email, String fullname, String number_phone, int status) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("INSERT INTO account(username, password, email, fullname, number_phone, status) " +
                                "VALUES (?, ?, ?, ?, ?, ?)")
                        .bind(0, username)
                        .bind(1, password)
                        .bind(2, email)
                        .bind(3, fullname)
                        .bind(4, number_phone)
                        .bind(5, status)
                        .execute());
        return execute > 0;
    }

    public static boolean createVertifyEmail(String username, String email, String code, Date dateCreate, Date dateExpired, boolean status) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("INSERT INTO vertify_email(username, email, code, date_created, date_expired, status) " +
                                "VALUES (?, ?, ?, ?, ?, ?)")
                        .bind(0, username)
                        .bind(1, email)
                        .bind(2, code)
                        .bind(3, dateCreate)
                        .bind(4, dateExpired)
                        .bind(5, status)
                        .execute());
        return execute > 0;
    }

    public static boolean isCodeVertifyEmail(String code) {
        JDBI = ConnectJDBI.connector();
        Optional<Map<String, Object>> stringObjectMap = JDBI.withHandle(handle ->
                handle.createQuery("Select email, code From vertify_email where code = ?")
                        .bind(0, code).mapToMap().stream().findFirst());
        return !stringObjectMap.isEmpty();
    }

    public static void main(String[] args) {
        // Create an instance of AccountDAO
        AccountDAO accountDAO = new AccountDAO();

        // Provide sample username and email for testing
        String username = "quoc2612003";
        String email = "quoc2612003@gmail.com";

        // Call the method and print the result
        Account result = accountDAO.accountByUsernameAndEmail(username, email);

        // Check if the result is not null
        if (result != null) {
            System.out.println("Account found:");
            System.out.println("ID: " + result.getID());
            System.out.println("Username: " + result.getUsername());
            System.out.println("Email: " + result.getEmail());
            System.out.println("Fullname: " + result.getFullname());
            System.out.println("Phone Number: " + result.getNumberPhone());
            System.out.println("Status: " + result.getStatus());
        } else {
            System.out.println("Account not found for the given username and email.");
        }
    }
}

