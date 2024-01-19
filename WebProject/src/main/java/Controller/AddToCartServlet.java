package Controller;

import Beans.Products;
import Beans.ShoppingCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddToCartServlet", value = "/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("AddToCartServlet doPost method is called");

        HttpSession session = req.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        if (cart == null) cart = new ShoppingCart();
        System.out.println("Entering AddToCartServlet");
        String maSp = req.getParameter("masanpham");
        System.out.println("masanpham parameter: " + maSp);
        if (maSp != null && !maSp.isEmpty()) {
            cart.add(maSp);
            session.setAttribute("cart", cart);
            System.out.println("add success");
        }
        resp.sendRedirect("home");
        System.out.println(cart.getSize());
    }
}
