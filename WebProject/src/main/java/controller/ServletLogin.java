package controller;


import model.Account;

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

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username") == null ? "" : req.getParameter("username");
        String password = req.getParameter("password") == null ? "" : req.getParameter("password");
        AccountService as = AccountService.getInstance();
        Account account = as.checkLogin(username, password);
        if (account != null) {
            HttpSession session = req.getSession();
            session.setAttribute("account", account);
            resp.sendRedirect("/product");
        } else {
            req.setAttribute("error", "Bạn nhập sai email hoặc mật khẩu");
            req.getRequestDispatcher("Login.jsp").forward(req, resp);
        }
    }
}
