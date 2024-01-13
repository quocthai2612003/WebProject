package Beans;

public class Products {
    private String id ;
    private String name;
    private int price;
    private int quanlity;
    private String material;

    private String gender;

    private String ID_category;
    private int rating;

    public Products(String id, String name, int price, int quanlity, String material, String gender, String ID_category,int rating ) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quanlity = quanlity;
        this.material = material;
        this.gender = gender;
        this.ID_category = ID_category;
        this.rating = rating;
    }

    public Products() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getID_category() {
        return ID_category;
    }

    public void setID_category(String ID_category) {
        this.ID_category = ID_category;
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

    private int cartQuantity;

    public int getCartQuantity() {
        return cartQuantity;
    }

    public void setCartQuantity(int cartQuantity) {
        this.cartQuantity = cartQuantity;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Products{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", quanlity=" + quanlity +
                ", material='" + material + '\'' +
                ", gender='" + gender + '\'' +
                ", ID_category='" + ID_category + '\'' +
                ", rating=" + rating +
                '}';
    }
}

