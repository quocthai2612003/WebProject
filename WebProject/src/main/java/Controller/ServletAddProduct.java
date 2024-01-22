package Controller;

import Service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Collection;

@WebServlet(name = "ServletAddProduct", value = "/addProduct")
@MultipartConfig(
        fileSizeThreshold = 1024*1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024*1024*100
)
public class ServletAddProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String quantity = req.getParameter("quantity");
        String material = req.getParameter("material");
        String size = req.getParameter("size");
        String color = req.getParameter("color");
        String gender = req.getParameter("gender");
        String idCategory = req.getParameter("idCategory");
        ProductService ps = ProductService.getInstance();
        String priceInt;
        try {
            priceInt = NumberFormat.getInstance().parse(price).intValue() + "";
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        String notify = "";
        if (ps.insertProduct(id, name, priceInt, quantity, material, size, color, gender, idCategory) > 0) {
            Collection<Part> parts = req.getParts();
            String path = "./assets/images/product_img/";
            for (Part part : parts) {
                String fileName = part.getSubmittedFileName();
                if (fileName != null) {
                    part.write(path + fileName);
                    if (part.getName().equalsIgnoreCase("thumbnail")) {
                        ps.insertImage(id, path + fileName, true);
                    } else {
                        ps.insertImage(id, path + fileName, false);
                    }
                }
            }
            notify = "Thêm sản phẩm thành công!";
            req.setAttribute("notify", notify);
            req.getRequestDispatcher("./managerProduct?page=1").forward(req, resp);
        } else {
            notify = "Thêm sản phẩm không thành công vui lòng thử lại";
            req.setAttribute("notify", notify);
            req.getRequestDispatcher("./managerProduct?page=1").forward(req, resp);
        }
    }
}
