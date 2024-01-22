package dao;

import model.Account;
import model.Order;
import model.Product;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class PaginationDao {
    private static Jdbi JDBI;

    public static List<Product> productList(int limit, int page) {
        JDBI = ConnectJDBI.connector();
        List<Product> listProducts = JDBI.withHandle(handle ->
                handle.createQuery("Select id, name, price, status, quantity From products " +
                                "Limit ? Offset ?")
                        .bind(0, limit)
                        .bind(1, page).mapToBean(Product.class).stream().toList());
        return listProducts;
    }

    public static List<Product> productListBySearch(String search, int limit, int page) {
        JDBI = ConnectJDBI.connector();
        List<Product> listProducts = JDBI.withHandle(handle ->
                handle.createQuery("Select id, name, price, status, quantity From products " +
                                "Where name like ? Or id like ?" +
                                "Limit ? Offset ?")
                        .bind(0, "%"+search+"%")
                        .bind(1, "%"+search+"%")
                        .bind(2, limit)
                        .bind(3, page).mapToBean(Product.class).stream().toList());
        return listProducts;
    }
    public static List<Product> productByCategory(int limit, int page, String id_category) {
        JDBI = ConnectJDBI.connector();
        List<Product> listProducts = JDBI.withHandle(handle ->
                handle.createQuery("Select id, name, price, idCategory From products " +
                                "Where idCategory = ?" +
                                "Limit ? Offset ?")
                        .bind(0, id_category)
                        .bind(1, limit)
                        .bind(2, page).mapToBean(Product.class).stream().toList());
        return listProducts;
    }


    public static List<Product> productByCategoryAndSortByPrice(int limit, int page, String id_category, String sort) {
        JDBI = ConnectJDBI.connector();
        List<Product> listProducts = JDBI.withHandle(handle ->
                handle.createQuery("Select id, name, price, idCategory From products " +
                                "Where idCategory = ?" +
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
                handle.createQuery("Select id, name, price, idCategory From products " +
                                "Where price between ? and ? And idCategory = ? Limit ? Offset ?")
                        .bind(0, minPrice)
                        .bind(1, maxPrice)
                        .bind(2, id_category)
                        .bind(3, limit)
                        .bind(4, page).mapToBean(Product.class).stream().toList());
        return listProducts;
    }

    public static int countProductByCategory(String id_category) {
        JDBI = ConnectJDBI.connector();
        Integer count = JDBI.withHandle(handle ->
                handle.createQuery("Select COUNT(id) From products Where idCategory = ?")
                        .bind(0, id_category).mapTo(Integer.class).findOnly());

        return count;
    }


    public static int countProductFilter(String filter, String id_category) {
        int filter_id = Integer.valueOf(filter);
        int[] priceFilter = priceFilter(filter_id);
        int minPrice = priceFilter[0];
        int maxPrice = priceFilter[1];
        JDBI = ConnectJDBI.connector();
        Integer count = JDBI.withHandle(handle ->
                handle.createQuery("Select COUNT(id) From products " +
                                "Where price between ? and ? And idCategory = ?")
                        .bind(0, minPrice)
                        .bind(1, maxPrice)
                        .bind(2, id_category)
                        .mapTo(Integer.class).findOnly());

        return count;
    }

    public static List<Account> accountList(int limit, int page) {
        JDBI = ConnectJDBI.connector();
        List<Account> accountList =JDBI.withHandle(handle ->
                handle.createQuery("SELECT a.id, a.username, a.email, a.fullname, a.numberPhone, al.role, a.status " +
                                "From accounts a INNER JOIN access_levels al ON a.id = al.idAccount where a.status > 0 " +
                                "Limit ? Offset ?")
                        .bind(0, limit)
                        .bind(1, page)
                        .mapToBean(Account.class).stream().toList()
        );
        return accountList;
    }

    public static List<Account> findAccountByUsername(String username, int limit, int page) {
        JDBI = ConnectJDBI.connector();
        List<Account> accountList =JDBI.withHandle(handle ->
                handle.createQuery("SELECT a.id, a.username, a.email, a.fullname, a.numberPhone, al.role, a.status " +
                                "From accounts a INNER JOIN access_levels al ON a.id = al.idAccount where a.username like ? And a.status > 0 " +
                                "Limit ? Offset ?")
                        .bind(0, "%"+username +"%")
                        .bind(1, limit)
                        .bind(2, page)
                        .mapToBean(Account.class).stream().toList()
        );
        return accountList;
    }

    public static List<Order> orderList(int limit, int page) {
        JDBI = ConnectJDBI.connector();
        List<Order> orderList =JDBI.withHandle(handle ->
                handle.createQuery("SELECT o.id, a.fullname, o.dateBuy, o.dateArrival, o.address, o.numberPhone, o.status " +
                                "From accounts a INNER JOIN orders o ON a.id = o.idAccount " +
                                "Limit ? Offset ?")
                        .bind(0, limit)
                        .bind(1, page)
                        .mapToBean(Order.class).stream().toList()
        );
        return orderList;
    }

    public static List<Order> findOrder(String search, int limit, int page) {
        JDBI = ConnectJDBI.connector();
        List<Order> orderList =JDBI.withHandle(handle ->
                handle.createQuery("SELECT o.id, a.fullname, o.dateBuy, o.dateArrival, o.address, o.numberPhone, o.status " +
                                "From accounts a INNER JOIN orders o ON a.id = o.idAccount Where a.fullname like ? " +
                                "Limit ? Offset ?")
                        .bind(0, "%" + search + "%")
                        .bind(1, limit)
                        .bind(2, page)
                        .mapToBean(Order.class).stream().toList()
        );
        return orderList;
    }

    public static void main(String[] args) {

    }
}
