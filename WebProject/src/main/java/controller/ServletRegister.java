package controller;

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
        AccountService as = AccountService.getInstance();
        String error = "";
        req.setAttribute("fullname", fullname);
        req.setAttribute("phone", phone);
        req.setAttribute("username", username);
        req.setAttribute("email", email);
        if (as.isPhoneValid(phone) && password.equals(repeatPassword)) {
            if (as.vertifyEmail(username, email)) {
                req.setAttribute("password", password);
                req.getRequestDispatcher("vertifyEmail").forward(req, resp);
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
