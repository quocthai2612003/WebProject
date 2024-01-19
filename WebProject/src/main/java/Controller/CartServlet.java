package Controller;

import Beans.CartItems;
import Beans.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ShoppingCart gioHang = (ShoppingCart) req.getSession().getAttribute("cart");
        if (gioHang == null) {
            gioHang = new ShoppingCart();
            req.getSession().setAttribute("cart", gioHang);
        }

        List<CartItems> danhSachSanPham = gioHang.getDanhSachSanPham();
        req.setAttribute("list-sp", danhSachSanPham);
        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
