package Controller;


import DAO.AccountDAO;
import Model.Account;
import Service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ServletLogin", value = "/login")
public class ServletLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username") == null ? "" : req.getParameter("username");
        String password = req.getParameter("password") == null ? "" : req.getParameter("password");
        AccountService as = AccountService.getInstance();
        Account account = as.checkLogin(username, password);
        if (username.isEmpty() || password.isEmpty()) {
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
        } else {
            if (account != null) {
                if (as.isLoginSuccess(account)) {
                    HttpSession session = req.getSession();
                    session.setAttribute("account", account);
                    if (AccountDAO.roleAccount(account.getID() + "") == 1) {
                        resp.sendRedirect("./home");
                    } else {
                        resp.sendRedirect("./admin");
                    }
                } else {
                    req.setAttribute("error", "Tài khoản chưa được xác nhận hoặc đã bị khóa");
                    req.getRequestDispatcher("Login.jsp").forward(req, resp);
                }
            } else {
                req.setAttribute("error", "Bạn nhập sai email hoặc mật khẩu");
                req.getRequestDispatcher("Login.jsp").forward(req, resp);
            }
        }
    }
}
