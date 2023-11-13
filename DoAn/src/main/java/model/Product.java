package model;

import java.util.ArrayList;
import java.util.List;

public class Product {
    private String title;
    private int price;
    private static List<Product> list = new ArrayList<Product>();
    static {
        createData();
    }
    public Product() {
    }

    public Product(String title, int price) {
        this.title = title;
        this.price = price;
    }

    public static List<Product> createData() {
        for (int i = 0; i < 55; i++) {
            list.add(new Product("Dây nịt", 100000));
        }

        return list;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public static List<Product> getList() {
        return list;
    }

    public void setList(List<Product> list) {
        this.list = list;
    }
}
