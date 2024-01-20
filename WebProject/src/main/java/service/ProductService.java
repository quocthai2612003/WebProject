package service;

import dao.ProductDAO;
import model.Product;

import java.util.List;
import java.util.Map;

public class ProductService {
    private static ProductService instance;

    public static ProductService getInstance() {
        if (instance == null) instance = new ProductService();
        return instance;
    }

    public Map<String, String> selectCategory() {
        return ProductDAO.selectCategory();
    }

    public Map<String, String> selectImageThumbnail() {
        return ProductDAO.selectImageThumbnail();
    }


    public int totalProductByCategory(String id_category) {
        return ProductDAO.countProductByCategory(id_category);
    }

    public int totalProduct() {
        return ProductDAO.countProduct();
    }

}
