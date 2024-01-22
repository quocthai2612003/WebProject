package controller;

import model.Product;
import service.PaginationService;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ServletProduct", value = "/product")
public class ServletProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String id_category = req.getParameter("category") == null ? "1" : req.getParameter("category");
        String pageCurrent = req.getParameter("page") == null ? "1" : req.getParameter("page");
        String sort = req.getParameter("order");
        String filter = req.getParameter("filter");
        int page = Integer.valueOf(pageCurrent) - 1;
        ProductService ps = ProductService.getInstance();
        PaginationService paginationService = PaginationService.getInstance();
        List<Product> listProduct;
        int totalProduct;
        if (sort == null && filter == null) {
            listProduct = paginationService.ProductDefault(12, page*12, id_category);
            totalProduct = paginationService.totalProductByCategory(id_category);
        } else if (sort != null && filter == null) {
            listProduct = paginationService.productSort(12, page*12, id_category, sort);
            totalProduct = paginationService.totalProductByCategory(id_category);
        } else {
            listProduct = paginationService.ProductFilter(12, page*12, id_category, filter);
            totalProduct = paginationService.totalProductByFilter(filter, id_category);
        }
        int totalPage = totalProduct/12;
        if (totalProduct % 12 != 0) totalPage++;
        req.setAttribute("listProduct", listProduct);
        req.setAttribute("ps", ps);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("pageCurrent", pageCurrent);
        req.setAttribute("category", id_category);
        req.setAttribute("order", sort);
        req.setAttribute("filter", filter);
        req.getRequestDispatcher("Product.jsp").forward(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
