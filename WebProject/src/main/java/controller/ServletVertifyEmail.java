package controller;

import dao.AccountDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "vertifyEmail", value = "/vertifyEmail")
public class ServletVertifyEmail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code") == null ? "" : req.getParameter("code");
        AccountService as = AccountService.getInstance();
        if(as.isCodeVertifyEmail(code)) {
            String fullname = req.getAttribute("fullname") == null ? "" : req.getAttribute("fullname").toString();
            String phone = req.getAttribute("phone") == null ? "" : req.getAttribute("phone").toString();
            String username = req.getAttribute("username") == null ? "" : req.getAttribute("username").toString();
            String email = req.getAttribute("email") == null ? "" : req.getAttribute("email").toString();
            String password = req.getAttribute("password") == null ? "" : req.getAttribute("password").toString();
            if (as.createAccount(username, password, email, fullname, phone, 1)) {
                resp.sendRedirect("/login");
            }
        }
    }
}
