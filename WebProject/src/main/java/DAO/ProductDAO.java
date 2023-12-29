package DAO;

import Beans.Product;
import org.jdbi.v3.core.Jdbi;
import JDBIConnector.ConnectJDBI;

import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

public class ProductDAO {
    private static final Logger LOGGER = Logger.getLogger(ProductDAO.class.getName());

    public List<Product> findByType(String type) {
        Jdbi jdbi = ConnectJDBI.connector();
        List<Product> products;
        try {
            products = jdbi.withHandle(handle -> {
                String sql = "SELECT * FROM products WHERE TYPE = :type";
                return handle.createQuery(sql)
                        .bind("type", type)
                        .mapToBean(Product.class)
                        .stream()
                        .collect(Collectors.toList());
            });
            LOGGER.log(Level.INFO, "Retrieved products: {0}", products);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving products by type: " + type, e);
            throw new RuntimeException("Error retrieving products by type", e);
        }
        return products;
    }
    public Product getProductById(int productId) {
        Jdbi jdbi = ConnectJDBI.connector();
        try {
            return jdbi.withHandle(handle -> {
                String sql = "SELECT * FROM products WHERE id = :id";
                return handle.createQuery(sql)
                        .bind("id", productId)
                        .mapToBean(Product.class)
                        .findFirst()
                        .orElse(null);
            });
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving product by ID: " + productId, e);
            throw new RuntimeException("Error retrieving product by ID", e);
        }
    }


//    public static void main(String[] args) {
//        ProductDAO productDAO = new ProductDAO();
//        List<Product> products = productDAO.findByType("nam");
//        productDAO.getProductById(1);
//
//        // Print or log the retrieved products
//        System.out.println("Retrieved products: " + products);
//    }

}
