package Controller;

import Model.CartItems;
import Model.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteServlet", value = "/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ShoppingCart gioHang = (ShoppingCart) req.getSession().getAttribute("cart");
        List<CartItems> sanPhams = gioHang.getDanhSachSanPham();
        String masanpham = req.getParameter("masanpham").trim();
        for (CartItems sp :sanPhams) {
            if (sp.getProduct().getId().equals(masanpham)) {
                gioHang.remove(masanpham);
            }
        }
        req.setAttribute("list-sp", sanPhams);
        resp.sendRedirect("CartServlet");

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
