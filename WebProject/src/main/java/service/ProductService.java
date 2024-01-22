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
    public  List<Product> productList() {
        return ProductDAO.productList();
    }
    public Map<String, String> selectCategory() {
        return ProductDAO.selectCategory();
    }

    public Map<String, String> selectImageThumbnail() {
        return ProductDAO.selectImageThumbnail();
    }

    public int totalQuantityProduct() {
        return ProductDAO.totalQuantityProduct();
    }

    public int totalQuantityProductByCategory(String id_category) {
        return ProductDAO.totalQuantityProductByCategory(id_category);
    }

    public int totalProduct() {
        return ProductDAO.totalProduct();
    }

    public int totalProductBySearch(String search) {
        return ProductDAO.totalProductBySearch(search);
    }

    public int insertProduct(String id, String name, String price, String quantity, String material,
                                    String size, String color, String gender, String idCategory) {
        return ProductDAO.insertProduct(id, name, price, quantity, material, size,color, gender, idCategory);
    }

    public int insertImage(String idProduct, String source, boolean is_thumbnail_image) {
        return ProductDAO.insertImages(idProduct, source, is_thumbnail_image);
    }
    public int deleteProduct(String id) {
        return ProductDAO.deleteProduct(id);
    }
    public int updateProduct(String id, int status) {
        return ProductDAO.updateProduct(id, status);
    }
}
