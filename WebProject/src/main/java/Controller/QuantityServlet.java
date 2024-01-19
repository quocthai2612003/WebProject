package Controller;

import Beans.CartItems;
import Beans.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "QuantityServlet", value = "/QuantityServlet")
public class QuantityServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ShoppingCart gioHang = (ShoppingCart) req.getSession().getAttribute("cart");
        List<CartItems> sanPhams = gioHang.getDanhSachSanPham();
        String hanhdong = req.getParameter("thuchien");
        String masanpham = req.getParameter("masanpham");
        if (hanhdong != null && masanpham !=null){
            if (hanhdong.equals("tang")){
                for (CartItems sp: sanPhams){
                    if (sp.getProduct().getId().equals(masanpham)){
                        gioHang.add(masanpham, 1);
                    }
                }
            }
            if (hanhdong.equals("giam")){
                for (CartItems sp: sanPhams){
                    if (sp.getProduct().getId().equals(masanpham)){
                        gioHang.decrease(masanpham, 1);
                    }
                }
            }
        }
        req.setAttribute("list-sp", sanPhams);
        resp.sendRedirect("CartServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
