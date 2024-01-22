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
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String code = req.getParameter("code") == null ? "" : req.getParameter("code");
        AccountService as = AccountService.getInstance();
        Account account = as.isVerifyEmailSuccess(code);
        if (account != null) {
            as.updateStatusAccount(account.getID() + "", 0);
            as.createRoleAccount(account, 1);
            String notify = "Bạn đã đăng ký thành công";
            req.setAttribute("notify", notify);
            req.getRequestDispatcher("./login").forward(req,resp);
        } else {
            String notify = "Đăng ký thất bại vui lòng thử lại";
            req.getRequestDispatcher("Register.jsp").forward(req,resp);
            resp.sendRedirect("Register.jsp");
        }
    }
}
