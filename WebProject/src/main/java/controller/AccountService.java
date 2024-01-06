package controller;

import dao.AccountDAO;
import model.Account;

import java.sql.Date;
import java.time.LocalDate;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AccountService {
    static AccountService userService = getInstance();

    public static AccountService getInstance() {
        if (userService == null) userService = new AccountService();
        return userService;
    }

    public boolean isPhoneValid(String phone) {
        String regex = "^0[0-9]{9}$"; // Đây là một biểu thức chính quy cơ bản cho số điện thoại 10 chữ số bắt đầu bằng số 0

        // Tạo một Pattern từ biểu thức chính quy
        Pattern pattern = Pattern.compile(regex);
        // Tạo một Matcher để so khớp chuỗi với biểu thức chính quy
        Matcher matcher = pattern.matcher(phone);
        // Kiểm tra xem chuỗi có khớp với biểu thức chính quy không
        return matcher.matches();
    }
    public Account checkLogin(String username, String password) {
        Account account = AccountDAO.accountByUsername(username);
        if (account != null) {
            if (account.getUsername().equals(username) && account.getPassword().equals(password)){
                return account;
            }
        }

        return null;
    }

    public boolean isUsernameAndEmailExisted(String username, String email) {
        Account account = AccountDAO.accountByUsernameAndEmail(username, email);
        return account != null;
    }

    public boolean vertifyEmail(String username, String email) {
        if (!isUsernameAndEmailExisted(username, email)) {
            String code = EmailService.createCode();
            String mess = "http://localhost:8080/vertifyEmail?code=" + code ;
            EmailService.send(email, "Xac nhan email", mess);
            LocalDate dateCreate = LocalDate.now();
            LocalDate dateExpired = dateCreate.plusDays(1);
            boolean status = false;
            return AccountDAO.createVertifyEmail(username, email, code, java.sql.Date.valueOf(dateCreate),
                    java.sql.Date.valueOf(dateExpired), status);
        }
        return false;
    }

    public boolean isCodeVertifyEmail(String code) {
        return AccountDAO.isCodeVertifyEmail(code);
    }

    public boolean createAccount(String username, String password, String email, String fullname, String number_phone, int status) {
        return AccountDAO.createAccount(username, password, email, fullname, number_phone, status);
    }
    public boolean isLoginSuccess(Account account) {
        return account.getStatus() != 0;
    }

    public static void main(String[] args) {
        System.out.println(AccountService.getInstance().vertifyEmail("toanphuoc", "toanphuoc2611203@gmail.com"));
    }
}
