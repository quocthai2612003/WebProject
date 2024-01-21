package dao;

import model.Account;
import org.jdbi.v3.core.Jdbi;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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

    public static int createVerifyEmail(String code, String dateCreate, String dateExpired,boolean status, int idAccount) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("INSERT INTO verify_email(code, date_created, date_expired, status, ID_account) " +
                                "VALUES (?, ?, ?, ?, ?)")
                        .bind(0, code)
                        .bind(1, dateCreate)
                        .bind(2, dateExpired)
                        .bind(3, status)
                        .bind(4, idAccount)
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
                                "WHERE verify_email.code = ? AND verify_email.date_expired > ? AND verify_email.status = 0")
                        .bind(0, code)
                        .bind(1, formatDate)
                        .mapToBean(Account.class).stream().findFirst()
        );
        int execute = 0;
        if (!account.isEmpty()) {
            execute = updateStatusVerifyEmail(code);
        }
        if (execute > 0) return account.get();
        return null;
    }

    private static int updateStatusVerifyEmail(String code) {
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("UPDATE verify_email SET status = 1 WHERE code = ?")
                        .bind(0, code).execute());
        return execute;
    }
    public static int updatePasswordAccount(int id, String password) {
        JDBI = ConnectJDBI.connector();
        int execute = JDBI.withHandle(handle ->
                handle.createUpdate("UPDATE accounts SET password = ? WHERE id = ?")
                        .bind(0, password)
                        .bind(1, id).execute()
        );
        return execute;
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

    public static int test() {
        JDBI = ConnectJDBI.connector();
        int index = 116;
        int execute = 0;
        for (int i = 2; i<=101; i++) {
            int finalI = i;
            int finalIndex = index;
            execute += JDBI.withHandle(handle ->
                    handle.createUpdate("Update images set ID = ? where ID = ?")
                            .bind(0, finalIndex)
                            .bind(1, finalI).execute());
            index++;
        }

        return execute;
    }

    public static void main(String[] args) {
        System.out.println(test());
    }


}
