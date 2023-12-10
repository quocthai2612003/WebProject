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
        List<Product> productList = Product.createData();
        req.setAttribute("productList", productList);
        int page = req.getParameter("page") == null ? 1 : Integer.parseInt(req.getParameter("page"));
        int productsOnPage = 12;
        int totalPage = productList.size() / productsOnPage;
        if (productList.size() % productsOnPage != 0) totalPage++;
        req.setAttribute("totalPage", totalPage);
        req.setAttribute("page", page);
        String category = req.getParameter("category") != null ? req.getParameter("category")
                : "day-nit-da";
        String img;
        if (category.equals("day-nit-da")) {
            img = "./assets/images/product_img/day-nit-da.jpg";
        } else if (category.equals("day-nit-vai")) {
            img = "./assets/images/product_img/day-nit-vai.jpg";
        } else if (category.equals("day-nit-nam")) {
            img = "./assets/images/product_img/day-nit-nam.jpg";
        } else if (category.equals("day-nit-nu")){
            img = "./assets/images/product_img/day-nit-nu.jpg";
        } else {
            img = "./assets/images/product_img/day-nit-tre-em.jpg";
        }
        req.setAttribute("category", category);
        req.setAttribute("img", img);
        req.getRequestDispatcher("Product.jsp").forward(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
