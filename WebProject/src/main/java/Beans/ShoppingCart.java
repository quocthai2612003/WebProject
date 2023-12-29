package Beans;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
    private List<CartItems> cartItemList;

    public ShoppingCart() {
        this.cartItemList = new ArrayList<>();
    }

    public void add(CartItems cartItem) {
        for (CartItems i : cartItemList) {
            if (i.getProduct().getId() == cartItem.getProduct().getId()) {
                i.addQuanlity(1);
                return;
            }
        }
        this.cartItemList.add(cartItem);
    }

    public void remove(int id) {
        for (CartItems c : cartItemList) {
            if (c.getProduct().getId() == id) {
                cartItemList.remove(c);
                return;
            }
        }
    }

    public void update(int id, int quanlity) {
        for (CartItems c : cartItemList) {
            if (c.getProduct().getId() == id) {
                c.setQuantity(quanlity);
                return;
            }
        }
    }

    public int getSize() {
        int re = 0;
        for (CartItems c : cartItemList) {
            re += c.getQuantity();
        }
        return re;
    }

    public List<CartItems> getCartItemList() {
        return this.cartItemList;
    }

    public double getTotalPrice() {
        double re = 0;
        for (CartItems c : cartItemList) {
            re += c.getTotalPrice();
        }
        return re;

    }
}
