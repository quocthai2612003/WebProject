package Controller;

import Model.Product;
import Model.Slider;
import Service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;


@WebServlet(name = "HomeServlet", value = "/home")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Slider> sliders = ProductService.getInstance().findAll();
        request.setAttribute("slider", sliders);
        List<Product> listProduct = ProductService.getInstance().findByCategory(1);
        List<Product> listProductVai = ProductService.getInstance().findByCategory(2);
        List<Product> listDauKhoa = ProductService.getInstance().findByCategory(3);

        List<Product> Nu = ProductService.getInstance().findByGender("Nữ");
        List<Product> Nam = ProductService.getInstance().findByGender("Nam");
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listProductVai", listProductVai);
        request.setAttribute("listDauKhoa", listDauKhoa);
        request.setAttribute("productNu", Nu);
        request.setAttribute("productNam",Nam);
        HttpSession session = request.getSession();

        Map<String, String> listImagesThumbnail = ProductService.getInstance().selectImageThumbnail();
        request.setAttribute("listImagesThumbnail", listImagesThumbnail);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle POST requests if needed
    }
}