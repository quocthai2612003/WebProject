package model;

import java.util.ArrayList;
import java.util.List;

public class Product {
    private String id;
    private String name;
    private int price;
    private int quanlity;
    private String material;
    private String size;
    private String color;
    private String gender;

    public Product(String id, String name, int price, int quanlity, String material, String size, String color, String gender) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quanlity = quanlity;
        this.material = material;
        this.size = size;
        this.color = color;
        this.gender = gender;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public static List<Product> createData() {
        List<Product> productList = new ArrayList<Product>();
        for (int i = 0; i < 52; i++) {
            productList.add(new Product("N111V", "Dây nịt vải", 100000, 20,
                    "Vải", "M", "Màu đen", "Nam"));
        }

        return productList;
    }
}
