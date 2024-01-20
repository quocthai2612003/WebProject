package controller;

import model.Account;
import service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "verifyEmail", value = "/verifyEmail")
public class ServletVerifyEmail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code") == null ? "" : req.getParameter("code");
        AccountService as = AccountService.getInstance();
        Account account = as.isVerifyEmailSuccess(code);
        if (account != null) {
            as.updateStatusAccount(account.getID());
            as.createRoleAccount(account, 1);
            resp.sendRedirect("Login.jsp");
        } else {
            resp.sendRedirect("Register.jsp");
        }
    }
}
