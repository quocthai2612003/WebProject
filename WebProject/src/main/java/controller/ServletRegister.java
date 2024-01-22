package controller;

import model.Account;
import service.AccountService;

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
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String fullname = req.getParameter("fullname") == null ? "" : req.getParameter("fullname");
        String email = req.getParameter("email") == null ? "" : req.getParameter("email");
        String phone = req.getParameter("phone") == null ? "" : req.getParameter("phone");
        String username = req.getParameter("username") == null ? "" : req.getParameter("username");
        String password = req.getParameter("password") == null ? "" : req.getParameter("password");
        String repeatPassword = req.getParameter("repeatPassword") == null ? "" : req.getParameter("repeatPassword");
        String error = "";
        AccountService as = AccountService.getInstance();
        req.setAttribute("fullname", fullname);
        req.setAttribute("email", email);
        req.setAttribute("phone", phone);
        req.setAttribute("username", username);
        if (fullname.isEmpty() || email.isEmpty() || phone.isEmpty() || username.isEmpty()) {
            req.getRequestDispatcher("Register.jsp").forward(req, resp);
        } else {
            if (as.isPhoneValid(phone) && password.equals(repeatPassword)) {
                if (as.accountByUsernameAndEmail(username, email) == null && as.accountByUsername(username) == null)  {
                    if (as.createAccount(username, password, email, fullname, phone, 0) != 0) {
                        Account account = as.accountByUsername(username);
                        if (as.vertifyEmail(account)) {
                            error = "Vui lòng xác minh email";
                            req.setAttribute("error", error);
                            req.getRequestDispatcher("Register.jsp").forward(req, resp);
                        } else {
                            req.getRequestDispatcher("Register.jsp").forward(req,resp);
                        }
                    }
                } else {
                    error = "username hoặc email đã tồn tại";
                    req.setAttribute("error", error);
                    req.getRequestDispatcher("Register.jsp").forward(req, resp);
                }
            } else {
                error = "vui lòng kiểm tra lại thông tin đã nhập";
                req.setAttribute("error", error);
                req.getRequestDispatcher("Register.jsp").forward(req, resp);
            }
        }
    }
}
