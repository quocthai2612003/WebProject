package Service;

import Beans.Product;
import DAO.ProductDAO;

import java.util.List;

public class ProductService {
        private static ProductService instance;

        private ProductDAO productDAO = new ProductDAO();
   //     private ShoppingCartService shoppingCart = new ShoppingCartService();

        public static ProductService getInstance() {
            if (instance == null) instance = new ProductService();
            return instance;
        }
        public List<Product> findByCategory(int id) {
            return productDAO.findByCategory(id);
        }

        public Product findById(int id) {
            return productDAO.getProductById(id);
        }
        public static void main(String[] args) {
            Product product = ProductService.getInstance().findById(1);
            System.out.println(product);
        }
    }
