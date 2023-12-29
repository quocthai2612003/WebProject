package Beans;

public class CartItems {
        private Product product;
        private int quantity;

        public CartItems(Product product, int quantity) {
            this.product = product;
            this.quantity = quantity;
        }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    // Getter and setter methods
    public boolean addQuanlity(int quanlity){
        this.quantity+=quanlity;
        return true;
    }
    public double getTotalPrice(){
        return this.quantity*this.product.getPrice();
    }
    }

