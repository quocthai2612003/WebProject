package dao;

import model.Account;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;

import java.sql.Date;
import java.util.Map;
import java.util.Optional;

public class AccountDAO {
    private static Jdbi JDBI;
    public static Account accountByUsername(String username) {
        JDBI = ConnectJDBI.connector();
        Optional<Account> account = JDBI.withHandle(handle ->
                handle.createQuery("Select id, username, password,email, fullname, number_phone, status From accounts where username = ?")
                        .bind(0, username).mapToBean(Account.class).stream().findFirst()
        );
        return account.isEmpty() ? null : account.get();
    }

    public static Account accountByUsernameAndEmail(String username, String email) {
        JDBI = ConnectJDBI.connector();
        Optional<Account> account = JDBI.withHandle(handle ->
                handle.createQuery("Select id, username, password,email, fullname, number_phone, status From accounts where username = ? And email = ?")
                        .bind(0, username).bind(1, email).mapToBean(Account.class).stream().findFirst()
        );
        return account.isEmpty() ? null : account.get();
    }

    public static boolean createAccount(String username, String password, String email, String fullname, String number_phone, int status) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("INSERT INTO accounts(username, password, email, fullname, number_phone, status) " +
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

}
