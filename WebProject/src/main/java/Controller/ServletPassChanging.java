package Controller;

import Model.Account;
import Service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletPassChanging", value = "/ServletPassChanging")
public class ServletPassChanging extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String currentPassword = req.getParameter("currentPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmNewPassword = req.getParameter("confirmNewPassword");
        boolean passwordChanged = false;
        if (newPassword.equals(confirmNewPassword)) {
            HttpSession session = req.getSession();
            String username = ((Account) session.getAttribute("account")).getUsername();
            AccountService accountService = AccountService.getInstance();
            passwordChanged = accountService.changePassword(username, currentPassword, newPassword);

            if (passwordChanged) {
                req.setAttribute("success", "Password changed successfully");
            } else {
                req.setAttribute("error", "Failed to change password. Check your current password.");
            }
        } else {
            req.setAttribute("error", "New password and confirm password do not match");
        }

        req.setAttribute("PassChange", passwordChanged);
        // Forward back to the user_page.jsp with updated attributes
        req.getRequestDispatcher("users-page.jsp").forward(req, resp);
    }
    }

