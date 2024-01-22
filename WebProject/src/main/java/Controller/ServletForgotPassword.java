package Controller;

import Model.Account;
import Service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletForgotPassword", value = "/forgot")
public class ServletForgotPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username") == null ? "" : req.getParameter("username");
        String email = req.getParameter("email") == null ? "" : req.getParameter("email");
        String password = req.getParameter("password") == null ? "" : req.getParameter("password");
        String repeatPassword = req.getParameter("repeatPassword") == null ? "" : req.getParameter("repeatPassword");
        String code = req.getParameter("code") == null ? "" : req.getParameter("code");
        boolean check = false;
        String notify = "";
        AccountService as = AccountService.getInstance();
        if (!username.isEmpty() && !email.isEmpty()) {
            Account account = as.accountByUsernameAndEmail(username, email);
            if ( account != null) {
                if (as.forgotPassword(account)) {
                    check = true;
                    req.setAttribute("check", check);
                    req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
                }
            } else {
                notify = "Email hoặc username không đúng";
                req.setAttribute("email", email);
                req.setAttribute("username", username);
                req.setAttribute("notify", notify);
                req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
            }
        }
        check = true;
        if (!password.isEmpty() && !repeatPassword.isEmpty() && !code.isEmpty()){
            if (password.equals(repeatPassword)) {
                Account account = as.isVerifyEmailSuccess(code);
                if (account != null) {
                    if (as.updatePasswordAccount(account.getID(), password) != 0) {
                        String success = "Thay đổi mật khẩu thành công";
                        req.setAttribute("success", success);
                        req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
                    } else {
                        notify = "Thay đổi mật khẩu không thành công vui lòng nhập lại";
                        req.setAttribute("notify", notify);
                        req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
                    }
                } else {
                    notify = "Mã code không đúng";
                    req.setAttribute("notify", notify);
                    req.setAttribute("check", check);
                    req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
                }
            } else {
                notify = "Password không trùng khớp";
                req.setAttribute("notify", notify);
                req.setAttribute("check", check);
                req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
            }
        }
        req.getRequestDispatcher("ForgotPassword.jsp").forward(req, resp);
    }
}
