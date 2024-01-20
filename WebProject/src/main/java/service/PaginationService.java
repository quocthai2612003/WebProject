package service;

import dao.PaginationDao;
import dao.ProductDAO;
import model.Product;

import java.util.List;

public class PaginationService {

    private static PaginationService instance;

    public static PaginationService getInstance() {
        if (instance == null) instance = new PaginationService();
        return instance;
    }

    public List<Product> ProductDefault(int limit, int page, String id_category) {
        return PaginationDao.productByCategory(limit, page, id_category);
    }
    public List<Product> productSort(int limit, int page, String id_category, String sort) {
        return PaginationDao.productByCategoryAndSortByPrice(limit, page, id_category, sort);
    }

    public List<Product> ProductFilter(int limit, int page, String id_category, String filter) {
        return PaginationDao.productByCategoryAndFilterByPrice(limit, page, id_category, filter);
    }

}
