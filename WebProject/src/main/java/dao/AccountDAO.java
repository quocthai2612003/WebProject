package dao;

import model.Account;
import org.jdbi.v3.core.Jdbi;

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
}
