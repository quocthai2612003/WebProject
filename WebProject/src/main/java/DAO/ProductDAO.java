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
                String sql = "SELECT * FROM products WHERE ID_category = :categoryId";
                return handle.createQuery(sql)
                        .bind("categoryId", categoryId)
                        .mapToBean(Products.class)
                        .stream()
                        .collect(Collectors.toList());
            });
            LOGGER.log(Level.INFO, "Retrieved products for category ID {0}: {1}", new Object[]{categoryId, products});
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving products by category ID: " + categoryId, e);
            throw new RuntimeException("Error retrieving products by category ID", e);
        }
        return products;
    }

    public Products getProductById(int productId) {
        Jdbi jdbi = ConnectJDBI.connector();
        try {
            return jdbi.withHandle(handle -> {
                String sql = "SELECT * FROM products WHERE id = :id";
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
        productDAO.getProductById(1);

        // Print or log the retrieved products
        System.out.println("Retrieved products: " + products);
    }
}
