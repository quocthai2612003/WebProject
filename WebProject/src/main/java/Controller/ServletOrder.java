package Controller;

import model.*;
import Service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ServletOrder", value = "/ServletOrder")
public class ServletOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null) {
            int id = account.getID();
            String phoneNumber = req.getParameter("phoneNumber");
            String address = req.getParameter("addressInput");
            int status = 0;
            Date datebuy = new Date();
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(datebuy);
            calendar.add(Calendar.DAY_OF_MONTH, 7);
            Date arrivalDate = calendar.getTime();
            boolean addOrder = OrderService.addOrder(address, status, id, datebuy, arrivalDate,phoneNumber);

            if (addOrder) {
                List<CartItems> cartItemsList = (List<CartItems>) session.getAttribute("list-sp");

                for (CartItems cartItem : cartItemsList) {
                    int quantity = cartItem.getQuantity();
                    int price = cartItem.getProduct().getPrice();
                    String id_product = cartItem.getProduct().getId();
                    OrderService.getInstance().addProductToOrder(id_product, quantity, price);
                }

                clearCart(session);

                req.setAttribute("addOrder", addOrder);
                req.getRequestDispatcher("./home").forward(req, resp);
            } else {
                resp.sendRedirect("error.jsp");
            }
        } else {
            resp.sendRedirect("index.jsp");
        }
    }
    private void clearCart(HttpSession session) {
        // Assuming you have stored cart items in the session with a key "cartItems"
        session.removeAttribute("cart");
        // You might need to perform additional steps based on how your cart is managed
    }
}
