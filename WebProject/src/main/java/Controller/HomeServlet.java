package Controller;

import Beans.Products;
import Beans.Slider;
import Service.ProductService;
import Service.SliderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final SliderService sliderService = new SliderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Slider> sliders = sliderService.findAll();
            request.setAttribute("products", sliders);
            List<Products> listProduct = ProductService.getInstance().findByCategory(1) ;
            request.setAttribute("listProduct", listProduct);
            String url = "/home.jsp";
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            // Handle the exception appropriately, e.g., log it
            e.printStackTrace();
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching products");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST requests if needed
    }
}