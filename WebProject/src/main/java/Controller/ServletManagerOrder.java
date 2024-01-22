package Controller;

import DAO.OrderDAO;
import Model.Order;
import Model.Order_detail;
import Service.OrderService;
import Service.PaginationService;
import Service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletManagerOrder", value = "/managerOrder")
public class ServletManagerOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        PaginationService ps = PaginationService.getInstance();
        ProductService productService = ProductService.getInstance();
        String id = req.getParameter("id");
        String pageCurrent = req.getParameter("page") == null ? "1" : req.getParameter("page");
        String search = req.getParameter("search");
        int page = Integer.valueOf(pageCurrent) - 1;
        int totalOrder;
        System.out.println(id);
        List<Order> orderList;
        if (search == null) {
            orderList = ps.orderList(12, page*12);
            totalOrder= OrderService.getInstance().totalOrder();;
        } else {
            orderList = ps.findOrder(search,12, page*12);
            totalOrder = OrderService.getInstance().totalOrderBySearch(search);
        }
        if (id != null) {
            List<Order_detail> orderDetailList = OrderDAO.orderDetailList(id);
            int totalPrice = OrderDAO.totalPriceOrderDetail(id);
            Order order = OrderDAO.orderById(id);
            req.setAttribute("order", order);
            req.setAttribute("orderDetailList", orderDetailList);
            req.setAttribute("totalPrice", totalPrice);
        }
        int totalPage = totalOrder/12;
        if (totalOrder % 12 != 0) totalPage++;
        req.setAttribute("id", id);
        req.setAttribute("ps", productService);
        req.setAttribute("orderList", orderList);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("pageCurrent", pageCurrent);
        req.getRequestDispatcher("ManagerOrder.jsp").forward(req, resp);
    }
}
