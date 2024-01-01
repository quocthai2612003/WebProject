package dao;

import model.Account;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;

import java.util.Optional;

public class AccountDAO {

    public static Account accountByUsername(String username) {
        Jdbi JDBI = ConnectJDBI.connector();
        Optional<Account> account = JDBI.withHandle(handle ->
                handle.createQuery("Select id, username, password,email, fullname, number_phone, status From accounts where username = ?")
                        .bind(0, username).mapToBean(Account.class).stream().findFirst()
        );
        return account.isEmpty() ? null : account.get();
    }

    public static boolean createAccount(String username, String password, String email, String fullname, String number_phone) {
        Jdbi JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("INSERT INTO accounts(username, password, email, fullname, number_phone, status) " +
                                "VALUES (?, ?, ?, ?, ?, ?)")
                        .bind(0, username)
                        .bind(1, password)
                        .bind(2, email)
                        .bind(3, fullname)
                        .bind(4, number_phone)
                        .bind(5, 0)
                        .execute());
        return true;
    }

    public static void main(String[] args) {

    }
}
