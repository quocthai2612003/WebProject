package controller;

import dao.AccountDAO;
import model.Account;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AccountService {
    static AccountService userService = getInstance();

    public static AccountService getInstance() {
        if (userService == null) userService = new AccountService();
        return userService;
    }

    public Account accountByUsername(String username) {
        return AccountDAO.accountByUsername(username);
    }

    public Account accountByUsernameOrEmail(String username, String email) {
        return AccountDAO.accountByUsernameOrEmail(username, email);
    }
        // Chức năng đăng nhập
    public Account checkLogin(String username, String password) {
        Account account = AccountDAO.accountByUsername(username);
        if (account != null) {
            if (account.getUsername().equals(username) && account.getPassword().equals(password)){
                return account;
            }
        }

        return null;
    }

    public boolean isLoginSuccess(Account account) {
        return account.getStatus() == 1;
    }
        // Chức năng đăng ký
    public boolean isPhoneValid(String phone) {
        String regex = "^0[0-9]{9}$"; // Đây là một biểu thức chính quy cơ bản cho số điện thoại 10 chữ số bắt đầu bằng số 0

        // Tạo một Pattern từ biểu thức chính quy
        Pattern pattern = Pattern.compile(regex);
        // Tạo một Matcher để so khớp chuỗi với biểu thức chính quy
        Matcher matcher = pattern.matcher(phone);
        // Kiểm tra xem chuỗi có khớp với biểu thức chính quy không
        return matcher.matches();
    }

    public boolean vertifyEmail(Account account) {
        String code = EmailService.createCode();
        String mess = "http://localhost:8080/verifyEmail?code=" + code ;
        Calendar date = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formatDateCreate = dateFormat.format(date.getTime());
        date.add(Calendar.DAY_OF_MONTH, 1);
        String formatDateExpired = dateFormat.format(date.getTime());
        if (AccountDAO.createVerifyEmail(code, formatDateCreate,
                formatDateExpired, account.getID()) != 0) {
            return EmailService.send(account.getEmail(), "Xac nhan email", mess);
        }
        return false;
    }

    public Account isVerifyEmailSuccess(String code) {
        return AccountDAO.isVerifyEmailSuccess(code);
    }

    public int createAccount(String username, String password, String email, String fullname, String number_phone, int status) {
        return AccountDAO.createAccount(username, password, email, fullname, number_phone, status);
    }

    public int deleteAccount(String username, String email) {
        return AccountDAO.deleteAccount(username, email);
    }

    public int updateStatusAccount(int id) {
        return AccountDAO.updateStatusAccount(id);
    }

    public int createRoleAccount(Account account, int role) {
        return AccountDAO.createRoleAccount(account, role);
    }


    public static void main(String[] args) {

    }
}
