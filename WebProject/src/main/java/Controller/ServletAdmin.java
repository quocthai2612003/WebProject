package Controller;

import Service.AccountService;
import Service.OrderService;
import Service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Calendar;
import java.util.Map;

@WebServlet(name = "ServletAdmin", value = "/admin")
public class ServletAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        AccountService as = AccountService.getInstance();
        ProductService ps = ProductService.getInstance();
        OrderService or = OrderService.getInstance();
        int totalAccounts = as.totalAcount();
        int totalProducts = ps.totalQuantityProduct();
        int totalOrders = or.totalOrder();
        int totalReviews = 82;
        int year = Calendar.getInstance().getTime().getYear() + 1900;
        String date = req.getParameter("date") == null ? year + "-01-01" : req.getParameter("date");
        Map<String, String> categorys = ps.selectCategory();
        int quantityCategory = categorys.size();
        String[] nameCategorys = new String[quantityCategory];
        int[] quantityProductByCategorys = new int[quantityCategory];
        int[] quantityProductSoldByCategorys = new int[quantityCategory];
        int[] revenueOfCategorys = new int[quantityCategory];
        int index = 0;
        for (String id_category : categorys.keySet()) {
            nameCategorys[index] = categorys.get(id_category);
            quantityProductByCategorys[index] = ps.totalQuantityProductByCategory(id_category);
            quantityProductSoldByCategorys[index] = or.totalProductSoldByCategory(id_category, date);
            revenueOfCategorys[index] = or.revenueOfCategory(id_category, date);
            index++;
        }
        req.setAttribute("date", date);
        req.setAttribute("totalAccounts", totalAccounts);
        req.setAttribute("totalProducts", totalProducts);
        req.setAttribute("totalOrders", totalOrders);
        req.setAttribute("totalReviews", totalReviews);
        req.setAttribute("quantityCategory", quantityCategory);
        req.setAttribute("nameCategorys", nameCategorys);
        req.setAttribute("quantityProductByCategorys", quantityProductByCategorys);
        req.setAttribute("quantityProductSoldByCategorys", quantityProductSoldByCategorys);
        req.setAttribute("revenueOfCategorys", revenueOfCategorys);
        req.getRequestDispatcher("Admin.jsp").forward(req, resp);
    }
}
