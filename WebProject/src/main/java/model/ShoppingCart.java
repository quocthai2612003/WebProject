package model;

import Service.ProductService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ShoppingCart {
    Map<String, CartItems> data = new HashMap<>();

    public boolean add(String maSP) {
        return add(maSP, 1);
    }

    public boolean add(String maSP, int soLuong) {
        Product product = ProductService.getInstance().findById(maSP);
        System.out.println("Product retrieved from ProductService: " + product);

        if (product == null) {
            System.out.println("Product not found for ID: " + maSP);
            return false;
        }

        CartItems cartItems;
        if (data.containsKey(maSP)) {
            cartItems = data.get(maSP);
            cartItems.increaseQuantity(soLuong);
        } else {
            cartItems = new CartItems(product, soLuong);
        }

        data.put(maSP, cartItems);
        return true;
    }

    public boolean decrease(String maSP, int soLuong) {
        if (data.containsKey(maSP)) {
            CartItems cartItems = data.get(maSP);
            cartItems.decreaseQuantity(soLuong);
            if (cartItems.getQuantity() <= 0) {
                // If the quantity decreases to or below 0, remove the product from the cart
                data.remove(maSP);
            }
            return true;
        }
        return false;
    }

    public int getToTal() {
        return data.size();
    }

    public List<CartItems> getDanhSachSanPham() {
        return new ArrayList<>(data.values());
    }

    public CartItems remove(String maSP) {
        return data.remove(maSP);
    }

    public int getSize() {
        return data.size();
    }

    @Override
    public String toString() {
        return "ShoppingCart{" +
                "data=" + data +
                '}';
    }

    public static void main(String[] args) {
        ShoppingCart sp = new ShoppingCart();

        // Try to add a product
        boolean added = sp.add("TL003", 2);
        boolean added2 = sp.add("TL004", 2);
        boolean added3 = sp.add("TL005", 2);
        boolean decre =sp.decrease("TL003",2);

        // Print the result of the add operation
        System.out.println("Product added: " + added);

        // Print the current state of the shopping cart
        System.out.println("ShoppingCart after adding product:");
        System.out.println(sp);

        // Print the size of the shopping cart
        System.out.println("ShoppingCart size: " + sp.getSize());

        // Print details of each CartItems in the shopping cart
        List<CartItems> cartItemsList = sp.getDanhSachSanPham();
        System.out.println("Details of CartItems in the shopping cart:");
        for (CartItems cartItems : cartItemsList) {
            System.out.println("Product ID: " + cartItems.getProduct().getId());
            System.out.println("Quantity: " + cartItems.getQuantity());
            System.out.println("Total Price: " + cartItems.getTotalPrice());
            System.out.println("--------------");
        }
    }
}
