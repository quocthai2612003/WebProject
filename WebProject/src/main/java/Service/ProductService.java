package Service;

import Beans.Products;
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
        public List<Products> findByCategory(int id) {
            return productDAO.findByCategory(id);
        }

        public Products findById(String id) {
            return productDAO.getProductById("id");
        }

    public static void main(String[] args) {
        ProductService ps= new ProductService();
        ps.findByCategory(3);
    }
    }
