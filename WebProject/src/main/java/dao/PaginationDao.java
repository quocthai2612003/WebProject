package dao;

import model.Product;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class PaginationDao {
    private static Jdbi JDBI;

    public static List<Product> productByCategory(int limit, int page, String id_category) {
        JDBI = ConnectJDBI.connector();
        List<Product> listProducts = JDBI.withHandle(handle ->
                handle.createQuery("Select ID, name, price, ID_category From products " +
                                "Where ID_category = ?" +
                                "Limit ? Offset ?")
                        .bind(0, id_category)
                        .bind(1, limit)
                        .bind(2, page).mapToBean(Product.class).stream().toList());
        return listProducts;
    }


    public static List<Product> productByCategoryAndSortByPrice(int limit, int page, String id_category, String sort) {
        JDBI = ConnectJDBI.connector();
        List<Product> listProducts = JDBI.withHandle(handle ->
                handle.createQuery("Select ID, name, price, ID_category From products " +
                                "Where ID_category = ?" +
                                "Order By price " + sort + " " +
                                "Limit ? Offset ?")
                        .bind(0, id_category)
                        .bind(1, limit)
                        .bind(2, page).mapToBean(Product.class).stream().toList());
        return listProducts;
    }

    private static int[] priceFilter(int filter) {
        int minPrice = 0;
        int maxPrice = 0;
        int[] priceFilter = new int[2];
        switch (filter) {
            case 1: {
                minPrice = 0;
                maxPrice = 50000;
                break;
            }
            case 2: {
                minPrice = 50000;
                maxPrice = 100000;
                break;
            }
            case 3: {
                minPrice = 100000;
                maxPrice = 300000;
                break;
            }
            case 4: {
                minPrice = 300000;
                maxPrice = 500000;
                break;
            }
            case 5: {
                minPrice = 500000;
                maxPrice = Integer.MAX_VALUE;
                break;
            }
        }
        priceFilter[0] = minPrice;
        priceFilter[1] = maxPrice;
        return priceFilter;
    }
    public static List<Product> productByCategoryAndFilterByPrice(int limit, int page, String id_category, String filter) {
        JDBI = ConnectJDBI.connector();
        int filter_id = Integer.valueOf(filter);
        int[] priceFilter = priceFilter(filter_id);
        int minPrice = priceFilter[0];
        int maxPrice = priceFilter[1];
        List<Product> listProducts = JDBI.withHandle(handle ->
                handle.createQuery("Select ID, name, price, ID_category From products " +
                                "Where price between ? and ? And ID_category = ? Limit ? Offset ?")
                        .bind(0, minPrice)
                        .bind(1, maxPrice)
                        .bind(2, id_category)
                        .bind(3, limit)
                        .bind(4, page).mapToBean(Product.class).stream().toList());
        return listProducts;
    }
}
