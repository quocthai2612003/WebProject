package model;

public class Order_detail {
    String idOrder;
    String idProduct;
    int quantity;
    int price;
    public Order_detail() {

    }

    public Order_detail(String idOrder, String idProduct, int quantity, int price) {
        this.idOrder = idOrder;
        this.idProduct = idProduct;
        this.quantity = quantity;
        this.price = price;
    }

    public String getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(String idOrder) {
        this.idOrder = idOrder;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public int getQuanlity() {
        return quantity;
    }

    public void setQuanlity(int quantity) {
        this.quantity = quantity;
    }


    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Order_detail{" +
                "idOrder=" + idOrder +
                ", idProduct='" + idProduct + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                '}';
    }
    public int totalPrice(){
        return this.quantity * this.price;
    }
    Product product;

    public Product getProduct() {

        return product;
    }
}
