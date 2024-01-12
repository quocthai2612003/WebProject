package Beans;

public class Products {
    private int id ;
    private String name;
    private int price;
    private int quanlity;
    private String material;
    private int rating;

    public Products(int id, String name, int price, int quanlity, int rating) {
        this.id = id;

        this.name = name;
        this.price = price;
        this.quanlity = quanlity;

        this.rating=rating;
    }

    public Products() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuanlity() {
        return quanlity;
    }

    public void setQuanlity(int quanlity) {
        this.quanlity = quanlity;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    private int cartQuantity;

    public int getCartQuantity() {
        return cartQuantity;
    }

    public void setCartQuantity(int cartQuantity) {
        this.cartQuantity = cartQuantity;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", quanlity=" + quanlity +
                ", material='" + material + '\'' +
                ", rating=" + rating +
                ", cartQuantity=" + cartQuantity +
                '}';
    }
}

