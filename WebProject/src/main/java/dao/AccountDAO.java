package dao;

import controller.AccountService;
import model.Account;
import org.jdbi.v3.core.Jdbi;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
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

    public static Account accountByUsernameOrEmail(String username, String email) {
        JDBI = ConnectJDBI.connector();
        Optional<Account> account = JDBI.withHandle(handle ->
                handle.createQuery("Select id, username, password,email, fullname, number_phone, status From accounts where username = ? And email = ?")
                        .bind(0, username).bind(1, email).mapToBean(Account.class).stream().findFirst()
        );
        return account.isEmpty() ? null : account.get();
    }

    public static int createAccount(String username, String password, String email, String fullname, String number_phone, int status) {
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
        return execute;
    }

    public static int deleteAccount(String username, String email) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("DELETE FROM accounts WHERE username = ? And email = ?")
                        .bind(0, username)
                        .bind(1, email).execute()
        );
        return execute;
    }

    public static int updateStatusAccount(int id) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("UPDATE accounts SET status = 1 WHERE id = ?")
                        .bind(0, id).execute()
        );
        return execute;
    }

    public static int createVerifyEmail(String code, String dateCreate, String dateExpired, int idAccount) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("INSERT INTO verify_email(code, date_created, date_expired, ID_account) " +
                                "VALUES (?, ?, ?, ?)")
                        .bind(0, code)
                        .bind(1, dateCreate)
                        .bind(2, dateExpired)
                        .bind(3, idAccount)
                        .execute());
        return execute;
    }

    public static Account isVerifyEmailSuccess(String code) {
        JDBI = ConnectJDBI.connector();
        Calendar date = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formatDate = dateFormat.format(date.getTime());
        Optional<Account> account = JDBI.withHandle(handle ->
                handle.createQuery("SELECT accounts.ID, accounts.username, accounts.password, " +
                        "accounts.email, accounts.fullname, accounts.number_phone, accounts.status " +
                        "FROM accounts " +
                        "INNER JOIN verify_email ON accounts.id = verify_email.ID_account " +
                        "WHERE verify_email.code = ? AND verify_email.date_expired > ?")
                        .bind(0, code)
                        .bind(1, formatDate)
                        .mapToBean(Account.class).stream().findFirst()
        );
        return account.isEmpty() ? null : account.get();
    }

    public static int createRoleAccount(Account account, int role) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("INSERT INTO access_levels(role, ID_account) " +
                        "VALUES(?, ?)")
                        .bind(0, role)
                        .bind(1, account.getID()).execute()
                );

        return execute;
    }

    public static void main(String[] args) {

    }
}
