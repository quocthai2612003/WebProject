package Controller;

import Model.Account;
import Service.AccountService;
import Service.PaginationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletManagerAccount", value = "/managerAccount")
public class ServletManagerAccount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AccountService accountService = AccountService.getInstance();
        PaginationService ps = PaginationService.getInstance();
        String idAccount = req.getParameter("idAccount");
        String role = req.getParameter("role");
        String status = req.getParameter("status");
        String pageCurrent = req.getParameter("page") == null ? "1" : req.getParameter("page");
        String search = req.getParameter("search");
        int page = Integer.valueOf(pageCurrent) - 1;
        int totalAccount;

        if (role != null) {
            accountService.updateRoleAccount(idAccount, Integer.parseInt(role));
        }
        if (status != null) {
            accountService.updateStatusAccount(idAccount, Integer.parseInt(status));
        }
        List<Account> accountList;
        if (search == null) {
            accountList = ps.accountList(12, page*12);
            totalAccount= AccountService.getInstance().totalAcount();;
        } else {
            accountList = ps.findAccountByUsername(search,12, page*12);
            totalAccount = AccountService.getInstance().totalAccountBySearch(search);
        }
        int totalPage = totalAccount/12;
        if (totalAccount % 12 != 0) totalPage++;
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("pageCurrent", pageCurrent);
        req.setAttribute("accountList", accountList);
        req.getRequestDispatcher("ManagerAccount.jsp").forward(req,resp);
    }
}
