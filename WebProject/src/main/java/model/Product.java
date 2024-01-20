package model;

import java.util.ArrayList;
import java.util.List;

public class Product {
    private String id;
    private String name;
    private int price;
    private int quantity;
    private String material;
    private String size;
    private String color;
    private String gender;

    private String id_category;


    public Product() {
    }

    public Product(String id, String name, int price, int quantity, String material, String size, String color, String gender, String id_category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.material = material;
        this.size = size;
        this.color = color;
        this.gender = gender;
        this.id_category = id_category;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    public String getId_category() {
        return id_category;
    }

    public void setId_category(String id_category) {
        this.id_category = id_category;
    }
}
