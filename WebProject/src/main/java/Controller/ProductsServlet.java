package Controller;

import Beans.Products;
import Service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductsServlet", value = "/product")
public class ProductsServlet extends HttpServlet {
    private ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_category = request.getParameter("id");
        int categoryId = Integer.parseInt(id_category);
        if (categoryId == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters");
            return;
        }


       List<Products> productsList = productService.findByCategory(categoryId);

        // Set the sliders in the request attribute
        request.setAttribute("products", productsList);


        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }

    public static void main(String[] args) {
        ProductsServlet sl = new ProductsServlet();
        sl.productService.findByCategory(1);
    }
}
