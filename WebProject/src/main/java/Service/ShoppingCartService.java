package Service;

import Model.CartItems;
import Model.Product;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCartService {
    private List<CartItems> cartItems = new ArrayList<>();

    public List<CartItems> getCartItems() {
        return cartItems;
    }

    public void addToCart(Product products, int quantity) {
        // Check if the product is already in the cart
        for (CartItems item : cartItems) {
            if (item.getProduct().getId() == products.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }

        // If the product is not in the cart, add a new cart item
        cartItems.add(new CartItems(products, quantity));
    }
}
