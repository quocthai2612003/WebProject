package controller;

import model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletRegister", value = "/register")
public class ServletRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullname = req.getParameter("fullname") == null ? "" : req.getParameter("fullname");
        String email = req.getParameter("email") == null ? "" : req.getParameter("email");
        String phone = req.getParameter("phone") == null ? "" : req.getParameter("phone");
        String username = req.getParameter("username") == null ? "" : req.getParameter("username");
        String password = req.getParameter("password") == null ? "" : req.getParameter("password");
        String repeatPassword = req.getParameter("repeatPassword") == null ? "" : req.getParameter("repeatPassword");
        String notify = "";
        AccountService as = AccountService.getInstance();
        req.setAttribute("fullname", fullname);
        req.setAttribute("email", email);
        req.setAttribute("phone", phone);
        req.setAttribute("username", username);
        if (as.isPhoneValid(phone) && password.equals(repeatPassword)) {
            if (as.accountByUsernameOrEmail(username, email) == null)  {
                if (as.createAccount(username, password, email, fullname, phone, 0) != 0) {
                    Account account = as.accountByUsername(username);
                    if (as.vertifyEmail(account)) {
                        notify = "Vui lòng xác minh email";
                        req.setAttribute("notify", notify);
                        req.getRequestDispatcher("Register.jsp");
                    }
                }
            } else {
                notify = "username hoặc email đã tồn tại";
                req.setAttribute("notify", notify);
                req.getRequestDispatcher("Register.jsp").forward(req, resp);
            }
        } else {
            notify = "vui lòng kiểm tra lại thông tin đã nhập";
            req.setAttribute("notify", notify);
            req.getRequestDispatcher("Register.jsp").forward(req, resp);
        }
    }
}
