package DAO;

import Beans.Products;
import org.jdbi.v3.core.Jdbi;
import JDBIConnector.ConnectJDBI;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
public class ProductDAO {
    private static final Logger LOGGER = Logger.getLogger(ProductDAO.class.getName());

    public List<Products> findByCategory(int categoryId) {
        Jdbi jdbi = ConnectJDBI.connector();
        List<Products> products;
        try {
            products = jdbi.withHandle(handle -> {
                String sql = "SELECT p.ID, p.name, p.price, p.quanlity, p.material, p.gender, p.ID_category FROM products p where p.ID_category = :categoryId";
                return handle.createQuery(sql)
                        .bind("categoryId", categoryId)
                        .mapToBean(Products.class).stream().toList();
            });
        } catch (Exception e) {
            throw e;
        }
        return products;
    }

    public Products getProductById(String productId) {
        Jdbi jdbi = ConnectJDBI.connector();
        try {
            return jdbi.withHandle(handle -> {
                String sql = "SELECT p.ID,p.name,p.price,p.quanlity,p.material,p.gender,p.ID_category  FROM products p  on p.ID=pr.ID_product WHERE id = :id";
                return handle.createQuery(sql)
                        .bind("id", productId)
                        .mapToBean(Products.class)
                        .findFirst()
                        .orElse(null);
            });
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product by ID: " + productId, e);
            throw new RuntimeException("Error retrieving product by ID", e);
        }
    }

    public static void main(String[] args) {
        ProductDAO productDAO = new ProductDAO();
        List<Products> products = productDAO.findByCategory(1);
        if (products.isEmpty()) {
            System.out.println("No products found for the given category ID.");
        } else {
            for (Products product : products) {
                System.out.println(product);
            }
        }
    }
}
