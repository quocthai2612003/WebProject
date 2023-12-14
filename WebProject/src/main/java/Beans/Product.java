package Beans;

public class Product {
    private int id ;
    private String type;
    private String name;
    private int price;
    private int quanlity;
    private String material;
    private String size;
    private int rating;

    public Product(int id, String type, String name, int price, int quanlity, String size,int rating) {
        this.id = id;
        this.type=type;
        this.name = name;
        this.price = price;
        this.quanlity = quanlity;
        this.size = size;
        this.rating=rating;
    }

    public Product() {
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

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", quanlity=" + quanlity +
                ", material='" + material + '\'' +
                ", size='" + size + '\'' +
                ", rating=" + rating +
                '}';
    }
}

