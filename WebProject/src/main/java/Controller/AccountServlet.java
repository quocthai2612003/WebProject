package Controller;

import Beans.Account;
import Service.AccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AccountServlet", value = "/user")
public class AccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final AccountService accountService = new AccountService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = (String) request.getSession().getAttribute("currentUsername");

            if (username == null) {
                response.sendRedirect("/login");
                return;
            }

            Account currentUser = (Account) request.getSession().getAttribute("currentUser");

            if (currentUser == null) {
                // Fetch the user information from the service using the username
                currentUser = accountService.getAccountInfo(username);

                if (currentUser == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Account not found for username: " + username);
                    return;
                }

                request.getSession().setAttribute("currentUser", currentUser);
            }

            // Set the currentUser attribute to be accessed in the JSP page
            request.setAttribute("currentUser", currentUser);

            // Forward to the user page JSP relative to the root context
            String contextPath = request.getContextPath();
            RequestDispatcher dispatcher = request.getRequestDispatcher("/user");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching account information");
        }
    }
}
