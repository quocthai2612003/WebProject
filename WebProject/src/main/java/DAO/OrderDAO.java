package DAO;

import Model.CartItems;
import Model.Order;
import Model.Order_detail;
import Model.Product;
import org.jdbi.v3.core.Jdbi;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDAO {
    private static Jdbi JDBI;
    public static int totalOrder() {
        JDBI = ConnectJDBI.connector();
        int total = JDBI.withHandle(handle ->
                handle.createQuery("Select COUNT(id) From orders").mapTo(Integer.class).findOnly());
        return total;
    }
    public static int totalProductSoldByCategory(String id_category, String date) {
        JDBI = ConnectJDBI.connector();
        try {
            int total = JDBI.withHandle(handle ->
                    handle.createQuery("SELECT SUM(o.quantity) FROM categorys c INNER JOIN " +
                                    "products p ON c.id = p.idCategory INNER JOIN order_details o ON p.id = o.idProduct " +
                                    "INNER JOIN orders od ON o.idOrder = od.id " +
                                    "Where c.id = ? And od.dateBuy >= ? And od.status = 1")
                            .bind(0, id_category)
                            .bind(1, date).mapTo(Integer.class).findOnly());
            return total;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static int revenueOfCategory(String id_category, String date) {
        JDBI = ConnectJDBI.connector();
        try {
            int total = JDBI.withHandle(handle ->
                    handle.createQuery("SELECT SUM(o.price) FROM categorys c INNER JOIN " +
                                    "products p ON c.id = p.idCategory INNER JOIN order_details o ON p.id = o.idProduct " +
                                    "INNER JOIN orders od ON o.idOrder = od.id " +
                                    "Where c.id = ? And od.dateBuy >= ? And od.status = 1")
                            .bind(0, id_category)
                            .bind(1, date).mapTo(Integer.class).findOnly());
            return total;
        } catch (Exception e) {
            return 0;
        }
    }

    public static int totalOrderBySearch(String search) {
        JDBI = ConnectJDBI.connector();
        int total = JDBI.withHandle(handle ->
                handle.createQuery("SELECT COUNT(o.id) " +
                                "From accounts a INNER JOIN orders o ON a.id = o.idAccount Where a.fullname like ? ")
                        .bind(0, "%" + search + "%").mapTo(Integer.class).findOnly()
        );

        return total;
    }

    public static Order orderById(String idOrder) {
        JDBI = ConnectJDBI.connector();
        Order order = JDBI.withHandle(handle ->
                handle.createQuery("SELECT o.id, a.fullname, o.dateBuy, o.dateArrival, o.address, o.numberPhone, o.status" +
                        " From accounts a INNER JOIN orders o ON a.id = o.idAccount Where o.id = ?")
                        .bind(0, idOrder).mapToBean(Order.class).first());
        return order;
    }

    public static List<Order_detail> orderDetailList(String idOrder) {
        JDBI = ConnectJDBI.connector();
        List<Order_detail> orderDetailList = JDBI.withHandle(handle ->
                handle.createQuery("Select idOrder, idProduct, quantity, price From order_details " +
                        "Where idOrder = ?")
                        .bind(0, idOrder).mapToBean(Order_detail.class).stream().toList());
        return orderDetailList;
    }

    public static int totalPriceOrderDetail(String idOrder) {
        JDBI = ConnectJDBI.connector();
        try {
            int total = JDBI.withHandle(handle ->
                    handle.createQuery("Select SUM(price) from order_details Where idOrder = ?")
                            .bind(0, idOrder).mapTo(Integer.class).findOnly());
            return total;
        } catch (Exception e) {
            return 0;
        }
    }

    public static List<Order> showOrder(int id) {
        Jdbi jdbi = ConnectJDBI.connector();
        try {
            return jdbi.withHandle(handle -> {
                String sql = "SELECT od.id, od.address, od.status, od.idAccount, od.dateBuy,od.dateArrival,od.numberPhone" +
                        " FROM orders od " +
                        " WHERE od.idAccount = :id_account";

                return handle.createQuery(sql)
                        .bind("id_account", id)
                        .mapToBean(Order.class)
                        .list();
            });
        } catch (Exception e) {
            throw new RuntimeException("Error retrieving order with details for ID", e);
        }
    }
    public static List<Order_detail> getProductsForUserAndOrder(int userId, String orderId) {
        Jdbi jdbi = ConnectJDBI.connector();
        try {
            return jdbi.withHandle(handle -> {
                String sql = "SELECT od.idOrder, od.idProduct, od.quanlity, od.price , p.name " +
                        "FROM order_details od " +
                        "JOIN orders o ON od.idOrder = o.ID " +
                        "JOIN products p ON od.idProduct = p.ID " +
                        "WHERE o.idAccount = :user_id AND od.idOrder = :order_id";

                return handle.createQuery(sql)
                        .bind("user_id", userId)
                        .bind("order_id", orderId)
                        .mapToBean(Order_detail.class)
                        .list();
            });
        } catch (Exception e) {
            throw new RuntimeException("Error retrieving products for user and order IDs", e);
        }
    }
    public static String orderId() {
        Jdbi jdbi = ConnectJDBI.connector();
        String orderId = "OR0" + jdbi.withHandle(handle -> {
            return handle.createQuery("select count(id) from orders").mapTo(Integer.class).first() + 1;
        });
        return orderId;
    }
    public static   boolean addOrder(String address, int status, int id_account, Date datebuy, Date datearrival, String numberPhone){
        String id=orderId();
        Jdbi jdbi = ConnectJDBI.connector();
        int execute = jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO orders (id, address, status, idAccount, dateBuy, dateArrival, numberPhone) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?)")
                        .bind(0, id)
                        .bind(1, address)
                        .bind(2, status)
                        .bind(3, id_account)
                        .bind(4, datebuy)
                        .bind(5, datearrival)
                        .bind(6, numberPhone)
                        .execute());
        return execute>0;
    }
    public static String orderIdDetail() {
        Jdbi jdbi = ConnectJDBI.connector();
        String orderId = "OR0" + jdbi.withHandle(handle -> {
            return handle.createQuery("select count(id) from orders").mapTo(Integer.class).first() ;
        });
        return orderId;
    }
    public static List<CartItems> addProductToOrder(String idprodcut, int quantity, int price) {
        Jdbi jdbi = ConnectJDBI.connector();

        String id = orderIdDetail();
        List<CartItems> cartItemsList = new ArrayList<>();

        // Insert new order detail
        int execute = jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO order_details (idOrder, idProduct, quantity, price) VALUES (?, ?, ?, ?)")
                        .bind(0, id)
                        .bind(1, idprodcut)
                        .bind(2, quantity)
                        .bind(3, price)
                        .execute());

        // Check if the insertion was successful
        if (execute > 0) {
            // Retrieve the associated Product information
            Product product = jdbi.withHandle(handle ->
                    handle.createQuery("SELECT * FROM products WHERE id = ?")
                            .bind(0, idprodcut)
                            .mapToBean(Product.class)
                            .one()); // Assuming there should be only one matching record

            // Construct CartItems object
            if (product != null) {
                CartItems cartItems = new CartItems(product, quantity);
                cartItemsList.add(cartItems);
            }
        }

        return cartItemsList;
    }
}
