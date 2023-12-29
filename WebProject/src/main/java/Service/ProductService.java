package Service;

import Beans.Product;
import DAO.ProductDAO;

import java.util.List;

public class ProductService {
private ProductDAO  productDAO = new ProductDAO();
private ShoppingCartService shoppingCart = new ShoppingCartService();

public List<Product> findByTitleAndType( String type){
    return productDAO.findByType(type);
}
    public void addToCart(Product product, int quantity) {
        shoppingCart.addToCart(product, quantity);
    }

    public Product findById(int id) {
        // Assuming getProductById returns a List<Product>
        List<Product> productList = (List<Product>) productDAO.getProductById(id);

        // Check if the list is not empty before calling get() on the Optional
        if (!productList.isEmpty()) {
            return productList.stream().findFirst().orElse(null);
        } else {
            // Handle the case where the product is not found
            return null; // or throw an exception, or return a default product, etc.
        }
    }
    public ShoppingCartService getShoppingCart() {
        return shoppingCart;
    }
}
