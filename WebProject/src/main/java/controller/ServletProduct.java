package controller;

import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletProduct", value = "/product")
public class ServletProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id_category = req.getParameter("category") == null ? "1" : req.getParameter("category");
        String pageCurrent = req.getParameter("page") == null ? "1" : req.getParameter("page");
        int page = Integer.valueOf(pageCurrent) - 1;
        ProductService ps = ProductService.getInstance();
        List<Product> listProduct = ps.paginationProduct(12, page*12, id_category);
        int totalProduct = ps.totalProduct();
        int totalPage = totalProduct/12;
        if (totalProduct % 12 != 0) totalPage++;
        req.setAttribute("listProduct", listProduct);
        req.setAttribute("ps", ps);
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("pageCurrent", pageCurrent);
        req.setAttribute("id_category", id_category);
        req.getRequestDispatcher("Product.jsp").forward(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
