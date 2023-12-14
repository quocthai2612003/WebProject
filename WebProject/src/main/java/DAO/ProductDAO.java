package DAO;

import Beans.Product;
import org.jdbi.v3.core.Jdbi;
import JDBIConnector.JDBIConnector;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class ProductDAO {
    public List<Product> findByType(String type) {
        Jdbi jdbi = JDBIConnector.getJdbi();
        List<Product> products = jdbi.withHandle(handle -> {
            String sql = "SELECT * FROM products WHERE TYPE = :type";
            return handle.createQuery(sql)
                    .bind("type", type)
                    .mapToBean(Product.class)
                    .stream()
                    .collect(Collectors.toList());
        });
        System.out.println(Arrays.toString(products.toArray()));
        return products;
    }

    public static void main(String[] args) {
                ProductDAO d1 = new ProductDAO();
        d1.findByType("nam");
    }
}
