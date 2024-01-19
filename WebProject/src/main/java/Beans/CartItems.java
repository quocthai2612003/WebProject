package Beans;

public class CartItems {
    private Products products;
    private int quantity;

    public CartItems (Products products, int quantity) {
        this.products = products;
        this.quantity = quantity;
    }

    public Products getProduct() {
        return products;
    }

    public void setProduct(Products products) {
        this.products = products;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void increaseQuantity(int quantity) {
        this.quantity += quantity;
    }

    public void decreaseQuantity(int quantity) {
        this.quantity -= quantity;
        if (this.quantity < 0) {
            this.quantity = 0;
        }
    }

    public double getTotalPrice() {
        return quantity * products.getPrice();
    }
}

