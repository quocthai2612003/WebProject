package Beans;

import Service.ProductService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ShoppingCart {
    Map<Integer, CartItems> data = new HashMap<Integer, CartItems>();

    public boolean add(int maSP){
        return add(maSP, 1);
    }

    public boolean add(int maSP, int soLuong){
        Products products = ProductService.getInstance().findById(maSP);
        if (products == null) return false;
        CartItems cartItems = null;
        if (data.containsKey(maSP)) {
            cartItems = data.get(maSP);
            cartItems.increaseQuantity(soLuong);
        } else {
            cartItems = new CartItems(products, soLuong);
        }
        data.put(maSP, cartItems);
        return true;
    }

    public boolean decrease(int maSP) {
        return decrease(maSP, 1);
    }

    public boolean decrease(int maSP, int soLuong) {
        if (data.containsKey(maSP)) {
            CartItems cartItems = data.get(maSP);
            cartItems.decreaseQuantity(soLuong);
            if (cartItems.getQuantity() <= 0) {
                // Nếu số lượng giảm xuống dưới hoặc bằng 0, xóa sản phẩm khỏi giỏ hàng
                data.remove(maSP);
            }
            return true;
        }
        return false;
    }

    public int getToTal(){
        return data.size();
    }

    public List<CartItems> getDanhSachSanPham() {
        return new ArrayList<>(data.values());
    }

    public CartItems remove(int maSP) {
        return data.remove(maSP);
    }
    public int getSize (){
        return data.size();
    }

}
