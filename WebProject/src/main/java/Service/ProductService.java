package Service;

import Beans.Product;
import DAO.ProductDAO;

import java.util.List;

public class ProductService {
private ProductDAO  productDAO = new ProductDAO();
public List<Product> findByTitleAndType( String type){
    return productDAO.findByType(type);
}
}
