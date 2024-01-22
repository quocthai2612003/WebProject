package Model;

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
        Product products = ProductService.getInstance().findById(maSP);
        System.out.println("Product retrieved from ProductService: " + products);

        if (products == null) {
            System.out.println("Product not found for ID: " + maSP);
            return false;
        }

        CartItems cartItems;
        if (data.containsKey(maSP)) {
            cartItems = data.get(maSP);
            cartItems.increaseQuantity(soLuong);
        } else {
            cartItems = new CartItems(products, soLuong);
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

}
